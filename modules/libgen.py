from libgen_api.libgen_search import LibgenSearch
from tabulate import tabulate
import webbrowser
import helper_func
import colorama
from termcolor import cprint
import sys
import requests
from random import randint
from pathlib import Path
from string import Template

colorama.init()
get_rawdata = LibgenSearch()


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
    shugified = helper_func.slugify(book_title)
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
            resolved_download_links = get_rawdata.resolve_download_links(bit)
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
            f"No results for {book_title} in our database...Try checking your spelling or use advanced search mode.\n",
            "red",
        )
        return (
            author_search()
            if helper_func.chkreg(
                "", (input("Do you want to search book by author name? [Y/N]: "))
            )
            else sys.exit(1)
        )


def adv_mode(book_info, search_mode):
    book_filters = dict()
    cprint(
        "\n\tNote: Press Enter to skip the section if you're unsure of the value\n",
        "green",
    )
    try:
        year = int(input("In which year book was published ?: "))
        if 1000 <= year <= 9999:
            book_filters.update({"Year": str(year)})
    except:
        cprint(
            "As the book, pubished year is not well defined so, excluding it.", "yellow"
        )
    try:
        book_filters.update(
            {
                "Language": lang,
            }
        ) if (
            lang := input("Enter the language of the book: ").lower()
        ) else book_filters.update(
            {
                "Language": "English",
            }
        )
        extension = input(
            "Which file format would you like to choose? [pdf/epub]: "
        ).lower()
        if extension in ["pdf", "ext"]:
            book_filters.update({"Extension": extension})
    except:
        cprint(
            "Error selecting file format between pdf & epub so, excluding it.", "yellow"
        )
    if book_filters:
        cprint(
            "\n\tNote: Turning on the strict match filter might show 0 results depending upon your filers..so press enter to skip the match section.\n",
            "blue",
        )
        exact_filter = (
            True
            if helper_func.chkreg(
                "", input("Do you want to enable strict match filters? [Y/N]: ")
            )
            else False
        )
        if "search_author" in search_mode:
            process_it(
                get_rawdata.search_author_filtered(
                    book_info, book_filters, exact_match=exact_filter
                )
            )
        else:
            process_it(
                get_rawdata.search_title_filtered(
                    book_info, book_filters, exact_match=exact_filter
                )
            )
    else:
        process_it(f"get_rawdata.{search_mode}({book_info})")


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
        return (
            adv_mode(book_title, "search_title")
            if helper_func.chkreg(
                "", (input("Do you want to enable advanced book search? [Y/N]: "))
            )
            else process_it(get_rawdata.search_title(book_title))
        )
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
