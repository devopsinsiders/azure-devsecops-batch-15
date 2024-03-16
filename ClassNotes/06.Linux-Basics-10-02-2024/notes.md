## Understanding Paths and File Redirection:

**Absolute Path:**  
An absolute path refers to the full path of a file or directory from the root directory (/). It starts from the root directory and includes all directories leading to the target directory or file. For example: `/home/user/documents/file.txt`

**Relative Path:**  
A relative path refers to the path of a file or directory relative to the current working directory. It does not start from the root directory but instead navigates from the current location. For example, if the current directory is `/home/user`, and the file you want to reference is in the documents directory, you can use a relative path like `documents/file.txt`.

**echo:**  
- **Purpose:** Prints text or variables to the terminal.  
- **Example:** `echo "Hello, World!"`  
- **Output:** Displays the text "Hello, World!" on the terminal.

**>:**  
- **Purpose:** Redirects standard output to a file, creating the file if it doesn't exist and overwriting its contents if it does.  
- **Example:** `echo "Hello" > output.txt`  
- **Output:** Writes "Hello" to the file named `output.txt`, overwriting its previous content.

**>>:**  
- **Purpose:** Appends standard output to a file, creating the file if it doesn't exist and appending to its contents if it does.  
- **Example:** `echo "World!" >> output.txt`  
- **Output:** Appends "World!" to the file named `output.txt`, preserving its existing content and adding the new text at the end.

---

## Additional Notes on File System Paths:

1. **.:**  
   - **Purpose:** Represents the current directory.  
   - **Example:** `./script.sh`  
   - **Usage:** Used to execute a script or refer to a file in the current directory.

2. **..:**  
   - **Purpose:** Represents the parent directory.  
   - **Example:** `cd ..`  
   - **Usage:** Used to navigate up one level in the directory structure.
