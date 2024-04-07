from tabulate import tabulate
import webbrowser
import helper_func
import colorama
from termcolor import cprint
import sys
import requests
from bs4 import BeautifulSoup
from random import randint
from pathlib import Path
from string import Template

colorama.init()


class ScrapeLibgen:
    # default search type is title
    def __init__(self, query, search_type="title"):
        self.query = query
        self.search_type = search_type

        if len(self.query) < 3:
            # libgen support text length of 2
            raise Exception("Book name is too short to proceed")

    def destroy_italic_text(self, soup):
        # removes italic text from the parsed data
        title_italics = soup.find_all("i")
        for italic in title_italics:
            # Tag.decompose() removes a tag from the tree, csompletely destroys it and its contents
            italic.decompose()

    def search_initial_page(self):
        # https://libgen.is/search.php?req=java&column=title
        # https://libgen.is/search.php?req=operating%20system&column=title
        # %20 is defined as space  in URL-encode if query_parsed have space then it will replace by this %20
        # ASCII Value of space is %20

        url_encoder = "%20".join(self.query.split(" "))
        if self.search_type.lower() == "title":
            url = f"https://libgen.is/search.php?req={url_encoder}&column=title"
        elif self.search_type.lower() == "author":
            url = f"https://libgen.is/search.php?req={url_encoder}&column=author"
        return requests.get(url)

    def combined_data(self):
        raw_data = self.search_initial_page()
        # lxml parser is faster than built in html.parser
        parsed_data = BeautifulSoup(raw_data.text, "lxml")
        self.destroy_italic_text(parsed_data)
        # site contains use of  4 tables tag is in table data in table 3 so as slicing at 2 as 0 based
        parsed_table = parsed_data.find_all("table")[2]
        processed_data = []
        # don't scrape the table title data scrape from index 1 to all
        # scrape all the table row data
        for row in parsed_table.find_all("tr")[1:]:
            processed_row = []
            # find all the table data inside the table row
            for td in row.find_all("td"):
                # download link contains the title attributes like <a href="somelink.com" title="Libgen.li">[2]</a>
                # other link does not contain title attribute <a href="some.link" title="">Some Person</a>

                # search for the "a" tag if the link conatain title attribute and is not empty then append to processed_row otherwise scrape the data of td using else block so that all data is preserved
                # short circuit if false
                if (
                    td.find("a")
                    and td.find("a").has_attr("title")
                    and td.find("a")["title"] != ""
                ):
                    processed_row.append(td.a["href"])
                else:
                    #  stripped_strings is used to get the text within tag. It returns an iterator of strings where leading and trailing whitespaces have been stripped.
                    # data is preserved for further use as data contains various crucial information such as title,auther name, unique id etc
                    processed_row.append("".join(td.stripped_strings))
            # append data after scraping each row
            processed_data.append(processed_row)

        # column name is based upon the libgen site table heading
        col_names = [
            "ID",
            "Author",
            "Title",
            "Publisher",
            "Year",
            "Pages",
            "Language",
            "Size",
            "Extension",
            "Mirror_1",
            "Mirror_2",
            "Mirror_3",
            "Mirror_4",
            "Mirror_5",
            "Edit",
        ]
        # Using list comprehension to convert each row into a dictionary
        parsed_dict = [dict(zip(col_names, row)) for row in processed_data]
        return parsed_dict


class ScraperWizard:
    def search_title(self, query):
        parsed_dict = ScrapeLibgen(query, search_type="title")
        return parsed_dict.combined_data()

    def search_author(self, query):
        parsed_dict = ScrapeLibgen(query, search_type="author")
        return parsed_dict.combined_data()

    def process_download_links(self, item):
        # Make a request to the stable URL mirror_1 from item
        page = requests.get(item["Mirror_1"])
        # Parse the HTML content libgen gateway are "GET", "Cloudflare", "IPFS.io", "Infura"
        soup = BeautifulSoup(page.text, "html.parser")
        # Find all <a> tags containing certain strings : libgen gateway are "GET", "Cloudflare", "IPFS.io", "Infura"
        links = soup.find_all("a", string=["GET", "Cloudflare", "IPFS.io", "Infura"])
        # Extract the link text and href attributes into a dictionary
        # eg:  {'GET': 'https://one.pdf', 'Cloudflare': 'https://cloudflare-ipfs.com'}
        download_links = {link.string: link["href"] for link in links}
        return download_links


get_rawdata = ScraperWizard()


def write_html(data):
    css_path = helper_func.return_path("misc", "styles.css")
    html_path = helper_func.return_path("misc", "index.html")
    wrap_html = Template(Path(html_path).read_text())
    html_data = wrap_html.safe_substitute(
        title="Libgen Book",
        style_path=css_path,
        header="Welcome to Libgen Book Library",
        content=data,
    )
    shugified = helper_func.sanitize_filename(book_title)
    create_folder = helper_func.create_folder(
        rf"Library/{shugified}_{randint(0, 1000)}_books"
    )
    with open(rf"{create_folder}/{shugified}.html", "w", encoding="UTF-8") as copy:
        copy.write(html_data)
    webbrowser.open(f"{helper_func.Path}/{shugified}.html")


def process_it(chunk):
    if chunk:
        body = []
        for index, bit in enumerate(chunk, start=1):
            resolved_download_links = get_rawdata.process_download_links(bit)
            resolved_get = resolved_download_links["GET"]
            unique_id = bit["ID"]
            Title = f"<a class='link_title' href={resolved_get} target='_blank'>{bit['Title']}</a>"
            Author = bit["Author"]
            Publisher = bit["Publisher"]
            Year = bit["Year"]
            Pages = bit["Pages"]
            Language = bit["Language"]
            Size = bit["Size"]
            Extension = bit["Extension"]
            resolved_cloudfare = resolved_download_links["Cloudflare"]
            resolved_ipfs = resolved_download_links["IPFS.io"]
            Donwload_links = f"<a class='resolved_links' href={resolved_cloudfare} target='_blank'>Link 1</a></br><a class='resolved_links' href={resolved_ipfs} target='_blank'>Link 2</a>"
            # TODO add mirror 4 </br > <a class = 'mirror_links' href = {bit['Mirror_4']} target = '_blank' > Mirror 4 < /a >
            Donwload_mirror = f"<a class='mirror_links' href={bit['Mirror_1']} target='_blank'>Mirror 1</a></br><a class='mirror_links' href={bit['Mirror_2']} target='_blank'>Mirror 2</a></br><a class='mirror_links' href={bit['Mirror_3']} target='_blank'>Mirror 3</a>"
            columns = (
                index,
                Title,
                Author,
                Publisher,
                Year,
                Pages,
                Language,
                Size,
                Extension,
                Donwload_links,
                Donwload_mirror,
            )
            body.append(columns)
        headers = [
            "S.N",
            "Title",
            "Author",
            "Publisher",
            "Year",
            "Pages",
            "Language",
            "Size",
            "Extension",
            "Donwload Link",
            "Mirror Link",
        ]
        formatted = tabulate(body, headers, tablefmt="unsafehtml")
        write_html(formatted)
    else:
        cprint(
            f"No results for {book_title} in our database...Try checking your spelling or search book by author name.\n",
            "red",
        )
        return (
            author_search()
            if helper_func.chkreg(
                "", (input("Do you want to search book by author name? [Y/N]: "))
            )
            else sys.exit(1)
        )


def author_search():
    global author_name
    author_name = input("Enter the book author name: ").strip()
    if len(author_name) >= 3:
        return (
            (author_name, "search_author")
            if helper_func.chkreg(
                "", (input("Do you want to enable advanced book search? [Y/N]: "))
            )
            else process_it(get_rawdata.search_author(author_name))
        )
    cprint("Author name must be at least 3 words", "red")
    return author_search()


def book_search():
    global book_title
    book_title = input("Enter the book title: ").strip()
    if len(book_title) >= 3:
        return process_it(get_rawdata.search_title(book_title))
    cprint("Please enter at least 3 character book names!", "red")
    return book_search()


def main():
    try:
        book_search()
    except KeyboardInterrupt:
        cprint("Exiting from the script....", "red")
        sys.exit(1)
    except IndexError:
        cprint("Can't parse input data..Please provide valid data", "red")
        sys.exit(1)
    except requests.exceptions.ConnectionError:
        cprint("\nPlease check your internet connection!", "red")
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    main()
