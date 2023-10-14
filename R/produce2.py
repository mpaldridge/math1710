import os

# Define the directory where you want to create the files
directory = "../docs/data"

# Create the directory if it doesn't exist
if not os.path.exists(directory):
    os.makedirs(directory)

# Loop from 0 to 99 to create 100 files
for xy in range(100):
    # Format xy as a two-digit string (e.g., 00, 01, 02, ..., 99)
    xy_str = f"{xy:02d}"

    # Define the file name
    file_name = f"{directory}/R2-{xy_str}.R"

    # Define the content of the file
    file_content = f'''
temp <- read.csv("https://mpaldridge.github.io/math1710/data/R3-{xy_str}.csv")
amaflix <- temp$amaflix
netazon <- temp$netazon
rm(temp)
cat("Data for R Worksheet 2 successfully created.")
'''

    # Write the content to the file
    with open(file_name, 'w') as file:
        file.write(file_content)

print("Files created successfully.")
