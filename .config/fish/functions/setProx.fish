function setProx
	set -U https_proxy "http://10.158.100.1:8080"
  set -U http_proxy "http://10.158.100.1:8080"
  git config --global http.proxy http://10.158.100.1:8080
  git config --global https.proxy http://10.158.100.1:8080
end
