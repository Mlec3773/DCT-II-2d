def generate_file(filename="output.txt", max_number=32, repetitions=32):
    with open(filename, "w") as file:
        for i in range(1, max_number + 1):
            # Créer une ligne : 1 0 i i i ... i (32 fois)
            line = ["1", "0"] + [str(i)] * repetitions
            # Écrire la ligne dans le fichier
            file.write(" ".join(line) + "\n")

# Générer le fichier
generate_file()
