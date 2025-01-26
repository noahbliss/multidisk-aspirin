# multidisk-aspirin
Makes working with paths linked to other disks less painful. I have multiple disks in my main PC, but want some files to be moved to another disk, without having to re-learn which files are where.  

## Steps:

1. Make a disk
2. Mount the disk at some path
3. Ensure file permissions are good for your user
4. toss migrator.sh and free_real_estate.sh somewhere convenient.
5. Edit both files with the correct T_ROOT and LINK_LIST paths. The T_ROOT is where your files will get moved to. LINK_LIST is where we track what was moved.

## Usage
From somewhere in your home directory...  
```
/mnt/disk/user/migrator.sh somedirectory
```
somedirectory is now moved to T_ROOT and replaced by a symlink.

In the process of day-to-day, you've deleted somedirectory
```
rm somedirectory
```
It's now orphaned on your other disk.  

Clean it up with the other script.
```
/mnt/disk/user/free_real_estate.sh
```
`somedirectory` is now gone. 

## Why? 
Because Baulder's Gate 3 is 150GB and that's insane.  
