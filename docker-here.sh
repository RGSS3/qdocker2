#!/bin/bash
sudo umount -f /mnt/here
sudo mkdir /mnt/here
sudo mount -v -t cifs -o username="$2",password="$3",dir_mode=0777,file_mode=0777 //10.0.2.2/docker-here /mnt/here
sudo rm /usr/local/bin/here
sudo ln -s /root/user-here/here-run.sh /usr/local/bin/here