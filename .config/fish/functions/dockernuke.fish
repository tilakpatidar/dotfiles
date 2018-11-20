function dockernuke
	docker kill (docker ps -qa)
end
