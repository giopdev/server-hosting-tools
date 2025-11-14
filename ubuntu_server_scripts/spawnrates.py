import sys


def process_input(filename, percentage):
    with open(filename, "r") as file:
        lines = file.readlines()
        for line in lines:
            print("DinoSpawnWeightMultipliers=(DinoNameTag=" + line.strip() + ",SpawnWeightMultiplier=0."
                  + str(desired_percentage) + ",OverrideSpawnLimitPercentage=false)")


if __name__ == "__main__":
    # check for filename arg
    if len(sys.argv) < 2:
        print("usage: python spawnrates.py filename")
        sys.exit(1)

    desired_percentage = int(input("Enter desired percentage: "))

    process_input(sys.argv[1], desired_percentage)
