layout: true
class: center, middle, inverse
name: inverse

course: Secure Software Development
title: 05w More Linux
course: Secure Software Development
author: Jonathan Knudsen
email: jonathan.knudsen@duke.edu

---
# {{title}}

{{course}}

{{author}}

{{email}}

.copyright[
![cc](images/cc-88x31.png)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
]

---

# Updates and Installing

---
layout: false

# Package Management

- Handles updates to your system

- Works pretty smoothly most of the time

- Ubuntu uses `apt` or `apt-get` (similar, but not the same)

- Some other Linux distributions use `yum`, `pacman` or other commands

 - Conceptually similar, but slight differences in usage

---

# The Basics

- You need root privileges, so `sudo`

- `sudo apt update` to get synchronized with the official repositories

- `sudo apt upgrade` to bring everything up to date

- `sudo apt install screenfetch` installs the `screenfetch` program

- `sudo apt install -y screenfetch` won't ask you for confirmation

- Useless, but fun: `sudo apt install -y sl`

---
template: inverse

# Grep and Piping

---

# Pipes

.float[.image-40[![Magritte Pipe](images/MagrittePipe.jpg)]]

- This is a pipe: `|`

- Allows chaining together of commands

- `cat f.txt` outputs the file

- `cat f.txt | wc -l` counts the line in the file

---
template: inverse

# Finding Things

---

# Grep

- `grep -r unicorn public_html` recursively search _public\_html_ for "unicorn"

- `grep -ri unicorn public_html`: same thing, but ignore case

- `grep -ri unicorn public_html | grep -v background`: same thing, but then exclude (-v) lines that have "background"

---

# Getting Help

- `man <command>` gives you some documentation

- Sometimes helpful, but not always

---
template: inverse

# Gettings Things From Here to There

---

# `scp`

- Cousin to `ssh`

- `scp <source> <destination>`

- Can use regular local file paths

- Can also use remote paths in the format `<user>@<remote machine>:<file path>`

- The following copies the local file _hdmi\_tweak.sh_ to `vcm-11091` and renames it _hd.sh_

```bash
$ scp hdmi-tweak.sh jk471@vcm-11091.vm.duke.edu:hd.sh
jk471@vcm-11091.vm.duke.edu's password: 
hdmi-tweak.sh                                                     100%   33     1.4KB/s   00:00    
$ 
```

- `scp hdmi-tweak.sh jk471@vcm-11091.vm.duke.edu:/tmp`: same thing, but copies the file into _/tmp_ directory

---

# `rsync`

- Synchronizes two directories, which could be remote

- For example, I work on the course web site locally, then synchronize like this:

```bash
rsync -r public_html/ jk471@login.oit.duke.edu:/winhomes/jk471/public_html/
```

---

# Run a Web Server

- Quick

- Dirty

 - Security risk

 - No authentication

 - No in-transit encryption

- For Python 3 (recommended):

```bash
python3 -m http.server 8080
```

- For Python 2:

```bash
python -m SimpleHTTPServer 8080
```

---

# Packing and Unpacking with Compression

- `zip` combines packing and compression

 - `zip -r <file> <directory>` packages an entire directory

 - `unzip <file>` unpacks it

- `tar` also combines packing and compression

 - Although historically, no
 
 - For example, _.tar.gz_ files
 
 - `tar zcvf <file> <directory>` packages an entire directory
 
 - `tar zxvf <file>` unpacks it

---
template: inverse

# Working with git

---

# Just A Few Things

- `sudo apt get git` if you don't have `git` already

- `git clone <repository>` to get the source code

- `git log` to see all changes

- `git tag` to see tags

- `git checkout <tag>` to travel back in time

- For further study, checking out _branching_

- Everyone is afraid of _merging_

---
template: inverse

# Common Build Patterns

Let's check out libpng

