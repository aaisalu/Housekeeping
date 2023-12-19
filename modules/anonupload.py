import requests
from pathlib import Path
from termcolor import cprint
import colorama
import pyperclip
import helper_func
import sys

colorama.init()


def anon_data(data, readable_size):
    if data["status"]:
        full_url = data["data"]["file"]["url"]["full"]
        unique_id = data["data"]["file"]["metadata"]["id"]
        file_name = data["data"]["file"]["metadata"]["name"]
        file_size = data["data"]["file"]["metadata"]["size"]["readable"]
        pyperclip.copy(full_url)
        table = [[file_name, full_url, readable_size]]
        headers = ["File Name", "Download Link", "Size"]
        helper_func.tabuate_it(table, headers, "green")
        write_it(
            f"Uploaded to: anonfiles server\nUnique ID: {unique_id}\nFile Name: {file_name}\nFile_size: {readable_size}\nDownload Link: {full_url}\n\n"
        )
    else:
        anon_error(data)


def anon_error(data):
    error_code = data["error"]["code"]
    error_message = data["error"]["message"]
    error_type = data["error"]["type"]
    table = [[error_code, error_type, error_message]]
    headers = ["Error Code", "Type", "Message"]
    return helper_func.tabuate_it(table, headers, "red")


def write_it(content):
    with open(
        rf'{helper_func.create_folder("Upload_History")}\Uploadhistory.txt', "a+"
    ) as note:
        note.write(content)


def fileio_data(data, readable_size):
    if data["success"]:
        unique_id = data["id"]
        file_type = data["nodeType"]
        full_url = data["link"]
        unique_key = data["key"]
        file_name = data["name"]
        expiry_date = data["expires"]
        file_size = f"{round(data['size']/1000/1000,2)} mb"
        file_delete = data["autoDelete"]
        file_created = data["created"]
        pyperclip.copy(full_url)
        table = [[file_name, full_url, readable_size, expiry_date, file_delete]]
        headers = [
            "File Name",
            "Download Link",
            "Size",
            "File expiration date",
            "Auto Delete",
        ]
        helper_func.tabuate_it(table, headers, "green")
        write_it(
            f"Uploaded to: file.io server\nUnique ID: {unique_id}\nUnique key: {unique_key}\nFile Name: {file_name}\nFile_size: {readable_size}\nDownload Link: {full_url}\nFile expiration date: {expiry_date}\nAuto Delete: {file_delete}\nFile uploaded date: {file_created}\n\n"
        )
    else:
        fileio_error(data)


def fileio_error(data):
    error_code = data["error"]
    error_message = data["message"]
    table = [[error_code, error_message]]
    headers = ["Error Code", "Message"]
    return helper_func.tabuate_it(table, headers, "red")


def redirect_it(url, abs_path):
    open_file = open(abs_path, "rb")
    readable_size = helper_func.convert_bytes(Path(abs_path).stat().st_size)
    files = {"file": open_file}
    cprint(
        f"\nPlease wait.. uploading your files to the {'files.io' if 'file.io' in url else 'anon'} server",
        "green",
    )
    cprint(
        "This might take several minutes depending upon your file size & your internet speed\n",
        "green",
    )
    try:
        raw_data = requests.post(url, files=files).json()
        if "file.io" in url:
            cprint("Files are uploaded to the file.io server ", "yellow")
            fileio_data(raw_data, readable_size)
        else:
            cprint("Files are uploaded to the anon server ", "yellow")
            anon_data(raw_data, readable_size)
    except requests.exceptions.SSLError:
        return cprint("Max retries exceeded with url", "red")


def connect_cloud():
    file_paths = input("Provide the absolute path of file: ").strip('"').split("|")
    try:
        for filepath in file_paths:
            abs_path = Path(filepath).absolute()
            file_size = round(Path(abs_path).stat().st_size / (1024 * 1024))
            if abs_path.is_file():
                if file_size <= 1999:
                    redirect_it("https://file.io", abs_path)
                elif file_size > 1999 and file_size <= 4999:
                    redirect_it("https://api.anonfiles.com/upload", abs_path)
                else:
                    return cprint(
                        f"Oops!.. The file is too large...Max file size is 5 GiB so, trim your extra {abs(5000-file_size)} MB from your file to upload",
                        "red",
                    )
            else:
                return cprint(
                    "Please provide the absolute path of the file to upload", "red"
                )
    except (FileNotFoundError, OSError):
        return cprint("The system couldn't find the file that you specified", "red")


def main():
    try:
        connect_cloud()
    except KeyboardInterrupt:
        cprint("\nExiting from the script....", "red")
        sys.exit(1)
    except requests.exceptions.ConnectionError:
        cprint("\nPlease check your internet connection!", "red")
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    main()
