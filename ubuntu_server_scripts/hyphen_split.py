import sys
import re


def extract_second_item():
    matches = []
    for line in sys.stdin:
        matches.append(re.search(r" - (\d[^\"]*)", line.strip()))
    finalMatches = []
    for match in matches:
        finalMatches.append(match)

    for finalMatch in finalMatches:
        out = finalMatch.split(" - ")
        print(out, ",")


if __name__ == "__main__":
    extract_second_item()
