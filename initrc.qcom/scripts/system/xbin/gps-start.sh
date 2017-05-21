#!/system/bin/sh
#
# Copyright (C) 2012 Qualcomm Atheros.
# All Rights Reserved
#
/system/xbin/gps-reset.sh 1

/system/bin/griffon -clog 1 -lport /dev/ttyMSM10 -limage /data/misc/location/atlas/GFW.img -fsh /data/misc/location/atlas/gnss-fsh.bin


