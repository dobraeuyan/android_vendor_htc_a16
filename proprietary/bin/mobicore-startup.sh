#!/system/bin/sh

# load kernel modules
insmod /system/lib/modules/mcDrvModule.ko
insmod /system/lib/modules/mcKernelApi.ko

# Startup script for MobiCore processes #
/system/bin/mcStarter tbase

if [ "$?" -eq "0" ]; then
	sleep 1

	echo "running mobicore daemon in background"
	# run daemon in background
	setprop sys.mobicore.daemon true
else
	echo "can't load mobicore secure app"
	exit 1
fi
