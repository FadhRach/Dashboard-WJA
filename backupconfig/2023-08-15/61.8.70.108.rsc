# aug/15/2023 04:58:51 by RouterOS 6.48.4
# software id = TX55-A74Z
#
# model = CCR1036-12G-4S
# serial number = C6C50B0787C7
/interface bridge
add fast-forward=no name=bridge1
add fast-forward=no name=loopback
/interface ethernet
set [ find default-name=ether1 ] l2mtu=1600 name=ether1-TO_FORTI speed=\
    100Mbps
set [ find default-name=ether2 ] l2mtu=1598 name=\
    ether2-INTERNET-CERES-2016008163 speed=100Mbps
set [ find default-name=ether3 ] l2mtu=1600 name=\
    ether3-METRO-2020239391-BACKUP speed=100Mbps
set [ find default-name=ether4 ] l2mtu=1598 speed=100Mbps
set [ find default-name=ether5 ] l2mtu=1598 speed=100Mbps
set [ find default-name=ether6 ] l2mtu=1598 speed=100Mbps
set [ find default-name=ether7 ] l2mtu=1590 mtu=1590 name=ether7-LAN_CERES \
    speed=100Mbps
set [ find default-name=ether8 ] l2mtu=1598 speed=100Mbps
set [ find default-name=ether9 ] l2mtu=1598 name=ether9-ROUTER_MAIN speed=\
    100Mbps
set [ find default-name=ether10 ] l2mtu=1600 speed=100Mbps
set [ find default-name=ether11 ] l2mtu=1600 name="ether11 - LAN INTERNET" \
    speed=100Mbps
set [ find default-name=ether12 ] l2mtu=1600 name=ether12-LAN_CERES speed=\
    100Mbps
/interface vrrp
add disabled=yes interface="ether11 - LAN INTERNET" name=vrrp1 vrid=51
add disabled=yes interface="ether11 - LAN INTERNET" name=vrrp2 vrid=52
add interface=ether12-LAN_CERES name=vrrp100 vrid=100
add interface=ether7-LAN_CERES name=vrrp200 vrid=200
/interface vlan
add interface=ether3-METRO-2020239391-BACKUP name=vlan-810-METRO-CERES \
    vlan-id=810
add interface=ether3-METRO-2020239391-BACKUP name=vlan-811-METRO-NIRWANA \
    vlan-id=811
add interface=ether3-METRO-2020239391-BACKUP name=vlan-813-METRO-SIDOARJO \
    vlan-id=813
add interface=ether3-METRO-2020239391-BACKUP name=vlan-814-METRO-SEMARANG \
    vlan-id=814
add interface=ether3-METRO-2020239391-BACKUP name=vlan-815-METRO-SIN vlan-id=\
    815
add interface=ether3-METRO-2020239391-BACKUP name=vlan-816-METRO-BALI \
    vlan-id=816
/interface list
add exclude=dynamic name=discover
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=RouterOS
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=aes-128-cbc
/ip pool
add name=POOL ranges=192.168.88.0/24
add name=L2TP-Pool ranges=192.168.88.10-192.168.88.200
add name=dhcp_pool2 ranges=44.44.44.2-44.44.44.6
/ppp profile
set *0 local-address=POOL remote-address=POOL
add change-tcp-mss=yes dns-server=8.8.8.8 local-address=POOL name=profile1 \
    remote-address=POOL use-upnp=yes wins-server=8.8.4.4
add change-tcp-mss=yes dns-server=8.8.8.8,8.8.4.4 local-address=L2TP-Pool \
    name=L2TP-Profile remote-address=L2TP-Pool use-encryption=yes
/queue tree
add comment=CERES disabled=yes max-limit=50M name="Download CERES" parent=\
    ether6 queue=default
add disabled=yes limit-at=8M max-limit=50M name=orange_hr_ceres packet-mark=\
    orange_hr_ceres parent="Download CERES" queue=default
add disabled=yes limit-at=20M max-limit=50M name=oracle_ebs_ceres \
    packet-mark=oracle_ebs_ceres parent="Download CERES" queue=default
add disabled=yes limit-at=20M max-limit=50M name=discoverer_ceres \
    packet-mark=discoverer_ceres parent="Download CERES" queue=default
add disabled=yes limit-at=2M max-limit=50M name=mail_ceres packet-mark=\
    mail_ceres parent="Download CERES" queue=default
add comment=NL disabled=yes max-limit=20M name="Download NL" parent=ether5 \
    queue=default
add disabled=yes limit-at=8M max-limit=20M name=oracle_ebs_nl packet-mark=\
    oracle_ebs_nl parent="Download NL" queue=default
add disabled=yes limit-at=8M max-limit=20M name=discoverer_nl packet-mark=\
    discoverer_nl parent="Download NL" queue=default
add disabled=yes limit-at=3M max-limit=20M name=orange_hr_nl packet-mark=\
    orange_hr_nl parent="Download NL" queue=default
add disabled=yes limit-at=1M max-limit=20M name=mail_nl packet-mark=mail_nl \
    parent="Download NL" queue=default
add comment="INTERNET 84M" disabled=yes max-limit=86M name=\
    "Download internet" parent="ether11 - LAN INTERNET" queue=default
add comment="INTERNET 84M" disabled=yes max-limit=86M name="Upload internet" \
    parent=ether2-INTERNET-CERES-2016008163 queue=default
add disabled=yes limit-at=6M max-limit=6M name="subnet1'" packet-mark=subnet1 \
    parent="Upload internet" queue=default
add disabled=yes limit-at=20M max-limit=20M name="subnet2'" packet-mark=\
    subnet2 parent="Upload internet" queue=default
add disabled=yes limit-at=60M max-limit=60M name="subnet3'" packet-mark=\
    subnet3 parent="Upload internet" queue=default
add disabled=yes limit-at=6M max-limit=6M name=subnet1 packet-mark=subnet1 \
    parent="Download internet" queue=default
add disabled=yes limit-at=20M max-limit=20M name=subnet2 packet-mark=subnet2 \
    parent="Download internet" queue=default
add disabled=yes limit-at=60M max-limit=60M name=subnet3 packet-mark=subnet3 \
    parent="Download internet" queue=default
add comment=CERES disabled=yes max-limit=50M name="Upload CERES" parent=\
    vlan-810-METRO-CERES queue=default
add disabled=yes limit-at=20M max-limit=50M name=discoverer_ceres- \
    packet-mark=discoverer_ceres parent="Upload CERES" queue=default
add disabled=yes limit-at=2M max-limit=50M name=mail_ceres- packet-mark=\
    mail_ceres parent="Upload CERES" queue=default
add disabled=yes limit-at=20M max-limit=50M name=oracle_ebs_ceres- \
    packet-mark=oracle_ebs_ceres parent="Upload CERES" queue=default
add disabled=yes limit-at=8M max-limit=50M name=orange_hr_ceres- packet-mark=\
    orange_hr_ceres parent="Upload CERES" queue=default
add comment=NL disabled=yes max-limit=20M name="Upload NL" parent=\
    vlan-811-METRO-NIRWANA queue=default
add disabled=yes limit-at=8M max-limit=20M name=discoverer_nl- packet-mark=\
    discoverer_nl parent="Upload NL" queue=default
add disabled=yes limit-at=1M max-limit=20M name=mail_nl- packet-mark=mail_nl \
    parent="Upload NL" queue=default
add disabled=yes limit-at=8M max-limit=20M name=oracle_ebs_nl- packet-mark=\
    oracle_ebs_nl parent="Upload NL" queue=default
add disabled=yes limit-at=3M max-limit=20M name=orange_hr_nl- packet-mark=\
    orange_hr_nl parent="Upload NL" queue=default
/routing bgp instance
set default as=64514 router-id=10.1.1.4
/snmp community
set [ find default=yes ] name=lapublic
add addresses=::/0 name=cpepublic
/system logging action
add name=action1 remote=202.152.63.117 target=remote
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=loopback list=discover
add interface=bridge1 list=discover
/ip address
add address=10.1.1.4 interface=loopback network=10.1.1.4
add address=182.23.32.6/29 interface="ether11 - LAN INTERNET" network=\
    182.23.32.0
add address=61.8.70.108/28 interface="ether11 - LAN INTERNET" network=\
    61.8.70.96
add address=10.121.121.34/29 interface=vlan-815-METRO-SIN network=\
    10.121.121.32
add address=10.200.200.2/30 interface=ether9-ROUTER_MAIN network=10.200.200.0
add address=61.8.70.97/28 disabled=yes interface=vrrp1 network=61.8.70.96
add address=182.23.32.1/29 disabled=yes interface=vrrp2 network=182.23.32.0
add address=10.100.3.2/30 interface=ether1-TO_FORTI network=10.100.3.0
add address=10.100.3.17/30 interface=vlan-814-METRO-SEMARANG network=\
    10.100.3.16
add address=10.100.3.13/30 interface=vlan-813-METRO-SIDOARJO network=\
    10.100.3.12
add address=10.100.3.5/30 interface=vlan-810-METRO-CERES network=10.100.3.4
add address=10.100.3.9/30 interface=vlan-811-METRO-NIRWANA network=10.100.3.8
add address=172.16.200.203/22 interface=ether7-LAN_CERES network=172.16.200.0
add address=172.16.100.203/22 interface=ether12-LAN_CERES network=\
    172.16.100.0
add address=172.16.100.201 interface=vrrp100 network=172.16.100.201
add address=172.16.200.201 interface=vrrp200 network=172.16.200.201
/ip dhcp-server network
add address=44.44.44.0/29 gateway=44.44.44.1
/ip dns
set servers=8.8.8.8
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
add address=172.20.1.0/29 list="main link"
add address=172.16.100.0/22 list="main link"
add address=172.16.120.0/22 list="main link"
add address=172.16.1.9 list="secondary link"
add address=172.16.2.9 list="secondary link"
add address=172.16.1.3 list="secondary link"
add address=172.16.200.0/22 list="secondary link"
add address=172.16.220.0/22 list="secondary link"
add address=10.12.12.32/29 list="main link"
add address=10.121.121.32/29 list="secondary link"
add address=172.20.1.72/29 list="secondary link"
/ip firewall filter
add action=accept chain=input comment="L2TP VPN" disabled=yes dst-port=1701 \
    protocol=tcp
add action=accept chain=input disabled=yes port=1701,500,4500 protocol=udp
add action=accept chain=input disabled=yes protocol=ipsec-esp
add action=accept chain=input comment="L2TP VPN" disabled=yes dst-port=1701 \
    protocol=tcp
add action=accept chain=input disabled=yes port=1701,500,4500 protocol=udp
add action=accept chain=input disabled=yes protocol=ipsec-esp
/ip firewall mangle
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    sap_sg passthrough=yes src-address=172.20.1.0/29
add action=mark-packet chain=prerouting connection-mark=sap_sg disabled=yes \
    new-packet-mark=sap_sg passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    oracle_ebs_ceres passthrough=yes src-address=172.20.1.40/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_ceres \
    disabled=yes new-packet-mark=oracle_ebs_ceres passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    discoverer_ceres passthrough=yes src-address=172.20.1.48/29
add action=mark-packet chain=prerouting connection-mark=discoverer_ceres \
    disabled=yes new-packet-mark=discoverer_ceres passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    orange_hr_ceres passthrough=yes src-address=172.20.1.56/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_ceres \
    disabled=yes new-packet-mark=orange_hr_ceres passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    mail_ceres passthrough=yes src-address=172.20.1.64/29
add action=mark-packet chain=prerouting connection-mark=mail_ceres disabled=\
    yes new-packet-mark=mail_ceres passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    oracle_ebs_nl passthrough=yes src-address=172.20.1.8/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_nl \
    disabled=yes new-packet-mark=oracle_ebs_nl passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    discoverer_nl passthrough=yes src-address=172.20.1.16/29
add action=mark-packet chain=prerouting connection-mark=discoverer_nl \
    disabled=yes new-packet-mark=discoverer_nl passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    orange_hr_nl passthrough=yes src-address=172.20.1.24/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_nl \
    disabled=yes new-packet-mark=orange_hr_nl passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    mail_nl passthrough=yes src-address=172.20.1.32/29
add action=mark-packet chain=prerouting connection-mark=mail_nl disabled=yes \
    new-packet-mark=mail_nl passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    dc-drc passthrough=yes src-address=172.20.1.72/29
add action=mark-packet chain=prerouting connection-mark=dc-drc disabled=yes \
    new-packet-mark=dc-drc passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=maligi passthrough=yes src-address=\
    192.168.1.0/24
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=maligi passthrough=yes src-address=\
    192.168.11.0/24
add action=mark-packet chain=prerouting connection-mark=maligi disabled=yes \
    new-packet-mark=maligi passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=rawamangun passthrough=yes src-address=\
    192.168.2.0/24
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=rawamangun passthrough=yes src-address=\
    192.168.22.0/24
add action=mark-packet chain=prerouting connection-mark=rawamangun disabled=\
    yes new-packet-mark=rawamangun passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=pasuruan passthrough=yes src-address=\
    192.168.5.0/24
add action=mark-packet chain=prerouting connection-mark=pasuruan disabled=yes \
    new-packet-mark=pasuruan passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address=\
    172.16.2.0/24 new-connection-mark=karawang passthrough=yes src-address=\
    192.168.88.0/24
add action=mark-packet chain=prerouting connection-mark=karawang disabled=yes \
    new-packet-mark=karawang passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    subnet1 passthrough=yes src-address=61.8.70.96/29
add action=mark-packet chain=prerouting connection-mark=subnet1 disabled=yes \
    new-packet-mark=subnet1 passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    subnet2 passthrough=yes src-address=61.8.70.104/29
add action=mark-packet chain=prerouting connection-mark=subnet2 disabled=yes \
    new-packet-mark=subnet2 passthrough=no
add action=mark-connection chain=prerouting disabled=yes new-connection-mark=\
    subnet3 passthrough=yes src-address=182.23.32.0/29
add action=mark-packet chain=prerouting connection-mark=subnet3 disabled=yes \
    new-packet-mark=subnet3 passthrough=no
/ip firewall nat
add action=src-nat chain=srcnat out-interface=vlan-815-METRO-SIN src-address=\
    10.200.200.0/30 to-addresses=10.121.121.34
add action=src-nat chain=srcnat dst-address=10.21.12.36 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.0.0/22 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=10.21.12.36 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.31 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.0.0/22 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.31 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.0.0/22 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.16.240.0/20 to-addresses=\
    172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.17.240.0/20 to-addresses=\
    172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.18.1.0/24 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.11.12.13 out-interface=\
    vlan-815-METRO-SIN src-address=172.18.1.0/24 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    vlan-815-METRO-SIN src-address=172.18.0.0/24 to-addresses=172.16.100.201
add action=masquerade chain=srcnat dst-address=10.11.12.13 out-interface=\
    vlan-815-METRO-SIN src-address=172.18.0.0/24 to-addresses=172.16.100.201
/ip ipsec policy
set 0 dst-address=0.0.0.0/0 src-address=0.0.0.0/0
/ip proxy
set cache-path=web-proxy1
/ip route
add check-gateway=ping distance=1 gateway=10.100.3.1
add check-gateway=ping distance=1 dst-address=10.0.0.0/16 gateway=10.12.12.33 \
    target-scope=30
add check-gateway=ping distance=2 dst-address=10.0.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.1.0.0/16 gateway=10.12.12.33 \
    target-scope=30
add check-gateway=ping distance=2 dst-address=10.1.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.3.0.0/16 gateway=10.12.12.33 \
    target-scope=30
add check-gateway=ping distance=2 dst-address=10.3.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.11.0.0/16 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.11.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.12.11.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.12.11.0/24 gateway=\
    10.121.121.33
add distance=1 dst-address=10.12.12.33/32 gateway=10.200.200.1
add check-gateway=ping distance=1 dst-address=10.12.15.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.12.15.0/24 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.12.100.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.12.100.0/24 gateway=\
    10.121.121.33
add comment=benns distance=1 dst-address=10.20.0.88/30 gateway=172.16.100.1
add check-gateway=ping distance=1 dst-address=10.21.0.0/16 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.21.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.22.0.0/16 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.22.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.23.0.0/16 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.23.0.0/16 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.24.0.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.24.0.0/24 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.25.0.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.25.0.0/24 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.26.0.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.26.0.0/24 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.27.0.0/24 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.27.0.0/24 gateway=\
    10.121.121.33
add check-gateway=ping distance=1 dst-address=10.41.0.0/16 gateway=\
    10.12.12.33 target-scope=30
add check-gateway=ping distance=2 dst-address=10.41.0.0/16 gateway=\
    10.121.121.33
add comment="benns, nlappserver" distance=1 dst-address=172.16.1.7/32 \
    gateway=172.16.200.1
add comment="benns, nldbserver" distance=1 dst-address=172.16.1.9/32 gateway=\
    172.16.200.1
add comment="benns, ceresprod" distance=1 dst-address=172.16.2.9/32 gateway=\
    172.16.200.1
add comment="benns, dw" distance=1 dst-address=172.16.2.11/32 gateway=\
    172.16.200.1
add comment="benns, faiprod" distance=1 dst-address=172.16.2.12/32 gateway=\
    172.16.200.1
add comment="benns, T44-ILOM" distance=1 dst-address=172.16.50.73/32 gateway=\
    172.16.200.1
add comment="benns, T44 cdom [stby]" distance=1 dst-address=172.16.50.74/32 \
    gateway=172.16.200.1
add comment="benns, ceresstby" distance=1 dst-address=172.16.50.75/32 \
    gateway=172.16.100.1
add comment="benns, nlappstby" distance=1 dst-address=172.16.50.76/32 \
    gateway=172.16.100.1
add comment="benns, nldbstby" distance=1 dst-address=172.16.50.77/32 gateway=\
    172.16.100.1
add comment="benns, faistby" distance=1 dst-address=172.16.50.78/32 gateway=\
    172.16.100.1
add distance=1 dst-address=172.16.128.0/22 gateway=172.16.100.1
add distance=1 dst-address=172.16.132.0/22 gateway=10.100.3.1
add distance=1 dst-address=172.16.232.0/22 gateway=10.100.3.1
add distance=1 dst-address=172.18.0.0/24 gateway=10.100.3.1
add distance=1 dst-address=172.18.1.0/24 gateway=10.100.3.1
add distance=1 dst-address=172.18.16.0/22 gateway=10.100.3.1
add distance=1 dst-address=172.20.1.40/29 gateway=172.16.100.1
add comment="Storage HUS-110 @ JAH" distance=1 dst-address=192.168.0.16/32 \
    gateway=172.16.100.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api disabled=yes port=8727
set winbox port=8188
set api-ssl disabled=yes
/routing bgp network
add network=172.20.1.40/29 synchronize=no
add network=172.16.100.0/22 synchronize=no
add network=172.16.128.0/22 synchronize=no
add network=172.16.1.9/32 synchronize=no
add network=172.16.2.9/32 synchronize=no
add network=172.16.200.0/22 synchronize=no
add network=61.8.70.96/28 synchronize=no
add network=182.23.32.0/29 synchronize=no
add network=10.26.2.0/24 synchronize=no
add network=10.29.1.0/24 synchronize=no
add network=172.16.0.0/22 synchronize=no
add network=172.16.8.0/24 synchronize=no
add network=172.16.240.0/20 synchronize=no
add network=172.30.0.0/22 synchronize=no
add network=172.16.48.0/20 synchronize=no
add network=172.17.240.0/20 synchronize=no
add network=172.18.0.0/24 synchronize=no
add network=172.18.1.0/24 synchronize=no
add network=182.23.28.240/29 synchronize=no
add network=202.152.63.120/29 synchronize=no
add network=123.231.246.232/29 synchronize=no
add network=202.152.36.168/29 synchronize=no
add network=202.152.61.48/29 synchronize=no
add network=182.23.98.152/29 synchronize=no
add network=182.23.104.112/29 synchronize=no
add network=182.23.37.200/29 synchronize=no
add network=202.152.28.64/28 synchronize=no
add network=202.152.59.160/29 synchronize=no
add network=172.16.2.12/32 synchronize=no
add network=172.16.1.7/32 synchronize=no
add network=172.16.50.73/32 synchronize=no
add network=172.16.50.74/32 synchronize=no
add network=172.16.50.75/32 synchronize=no
add network=172.16.50.76/32 synchronize=no
add network=172.16.50.77/32 synchronize=no
add network=172.16.50.78/32 synchronize=no
add network=172.16.2.11/32 synchronize=no
add network=172.16.22.0/23 synchronize=no
add network=172.16.36.0/24 synchronize=no
add network=172.18.16.0/22 synchronize=no
add network=172.16.132.0/22 synchronize=no
add network=172.16.232.0/22 synchronize=no
add network=10.1.1.1/32 synchronize=no
add network=10.1.1.2/32 synchronize=no
add network=10.1.1.5/32 synchronize=no
add network=10.1.1.7/32 synchronize=no
add network=192.168.0.16/32 synchronize=no
add network=10.100.3.8/30 synchronize=no
add network=10.100.3.4/30 synchronize=no
/routing bgp peer
add in-filter=MAIN name=TO-ROUTER-MAIN nexthop-choice=force-self \
    remote-address=10.200.200.1 remote-as=64514 ttl=default
add default-originate=if-installed name=SEMARANG-B/U remote-address=\
    10.100.3.18 remote-as=64518 ttl=default
add default-originate=if-installed name=SIDOARJO-B/U remote-address=\
    10.100.3.14 remote-as=64516 ttl=default
add default-originate=if-installed name=CERES-B/U remote-address=10.100.3.6 \
    ttl=default
add default-originate=if-installed name=NL-B/U remote-address=10.100.3.10 \
    remote-as=64513 ttl=default
/routing filter
add action=accept chain=MAIN comment=JAH prefix=182.23.32.0/29
add action=accept chain=MAIN prefix=61.8.70.96/28
add action=accept chain=MAIN prefix=172.16.100.0/22
add action=accept chain=MAIN prefix=172.16.128.0/22
add action=accept chain=MAIN prefix=172.16.200.0/22
add action=accept chain=MAIN prefix=172.16.50.73
add action=accept chain=MAIN prefix=172.16.50.74
add action=accept chain=MAIN prefix=172.16.50.75
add action=accept chain=MAIN prefix=172.16.50.76
add action=accept chain=MAIN prefix=172.16.50.77
add action=accept chain=MAIN prefix=172.16.50.78
add action=accept chain=MAIN prefix=172.16.1.7
add action=accept chain=MAIN prefix=172.16.1.9
add action=accept chain=MAIN prefix=172.16.2.9
add action=accept chain=MAIN prefix=172.16.2.12
add action=accept chain=MAIN prefix=172.16.2.11
add action=accept chain=MAIN prefix=172.20.1.40/29
add action=accept chain=MAIN prefix=192.168.0.16
add action=accept chain=MAIN comment=BDG prefix=123.231.246.232/29
add action=accept chain=MAIN prefix=182.23.28.240/29
add action=accept chain=MAIN prefix=202.152.36.168/29
add action=accept chain=MAIN prefix=202.152.61.48/29
add action=accept chain=MAIN prefix=202.152.63.120/29
add action=accept chain=MAIN prefix=172.16.0.0/22
add action=accept chain=MAIN prefix=172.16.8.0/24
add action=accept chain=MAIN prefix=172.16.240.0/20
add action=accept chain=MAIN prefix=172.30.0.0/22
add action=accept chain=MAIN prefix=172.16.22.0/23
add action=accept chain=MAIN prefix=172.16.36.0/24
add action=accept chain=MAIN prefix=10.1.1.1
add action=accept chain=MAIN prefix=10.100.2.4/30
add action=accept chain=MAIN comment=BKS prefix=172.16.48.0/20
add action=accept chain=MAIN prefix=172.17.240.0/20
add action=accept chain=MAIN prefix=182.23.37.200/29
add action=accept chain=MAIN prefix=182.23.98.152/29
add action=accept chain=MAIN prefix=182.23.104.112/29
add action=accept chain=MAIN prefix=202.152.28.64/28
add action=accept chain=MAIN prefix=202.152.59.160/29
add action=accept chain=MAIN prefix=10.1.1.2
add action=accept chain=MAIN prefix=10.100.2.8/30
add action=accept chain=MAIN comment=SDJ prefix=10.29.1.0/24
add action=accept chain=MAIN prefix=10.1.1.5
add action=accept chain=MAIN comment=SMG prefix=10.26.2.0/24
add action=accept chain=MAIN prefix=10.1.1.7
add action=discard chain=MAIN
/snmp
set enabled=yes trap-generators="" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=POC_CERES_BACKUP
/system logging
add action=action1 topics=error
add action=action1 topics=warning
add action=action1 topics=info
/system ntp client
set enabled=yes primary-ntp=103.123.108.224 secondary-ntp=103.87.68.2
/system routerboard settings
set boot-device=nand-only
