### Package Management: apt and yum

**Package Management:**
Package management is the process of installing, updating, and removing software packages on a computer system. It ensures that software dependencies are met and simplifies the process of managing software installations.

**apt (Advanced Package Tool):**
- `apt` is a package management tool used in Debian-based Linux distributions like Ubuntu.
- It provides a simple command-line interface for installing, upgrading, and removing software packages.
- Example commands:
  - `apt install <package>`: Installs a package.
  - `apt update`: Updates the list of available packages.
  - `apt upgrade`: Upgrades all installed packages to their latest versions.
  - `apt remove <package>`: Removes a package.

**yum:**
- `yum` is a package management tool used in Red Hat-based Linux distributions like CentOS and Fedora.
- It performs similar functions to `apt` but uses different package repositories and package formats.
- Example commands:
  - `yum install <package>`: Installs a package.
  - `yum update`: Updates all installed packages.
  - `yum remove <package>`: Removes a package.
  - `yum search <keyword>`: Searches for packages containing the specified keyword.

### Pipe

**Pipe:**
A pipe (`|`) is a feature in Unix-like operating systems that allows the output of one command to be used as the input for another command.

**Example:**
```bash
command1 | command2
```
This command takes the output of `command1` and passes it as input to `command2`.

**Usage Example:**
```bash
cat file1.txt | grep -i text
```
This command displays the contents of `file1.txt` and pipes it to `grep`, which searches for lines containing the case-insensitive word "text".

### Web Server

**Web Server:**
A web server is software that serves web content over the Internet. It handles incoming requests from web clients (such as web browsers) and delivers web pages, files, or other content in response.

**Nginx:**
- Nginx is a popular open-source web server and reverse proxy server.
- It's known for its high performance, stability, and low resource consumption.
- Example command to install Nginx using apt:
  ```bash
  apt install nginx
  ```

### Systemctl

**Systemctl:**
`systemctl` is a command-line utility used to manage system services in Linux distributions that use systemd as their init system.

**Common systemctl commands:**
- `systemctl status <service>`: Displays the status of a service.
- `systemctl start <service>`: Starts a service.
- `systemctl stop <service>`: Stops a service.
- `systemctl restart <service>`: Restarts a service.
- `systemctl enable <service>`: Enables a service to start automatically at boot.
- `systemctl disable <service>`: Disables a service from starting automatically at boot.

### File Viewing Commands

**less, head, tail, tail -f:**
- `less`: A command-line utility used to view text files. It allows scrolling both forward and backward through the file.
- `head`: Displays the beginning of a file.
- `tail`: Displays the end of a file.
- `tail -f`: Outputs the contents of a file as it grows in real-time.

### wc -l

**wc -l:**
`wc` is a command-line utility used to count words, lines, and characters in files. The `-l` option specifically counts the number of lines in a file.

### wget and curl

**wget and curl:**
- `wget` and `curl` are command-line utilities used for downloading files from the web.
- `wget` is a non-interactive downloader that supports HTTP, HTTPS, and FTP protocols.
- `curl` is a more versatile tool that supports not only downloading files but also uploading, sending requests to servers, and more.

**Example usage:**
```bash
wget <URL>
curl -O <URL>
```