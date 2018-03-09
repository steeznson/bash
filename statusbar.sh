while true; do
	printf '\e[A\e[K'; # delete previous line
	echo -n 'Battery:'$(cat /sys/class/power_supply/BAT0/capacity); # battery
	echo -n ' | Time:'$(date +%H%M); # time
	echo -n ' | Capacity:'$(df -H | grep -vE '^Filesystem|devtmpfs|tmpfs|shm|cgroup_root|none' | awk '{print$4 " " $1}'); # disk space left
	sleep 60;
done
