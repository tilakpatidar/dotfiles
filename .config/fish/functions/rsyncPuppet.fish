function rsyncPuppet
	rsync -avzh --exclude-from="$NOKIA_HOME/puppet-control/rsync-exclude-file" -e ssh  $NOKIA_HOME/puppet-control/  centos@$DEV_MACHINE_IP:/home/centos/puppet-control/
end
