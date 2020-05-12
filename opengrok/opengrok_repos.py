#!/usr/bin/python3

import sys
import os
import argparse
from subprocess import run


def process(file, directory):
    for line in file:
        info = line.rstrip()
        if (info.startswith('#') is False and len(info) > 3):
            plist = info.split(',')
            update_repo(plist[0], plist[1], directory)


def update_repo(name, git, directory):
    repo_path = directory + "/" + name
    if os.path.exists(repo_path) is True:
        cmd_line = "cd " + repo_path + " && git pull "
    else:
        cmd_line = "cd " + directory + " &&  git clone " + git + " " + name
    completion = run(cmd_line, shell=True)
    if (completion.returncode != 0):
        print(completion.stderr)

    print(cmd_line)


def main():
    usage = """Clone a text file of repositories , update or clone.
This is helper for opengrok. The format of the project.txt:

NAME,GIT_REPOSITORY_PATH

Using git clone over HTTP might be preferred depending on the repository.
    """
    parser = argparse.ArgumentParser(
        description=usage,
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument("--projects_file", '-p', action='store',
                        default="projects.txt",
                        help="Specifiy the file that has the git projects")
    parser.add_argument("--directory", "-d", action='store', required=True,
                        help="Specifiy the destination directory to checkout")
    args = parser.parse_args()
    print(args)
    try:
        file_loc = args.projects_file
        pfile = open(file_loc, 'r')
        process(pfile, args.directory)
    except FileNotFoundError:
        print("Fail to load " + file_loc)
        sys.exit(2)


if __name__ == '__main__':
    main()
