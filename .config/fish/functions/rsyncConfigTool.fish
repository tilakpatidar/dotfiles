function rsyncConfigTool
	rsync -avzh --exclude-from="$NOKIA_HOME/config-tool/rsync-exclude-file" -e ssh $NOKIA_HOME/config-tool/ centos@$DEV_MACHINE_IP:/home/centos/config-tool/
end
