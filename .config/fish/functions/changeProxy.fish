function changeProxy
  	unset http_proxy
    unset https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    # Set proxy if using nokia LAN,WiFi or VPN
    ifconfig en4 2>/dev/null | grep -q -o RUNNING
    and setProx
ifconfig utun1 2>/dev/null | grep -q -o RUNNING; and setProx
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}' | grep -q "NOSI"
    and setProx
end
