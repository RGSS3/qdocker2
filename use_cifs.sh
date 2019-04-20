#!/bin/bash
mount -t cifs /here /here 2>&1 | grep "wrong fs type"
if [[ $? -ne 0 ]]; then 
  tce-load -wi samba cifs-utils
fi

