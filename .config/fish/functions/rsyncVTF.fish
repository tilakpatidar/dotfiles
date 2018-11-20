function rsyncVTF
	rsync -avzh --exclude-from="$NOKIA_HOME/VTF/rsync-exclude-file" -e ssh  $NOKIA_HOME/VTF/  centos@$DEV_MACHINE_IP:/home/centos/VTF/
end
