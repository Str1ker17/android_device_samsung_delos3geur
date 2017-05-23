#!/system/bin/sh
#
# Copyright (C) 2012 Qualcomm Atheros.
# All Rights Reserved
#
gpio=7
path=/sys/class/gpio/gpio${gpio}
if [ -d ${path} ];
then
    echo "GPIO${gpio} is visible";
    echo out > ${path}/direction;
else
    echo "Configuring GPIO${gpio}";
    echo ${gpio} > /sys/class/gpio/export;
    echo out > ${path}/direction;
fi

MODE=$1

echo "Value of Mode $MODE";

case $MODE in
    0)
        echo 0 > ${path}/value
        ;;
    1)
        echo 0 > ${path}/value
        echo 1 > ${path}/value
        ;;
    *)
        echo "Disabling GPIO${gpio}"
        echo ${gpio} > /sys/class/gpio/unexport
        ;;
esac


