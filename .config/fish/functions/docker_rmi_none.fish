function docker_rmi_none
	docker rmi (docker images | grep "^<none>" | awk "{print $3}")
end
