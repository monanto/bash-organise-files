# bash-organise-files
Bash script that traverses the folder (and all subfolders) given as command line argument and creates the following lists (into output descriptors 3,4,5):

files that have different owner/group than the owner/group of starting folder
files that are writable by others than the owner of starting folder
files that have the setuid bit set and are executable by others than the owner of starting folder
