def generate_file(filename="output.txt", max_number=32, repetitions=32):
    with open(filename, "w") as file:
        for i in range(1, max_number + 1):
            # create a line
            : 1 0 i i i ... i (32 fois)
            line = ["1", "0"] + [str(i)] * repetitions
            # Write the line to the file
            file.write(" ".join(line) + "\n")

# Generate the file
generate_file()
