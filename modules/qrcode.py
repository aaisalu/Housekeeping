from termcolor import cprint
from random import randint
from amzqr import amzqr
import helper_func
import colorama
import os
import re
import glob
import sys

colorama.init()


def beautify(info):
    # ver=input("What version would you like as QRcode output? [1-40]: ")
    # color=input("Do you love colors? [yes/no]: ")
    value = info, None, "png", True, 10
    return roulette(value)


def getimg(string):
    get_gallery = r"..\gallery"
    if os.path.isdir(get_gallery):
        for k in glob.glob(rf"{get_gallery}\*.{string}"):
            return k, string
    else:
        cprint("Gallery folder can't be found in the Morning project folder", "red")
        return None


def imageout(value):
    try:
        if not None is (storeimg := getimg("jpg")):
            cprint(f"\nProcessing output as {value[2]} with custom img.", "green")
            return engine(value[0], storeimg[0], value[2], value[3], value[4])
        else:
            cprint(
                f"Picture isn't present in gallery folder so, processing {value[0][:10]}... output with {value[2]}",
                "yellow",
            )
            return engine(value[0], value[1], value[2], value[3], value[4])
    except OSError:
        cprint(
            "\nError: I can't produce color output in JPEG so, try changing it to png",
            "red",
        )


def gifout(value):
    try:
        if not None is (storegif := getimg("gif")):
            cprint(f"\nProcessing {value[0][:10]}... output with custom gif.", "green")
            return engine(value[0], storegif[0], storegif[1], value[3], value[4])
        else:
            cprint(
                f"GIF isn't present in gallery folder so, processing {value[0][:10]}... output with {value[2]}",
                "yellow",
            )
            return engine(value[0], value[1], value[2], value[3], value[4])
    except OSError:
        cprint(
            "\nError: I can't produce color output in JPEG so, try changing it to png",
            "red",
        )


def roulette(value):
    askimg = input("Do you want custom img or gif as output? [yes/no]: ")
    try:
        if helper_func.chkreg("", askimg):
            asktype = input("Do you want gif as output? [yes/no]: ")
            if helper_func.chkreg("", asktype):
                return gifout(value)
            else:
                return imageout(value)
        else:
            cprint(
                f"Processing {value[0][:10]}... output as {value[2]} without any custom img",
                "yellow",
            )
            return engine(value[0], value[1], value[2], value[3], value[3])

    except ValueError:
        cprint(
            "\nError: Ohh snap!! Feels like my brain can't process this input", "red"
        )


def eliminate(input, ext):
    info = re.sub(
        r"(https|http|ftp)?:\/\/(\.|\/|\?|\=|\&|\%)*\b(www.)*",
        f"{randint(0, 1000)}_",
        input,
        flags=re.MULTILINE,
    )
    return f"{helper_func.sanitize_filename(info)[:35]}.{ext}"


def engine(info, img, ext, color, ver):
    version, level, qr_name = amzqr.run(
        info,
        version=ver,
        level="Q",
        picture=img,
        colorized=color,
        contrast=1.2,
        brightness=1.1,
        save_name=(file_name := eliminate(info, ext)),
        save_dir=helper_func.create_folder("Qrcodes"),
    )
    return helper_func.view_file(rf"{helper_func.Path}\{file_name}")


def main():
    try:
        beautify(str(input("Type anything which you want to convert it to QRcode: ")))
    except KeyboardInterrupt:
        print("Exiting from the script....")
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    main()
