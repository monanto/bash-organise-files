# Description
Bash script that traverses the folder (and all subfolders) given as command line argument

and creates the following lists (into output descriptors 3,4,5):

1. files that have different owner/group than the owner/group of starting folder

2. files that are writable by others than the owner of starting folder

3. files that have the setuid bit set and are executable by others than the owner of starting folder
