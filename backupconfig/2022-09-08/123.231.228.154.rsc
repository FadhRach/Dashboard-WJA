# aug/21/2022 07:00:21 by RouterOS 6.42.10
# software id = YSP7-M2C5
#
# model = 1100AH
# serial number = 319F02D802E1
/interface bridge
add name=bridge1
/interface ethernet
set [ find default-name=ether1 ] name="1.Main Inet"
set [ find default-name=ether2 ] name="2.Backup Inet"
set [ find default-name=ether3 ] name="3.Metro Main"
set [ find default-name=ether4 ] name="4.Metro Bakcup"
set [ find default-name=ether7 ] name="7.LAN inet"
set [ find default-name=ether8 ] name="8.LAN Metro"
/interface list
add exclude=dynamic name=discover
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=SIDOARJO
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=3des
/routing bgp instance
set default as=64516 router-id=10.1.1.6
/system logging action
set 0 memory-lines=100
set 1 disk-lines-per-file=100
add name=action1 remote=202.152.63.117 target=remote
/interface bridge port
add bridge=bridge1 interface="7.LAN inet"
add bridge=bridge1 interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=discover
/interface list member
add interface=ether12 list=discover
add interface=ether13 list=discover
add interface="1.Main Inet" list=discover
add interface="2.Backup Inet" list=discover
add interface="3.Metro Main" list=discover
add interface="4.Metro Bakcup" list=discover
add interface=ether5 list=discover
add interface=ether6 list=discover
add interface="7.LAN inet" list=discover
add interface="8.LAN Metro" list=discover
add interface=ether9 list=discover
add interface=ether10 list=discover
add interface=ether11 list=discover
/ip address
add address=123.231.228.154/30 interface="1.Main Inet" network=\
    123.231.228.152
add address=123.231.228.150/30 interface="2.Backup Inet" network=\
    123.231.228.148
add address=182.23.60.65/28 comment="LAN inet" interface="7.LAN inet" \
    network=182.23.60.64
add address=10.12.12.41/29 interface="3.Metro Main" network=10.12.12.40
add address=10.121.121.41/29 interface="4.Metro Bakcup" network=10.121.121.40
add address=172.20.3.1/29 comment="LAN Metro" interface="8.LAN Metro" \
    network=172.20.3.0
/ip dns
set servers=202.152.5.36,202.152.0.2
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
add address=202.152.0.2 list=DNS
add address=202.152.1.73 list=DNS
add address=202.152.5.36 list=DNS
/ip firewall filter
# in/out-interface matcher not possible when interface (7.LAN inet) is slave - use master instead (bridge1)
add action=drop chain=forward dst-address-list=private in-interface=\
    "7.LAN inet"
# in/out-interface matcher not possible when interface (7.LAN inet) is slave - use master instead (bridge1)
add action=drop chain=input dst-address-list=private in-interface=\
    "7.LAN inet"
add action=drop chain=forward dst-address-list=!private in-interface=\
    "8.LAN Metro"
add action=drop chain=input dst-address-list=!private in-interface=\
    "8.LAN Metro"
add action=drop chain=input dst-address-list=!DNS dst-port=53 protocol=udp
add action=drop chain=output protocol=udp src-address-list=!DNS src-port=53
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
add check-gateway=ping distance=100 gateway=123.231.228.153
add check-gateway=ping distance=200 gateway=123.231.228.149
add distance=1 dst-address=10.29.1.0/24 gateway=172.20.3.2
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=1234
set ssh port=212
set api disabled=yes
set winbox port=8188
/routing bgp network
add network=10.29.1.0/24 synchronize=no
add network=172.20.3.0/29 synchronize=no
/routing bgp peer
add in-filter=DC-IN name=DC remote-address=10.12.12.42 remote-as=64514 ttl=\
    default
add in-filter=DC-BACKUP name=DC-BACKUP remote-address=10.121.121.42 \
    remote-as=64514 ttl=default
/routing filter
add action=accept chain=DC-IN prefix=172.16.200.0/22
add action=accept chain=DC-IN prefix=172.16.100.0/22
add action=accept chain=DC-IN prefix=172.20.1.0/29
add action=accept chain=DC-IN prefix=172.20.1.72/29
add action=accept chain=DC-IN prefix=172.16.1.3
add action=accept chain=DC-IN prefix=172.16.1.9
add action=accept chain=DC-IN prefix=172.16.2.9
add action=discard chain=DC-IN
add action=accept chain=DC-BACKUP prefix=172.16.200.0/22 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.100.0/22 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.0/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.72/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.1.3 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.1.9 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.16.2.9 set-bgp-prepend=5
add action=discard chain=DC-BACKUP
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=SIDOARJO
/system logging
add action=action1 topics=error
add action=action1 topics=info
add action=action1 topics=warning
/system ntp client
set enabled=yes primary-ntp=203.160.128.178
/system routerboard settings
set silent-boot=no
/tool graphing interface
add interface="3.Metro Main"
add interface="4.Metro Bakcup"
add interface="1.Main Inet"
add interface="2.Backup Inet"
