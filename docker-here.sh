#!/bin/bash
sudo umount -f /mnt/here
sudo mkdir /mnt/here
sudo mount -v -t cifs -o username="$1",password="$2",dir_mode=0777,file_mode=0777 //10.0.2.2/docker-here /mnt/here
