#!/system/bin/sh
# from /init.qcom.sh

# Suppress default route installation during RA for IPV6; user space will take
# care of this
#
for file in /proc/sys/net/ipv6/conf/*
do
  echo 0 > $file/accept_ra_defrtr
done
