# oct/15/2022 05:00:02 by RouterOS 6.43.7
# software id = FSGR-M3ST
#
# model = 1100AHx2
# serial number = 716D0600E182
/interface bridge
add name=bridge1
add fast-forward=no name=loopback
/interface ethernet
set [ find default-name=ether1 ] name="ether1-LINK MAIN METRO VIA LA" speed=\
    100Mbps
set [ find default-name=ether2 ] name="ether2-LINK MAIN INET VIA LA" speed=\
    100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] name="ether4-LINK BACK-UP METRO VIA TELKOM" \
    speed=100Mbps
set [ find default-name=ether5 ] name="ether5-LINK BACK-UP INET VIA TELKOM" \
    speed=100Mbps
set [ find default-name=ether6 ] name="ether6-LAN METRO" speed=100Mbps
set [ find default-name=ether7 ] name="ether7-LAN INET" speed=100Mbps
set [ find default-name=ether8 ] speed=100Mbps
set [ find default-name=ether9 ] speed=100Mbps
set [ find default-name=ether10 ] speed=100Mbps
set [ find default-name=ether11 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether12 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether13 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CERES-SEMARANG
/routing bgp instance
set default as=64518 router-id=10.1.1.7
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0
add addresses=::/0 name=cpepublic
/system logging action
add name=action1 remote=202.152.63.117 target=remote
/interface bridge port
add bridge=bridge1 interface=ether8
add bridge=bridge1 interface="ether7-LAN INET"
/ip address
add address=123.231.244.126/30 interface="ether2-LINK MAIN INET VIA LA" \
    network=123.231.244.124
add address=123.231.229.78/30 interface="ether5-LINK BACK-UP INET VIA TELKOM" \
    network=123.231.229.76
add address=10.12.12.57/29 interface="ether1-LINK MAIN METRO VIA LA" network=\
    10.12.12.56
add address=10.121.121.57/29 interface="ether4-LINK BACK-UP METRO VIA TELKOM" \
    network=10.121.121.56
add address=10.1.1.7 interface=loopback network=10.1.1.7
add address=172.20.6.1/29 interface="ether6-LAN METRO" network=172.20.6.0
add address=36.37.95.73/29 interface="ether7-LAN INET" network=36.37.95.72
/ip dns
set servers=202.152.0.2,202.152.5.36
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
/ip firewall filter
# in/out-interface matcher not possible when interface (ether7-LAN INET) is slave - use master instead (bridge1)
add action=drop chain=forward dst-address-list=private in-interface=\
    "ether7-LAN INET"
# in/out-interface matcher not possible when interface (ether7-LAN INET) is slave - use master instead (bridge1)
add action=drop chain=input dst-address-list=private in-interface=\
    "ether7-LAN INET"
add action=drop chain=forward dst-address-list=!private in-interface=\
    "ether6-LAN METRO"
add action=drop chain=input dst-address-list=!private in-interface=\
    "ether6-LAN METRO"
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
/ip route
add distance=1 gateway=123.231.244.125
add distance=5 gateway=123.231.229.77
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api disabled=yes
set winbox port=8188
set api-ssl disabled=yes
/routing bgp network
add network=172.20.6.0/29 synchronize=no
/routing bgp peer
add in-filter=DC name=DC remote-address=10.12.12.58 remote-as=64514 ttl=\
    default
add in-filter=DC-BACKUP name=DC-BACKUP remote-address=10.121.121.58 \
    remote-as=64514 ttl=default
/routing filter
add action=accept chain=DC prefix=172.16.100.0/22
add action=accept chain=DC prefix=172.20.1.0/29
add action=accept chain=DC prefix=172.16.1.3
add action=accept chain=DC prefix=172.16.1.9
add action=accept chain=DC prefix=172.16.2.9
add action=discard chain=DC
add action=accept chain=DC-BACKUP prefix=172.16.100.0/22 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.0/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.1.3 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.1.9 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.2.9 set-bgp-prepend=5
add action=discard chain=DC-BACKUP
/snmp
set enabled=yes trap-community=cpepublic
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=CERES-SEMARANG
/system logging
add action=action1 topics=error
add action=action1 topics=info
add action=action1 topics=warning
