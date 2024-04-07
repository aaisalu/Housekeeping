from termcolor import cprint
import os
import colorama
import re
import sys
import webbrowser
from tabulate import tabulate
import requests
from threading import Thread
from pathlib import PurePath, Path

colorama.init()


def create_folder(file_name):
    global Path
    get_user = os.getlogin()
    desktop = os.path.join(os.path.join(os.environ["USERPROFILE"]), "Desktop")
    try:
        Path = rf"{desktop}\{get_user}_repo\{file_name}"
        if not os.path.exists(Path):
            os.makedirs(Path)
        return Path
    except:
        cprint("Error at creating folder... saving at default folder", "red")
        Path = rf"{desktop}\{get_user}_repo\Dropped_contents"
        if not os.path.exists(Path):
            os.makedirs(Path)
        return Path


def chkreg(string, answer):
    return re.search(
        f"{string if string else 'yes|1|yep|sure|True|yeah|y|yea|yup'}",
        answer,
        flags=re.IGNORECASE,
    )


def sanitize_filename(filename):
    # Define forbidden characters based on the operating system
    if sys.platform.startswith("win"):
        forbidden_chars = r'[\\/:*?"<>|\x00-\x1F]'
    else:  # Assuming Linux/Unix for non-Windows platforms
        forbidden_chars = r"/\x00-\x1F"

    # Remove forbidden characters from the filenames
    sanitized_filename = re.sub(forbidden_chars, "", filename)
    # Convert filename to lowercase and remove any non-alphanumeric characters except spaces and hyphens and Replace consecutive spaces and hyphens with a single hyphen and strip leading/trailing hyphens or underscores
    regx = r"[^\w\s-]|[-\s]+"
    sanitized_filename = re.sub(regx, "-", sanitized_filename.lower()).strip("-_")
    return sanitized_filename


def view_file(filename):
    webbrowser.open(rf"{filename}")
    return cprint(f"\nSaved at {filename}", "green")


def tabuate_it(table, headers, color):
    return cprint(tabulate(table, headers, tablefmt="fancy_grid"), color)


def threading(strike, arg, kwargs):
    thread = Thread(
        target=strike,
        args=(
            arg,
            kwargs,
        ),
    )
    return thread.start()


def convert_bytes(bytes):
    # Thanks to Rajiv Sharma at stackoverflow.com/a/39988702
    for x in ["bytes", "KB", "MB", "GB", "TB"]:
        if bytes < 1024.0:
            return "%3.1f %s" % (bytes, x)
        bytes /= 1024.0


def create_path(mode, parent_dir, file_name):
    return PurePath(mode, parent_dir, file_name)


def return_path(parent_dir, file_name):
    initial_path = create_path(Path().cwd(), parent_dir, file_name)
    parent_path = create_path(Path().cwd().parent, parent_dir, file_name)
    default_path = PurePath(initial_path).parent
    default_filename = PurePath(initial_path).name
    if Path(initial_path).exists():
        return initial_path
    elif Path(parent_path).exists():
        return parent_path
    else:
        default_path if Path(default_path).exists() else Path(default_path).mkdir()
        open(default_path / default_filename, "a+", encoding="utf-8")
        return initial_path
