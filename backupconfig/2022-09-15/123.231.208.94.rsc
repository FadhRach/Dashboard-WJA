# sep/15/2022 04:58:11 by RouterOS 6.48.4
# software id = GBZ1-20LS
#
# model = CCR1036-12G-4S
# serial number = AA8A0A5E25B1
/interface bridge
add fast-forward=no name=bridge1
add fast-forward=no name=loopback
/interface ethernet
set [ find default-name=ether1 ] l2mtu=1600 name=ether1-METRO-2016008159 \
    speed=100Mbps
set [ find default-name=ether2 ] l2mtu=1598 name=\
    ether2-INTERNET-CERES-2021278482 speed=100Mbps
set [ find default-name=ether3 ] l2mtu=1600 speed=100Mbps
set [ find default-name=ether4 ] l2mtu=1598 name="ether4 - C" speed=100Mbps
set [ find default-name=ether5 ] l2mtu=1598 name="ether5 - D" speed=100Mbps
set [ find default-name=ether6 ] l2mtu=1598 name="ether6 - E" speed=100Mbps
set [ find default-name=ether7 ] l2mtu=1590 mtu=1590 name="ether7 - F" speed=\
    100Mbps
set [ find default-name=ether8 ] l2mtu=1598 name="ether8 - A" speed=100Mbps
set [ find default-name=ether9 ] l2mtu=1598 name="ether9 - A" speed=100Mbps
set [ find default-name=ether10 ] l2mtu=1600 name="ether10 - B" speed=100Mbps
set [ find default-name=ether11 ] l2mtu=1600 name="ether11 - LAN INTERNET" \
    speed=100Mbps
set [ find default-name=ether12 ] l2mtu=1600 name="ether12 - C" speed=100Mbps
/interface vrrp
add interface="ether11 - LAN INTERNET" name=vrrp1 priority=254 vrid=51
add interface="ether11 - LAN INTERNET" name=vrrp2 priority=254 vrid=52
add interface="ether5 - D" name=vrrp5 priority=254 vrid=55
add interface="ether5 - D" name=vrrp6 priority=254 vrid=56
add interface="ether5 - D" name=vrrp7 priority=254 vrid=57
add interface="ether5 - D" name=vrrp8 priority=254 vrid=58
add interface="ether6 - E" name=vrrp9 priority=254 vrid=59
add interface="ether6 - E" name=vrrp10 priority=254 vrid=60
add interface="ether6 - E" name=vrrp11 priority=254 vrid=61
add interface="ether6 - E" name=vrrp12 priority=254 vrid=62
add interface="ether7 - F" name=vrrp13 priority=254 vrid=63
add interface="ether7 - F" name=vrrp14 priority=254 vrid=64
add interface="ether12 - C" name=vrrp15 priority=254 vrid=54
/interface vlan
add interface=ether1-METRO-2016008159 name=vlan-472-METRO-CERES-2016008162 \
    vlan-id=472
add interface=ether1-METRO-2016008159 name=vlan-475-METRO-NIRWANA-2016008165 \
    vlan-id=475
add interface=ether1-METRO-2016008159 name=vlan-809-METRO-SEMARANG-2018006135 \
    vlan-id=809
add interface=ether1-METRO-2016008159 name=vlan-816-METRO-SIN-2017004323 \
    vlan-id=816
add interface=ether1-METRO-2016008159 name=vlan-817-METRO-SIDOARJO-2018001005 \
    vlan-id=817
add interface=ether1-METRO-2016008159 name=vlan-818-METRO-BALI-2018002442 \
    vlan-id=818
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
add comment=CERES max-limit=50M name="Upload CERES" parent=\
    vlan-472-METRO-CERES-2016008162
add comment=CERES max-limit=50M name="Download CERES" parent="ether6 - E" \
    queue=default
add limit-at=8M max-limit=50M name=orange_hr_ceres packet-mark=\
    orange_hr_ceres parent="Download CERES" queue=default
add limit-at=20M max-limit=50M name=oracle_ebs_ceres packet-mark=\
    oracle_ebs_ceres parent="Download CERES" queue=default
add limit-at=20M max-limit=50M name=discoverer_ceres packet-mark=\
    discoverer_ceres parent="Download CERES" queue=default
add limit-at=2M max-limit=50M name=mail_ceres packet-mark=mail_ceres parent=\
    "Download CERES" queue=default
add comment=NL max-limit=20M name="Download NL" parent="ether5 - D" queue=\
    default
add limit-at=8M max-limit=20M name=oracle_ebs_nl packet-mark=oracle_ebs_nl \
    parent="Download NL" queue=default
add limit-at=8M max-limit=20M name=discoverer_nl packet-mark=discoverer_nl \
    parent="Download NL" queue=default
add limit-at=3M max-limit=20M name=orange_hr_nl packet-mark=orange_hr_nl \
    parent="Download NL" queue=default
add limit-at=1M max-limit=20M name=mail_nl packet-mark=mail_nl parent=\
    "Download NL" queue=default
add comment="INTERNET 84M" max-limit=86M name="Download internet" parent=\
    "ether11 - LAN INTERNET" queue=default
add limit-at=6M max-limit=6M name=subnet1 packet-mark=subnet1 parent=\
    "Download internet" queue=default
add limit-at=20M max-limit=20M name=subnet2 packet-mark=subnet2 parent=\
    "Download internet" queue=default
add limit-at=60M max-limit=60M name=subnet3 packet-mark=subnet3 parent=\
    "Download internet" queue=default
add limit-at=20M max-limit=50M name=discoverer_ceres- packet-mark=\
    discoverer_ceres parent="Upload CERES" queue=default
add limit-at=2M max-limit=50M name=mail_ceres- packet-mark=mail_ceres parent=\
    "Upload CERES" queue=default
add limit-at=20M max-limit=50M name=oracle_ebs_ceres- packet-mark=\
    oracle_ebs_ceres parent="Upload CERES" queue=default
add limit-at=8M max-limit=50M name=orange_hr_ceres- packet-mark=\
    orange_hr_ceres parent="Upload CERES" queue=default
add comment=NL max-limit=20M name="Upload NL" parent=\
    vlan-475-METRO-NIRWANA-2016008165 queue=default
add limit-at=8M max-limit=20M name=discoverer_nl- packet-mark=discoverer_nl \
    parent="Upload NL" queue=default
add limit-at=1M max-limit=20M name=mail_nl- packet-mark=mail_nl parent=\
    "Upload NL" queue=default
add limit-at=8M max-limit=20M name=oracle_ebs_nl- packet-mark=oracle_ebs_nl \
    parent="Upload NL" queue=default
add limit-at=3M max-limit=20M name=orange_hr_nl- packet-mark=orange_hr_nl \
    parent="Upload NL" queue=default
add comment="INTERNET 84M" max-limit=86M name="Upload internet" parent=\
    ether2-INTERNET-CERES-2021278482 queue=default
add limit-at=6M max-limit=6M name=subnet1- packet-mark=subnet1 parent=\
    "Upload internet" queue=default
add limit-at=20M max-limit=20M name=subnet2- packet-mark=subnet2 parent=\
    "Upload internet" queue=default
add limit-at=60M max-limit=60M name=subnet3- packet-mark=subnet3 parent=\
    "Upload internet" queue=default
/routing bgp instance
set default as=64514 router-id=10.1.1.3
add as=65512 client-to-client-reflection=no name=internet
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0 name=lapublic
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
add interface=vlan-472-METRO-CERES-2016008162 list=discover
add interface=vlan-816-METRO-SIN-2017004323 list=discover
add interface=vlan-817-METRO-SIDOARJO-2018001005 list=discover
add interface=vlan-818-METRO-BALI-2018002442 list=discover
add interface=vlan-809-METRO-SEMARANG-2018006135 list=discover
/ip address
add address=123.231.208.94/30 interface=ether2-INTERNET-CERES-2021278482 \
    network=123.231.208.92
add address=10.1.1.3 interface=loopback network=10.1.1.3
add address=172.20.1.52/29 interface="ether6 - E" network=172.20.1.48
add address=172.20.1.60/29 interface="ether6 - E" network=172.20.1.56
add address=172.20.1.67/29 interface="ether6 - E" network=172.20.1.64
add address=172.20.1.11/29 interface="ether5 - D" network=172.20.1.8
add address=172.20.1.19/29 interface="ether5 - D" network=172.20.1.16
add address=172.20.1.35/29 interface="ether5 - D" network=172.20.1.32
add address=172.20.1.27/29 interface="ether5 - D" network=172.20.1.24
add address=172.20.1.45/29 interface="ether6 - E" network=172.20.1.40
add address=172.20.1.76/29 interface="ether7 - F" network=172.20.1.72
add address=192.168.8.17/30 interface="ether10 - B" network=192.168.8.16
add address=182.23.32.5/29 interface="ether11 - LAN INTERNET" network=\
    182.23.32.0
add address=61.8.70.107/28 interface="ether11 - LAN INTERNET" network=\
    61.8.70.96
add address=172.20.2.76/29 interface="ether7 - F" network=172.20.2.72
add address=10.200.200.1/30 interface="ether9 - A" network=10.200.200.0
add address=61.8.70.97/28 interface=vrrp1 network=61.8.70.96
add address=182.23.32.1/29 interface=vrrp2 network=182.23.32.0
add address=172.20.1.9/29 interface=vrrp5 network=172.20.1.8
add address=172.20.1.17/29 interface=vrrp6 network=172.20.1.16
add address=172.20.1.25/29 interface=vrrp7 network=172.20.1.24
add address=172.20.1.33/29 interface=vrrp8 network=172.20.1.32
add address=172.20.1.41/29 interface=vrrp9 network=172.20.1.40
add address=172.20.1.49/29 interface=vrrp10 network=172.20.1.48
add address=172.20.1.57/29 interface=vrrp11 network=172.20.1.56
add address=172.20.1.65/29 interface=vrrp12 network=172.20.1.64
add address=172.20.1.73/29 interface=vrrp13 network=172.20.1.72
add address=172.20.2.73/29 interface=vrrp14 network=172.20.2.72
add address=10.12.12.34/29 interface=vlan-816-METRO-SIN-2017004323 network=\
    10.12.12.32
add address=10.12.12.42/29 interface=vlan-817-METRO-SIDOARJO-2018001005 \
    network=10.12.12.40
add address=10.12.12.50/29 interface=vlan-818-METRO-BALI-2018002442 network=\
    10.12.12.48
add address=10.12.12.58/29 interface=vlan-809-METRO-SEMARANG-2018006135 \
    network=10.12.12.56
add address=10.12.12.10/29 interface=vlan-472-METRO-CERES-2016008162 network=\
    10.12.12.8
add address=10.12.12.18/29 interface=vlan-475-METRO-NIRWANA-2016008165 \
    network=10.12.12.16
add address=172.20.1.4/29 interface="ether12 - C" network=172.20.1.0
add address=172.20.1.1/29 interface=vrrp15 network=172.20.1.0
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
add chain=input comment="L2TP VPN" dst-port=1701 protocol=tcp
add action=accept chain=input port=1701,500,4500 protocol=udp
add action=accept chain=input protocol=ipsec-esp
add chain=input comment="L2TP VPN" dst-port=1701 protocol=tcp
add action=accept chain=input port=1701,500,4500 protocol=udp
add action=accept chain=input protocol=ipsec-esp
/ip firewall mangle
add action=mark-connection chain=prerouting new-connection-mark=sap_sg \
    passthrough=yes src-address=172.20.1.0/29
add action=mark-packet chain=prerouting connection-mark=sap_sg \
    new-packet-mark=sap_sg passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    oracle_ebs_ceres passthrough=yes src-address=172.20.1.40/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_ceres \
    new-packet-mark=oracle_ebs_ceres passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    discoverer_ceres passthrough=yes src-address=172.20.1.48/29
add action=mark-packet chain=prerouting connection-mark=discoverer_ceres \
    new-packet-mark=discoverer_ceres passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    orange_hr_ceres passthrough=yes src-address=172.20.1.56/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_ceres \
    new-packet-mark=orange_hr_ceres passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail_ceres \
    passthrough=yes src-address=172.20.1.64/29
add action=mark-packet chain=prerouting connection-mark=mail_ceres \
    new-packet-mark=mail_ceres passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=oracle_ebs_nl \
    passthrough=yes src-address=172.20.1.8/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_nl \
    new-packet-mark=oracle_ebs_nl passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=discoverer_nl \
    passthrough=yes src-address=172.20.1.16/29
add action=mark-packet chain=prerouting connection-mark=discoverer_nl \
    new-packet-mark=discoverer_nl passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=orange_hr_nl \
    passthrough=yes src-address=172.20.1.24/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_nl \
    new-packet-mark=orange_hr_nl passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail_nl \
    passthrough=yes src-address=172.20.1.32/29
add action=mark-packet chain=prerouting connection-mark=mail_nl \
    new-packet-mark=mail_nl passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=dc-drc \
    passthrough=yes src-address=172.20.1.72/29
add action=mark-packet chain=prerouting connection-mark=dc-drc \
    new-packet-mark=dc-drc passthrough=no
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=maligi passthrough=yes src-address=192.168.1.0/24
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=maligi passthrough=yes src-address=192.168.11.0/24
add action=mark-packet chain=prerouting connection-mark=maligi \
    new-packet-mark=maligi passthrough=no
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=rawamangun passthrough=yes src-address=192.168.2.0/24
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=rawamangun passthrough=yes src-address=\
    192.168.22.0/24
add action=mark-packet chain=prerouting connection-mark=rawamangun \
    new-packet-mark=rawamangun passthrough=no
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=pasuruan passthrough=yes src-address=192.168.5.0/24
add action=mark-packet chain=prerouting connection-mark=pasuruan \
    new-packet-mark=pasuruan passthrough=no
add action=mark-connection chain=prerouting dst-address=172.16.2.0/24 \
    new-connection-mark=karawang passthrough=yes src-address=192.168.88.0/24
add action=mark-packet chain=prerouting connection-mark=karawang \
    new-packet-mark=karawang passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=subnet1 \
    passthrough=yes src-address=61.8.70.96/29
add action=mark-packet chain=prerouting connection-mark=subnet1 \
    new-packet-mark=subnet1 passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=subnet2 \
    passthrough=yes src-address=61.8.70.104/29
add action=mark-packet chain=prerouting connection-mark=subnet2 \
    new-packet-mark=subnet2 passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=subnet3 \
    passthrough=yes src-address=182.23.32.0/29
add action=mark-packet chain=prerouting connection-mark=subnet3 \
    new-packet-mark=subnet3 passthrough=no
/ip firewall nat
add action=masquerade chain=srcnat dst-address=203.160.128.178 dst-port=123 \
    out-interface=ether2-INTERNET-CERES-2021278482 protocol=udp
add action=masquerade chain=srcnat src-address=192.168.88.0/24
add action=src-nat chain=srcnat out-interface=vlan-816-METRO-SIN-2017004323 \
    src-address=10.200.200.0/30 to-addresses=10.12.12.34
/ip ipsec policy
set 0 dst-address=0.0.0.0/0 src-address=0.0.0.0/0
/ip proxy
set cache-path=web-proxy1
/ip route
add check-gateway=ping distance=1 dst-address=10.0.0.0/8 gateway=10.12.12.33 \
    routing-mark=MAIN
add distance=2 dst-address=10.0.0.0/8 gateway=10.121.121.33 routing-mark=MAIN \
    target-scope=30
add check-gateway=ping distance=1 dst-address=172.16.60.0/24 gateway=\
    10.12.12.33 routing-mark=MAIN
add distance=2 dst-address=172.16.60.0/24 gateway=10.121.121.33 routing-mark=\
    MAIN target-scope=30
add check-gateway=ping distance=1 dst-address=172.16.61.0/24 gateway=\
    10.12.12.33 routing-mark=MAIN
add distance=2 dst-address=172.16.61.0/24 gateway=10.121.121.33 routing-mark=\
    MAIN target-scope=30
add check-gateway=ping distance=1 dst-address=172.16.62.0/24 gateway=\
    10.12.12.33 routing-mark=MAIN
add distance=2 dst-address=172.16.62.0/24 gateway=10.121.121.33 routing-mark=\
    MAIN target-scope=30
add check-gateway=ping distance=1 dst-address=172.16.63.0/24 gateway=\
    10.12.12.33 routing-mark=MAIN
add distance=2 dst-address=172.16.63.0/24 gateway=10.121.121.33 routing-mark=\
    MAIN target-scope=30
add check-gateway=ping distance=1 dst-address=10.0.0.0/8 gateway=\
    10.121.121.33 routing-mark=SECONDARY target-scope=30
add distance=2 dst-address=10.0.0.0/8 gateway=10.12.12.33 routing-mark=\
    SECONDARY
add check-gateway=ping distance=1 dst-address=172.16.60.0/24 gateway=\
    10.121.121.33 routing-mark=SECONDARY target-scope=30
add distance=2 dst-address=172.16.60.0/24 gateway=10.12.12.33 routing-mark=\
    SECONDARY
add check-gateway=ping distance=1 dst-address=172.16.61.0/24 gateway=\
    10.121.121.33 routing-mark=SECONDARY target-scope=30
add distance=2 dst-address=172.16.61.0/24 gateway=10.12.12.33 routing-mark=\
    SECONDARY
add check-gateway=ping distance=1 dst-address=172.16.62.0/24 gateway=\
    10.121.121.33 routing-mark=SECONDARY target-scope=30
add distance=2 dst-address=172.16.62.0/24 gateway=10.12.12.33 routing-mark=\
    SECONDARY
add check-gateway=ping distance=1 dst-address=172.16.63.0/24 gateway=\
    10.121.121.33 routing-mark=SECONDARY target-scope=30
add distance=2 dst-address=172.16.63.0/24 gateway=10.12.12.33 routing-mark=\
    SECONDARY
add check-gateway=ping distance=1 dst-address=10.0.0.0/16 gateway=10.12.12.33
add distance=2 dst-address=10.0.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.1.0.0/16 gateway=10.12.12.33
add distance=2 dst-address=10.1.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.3.0.0/16 gateway=10.12.12.33
add distance=2 dst-address=10.3.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.11.0.0/16 gateway=\
    10.12.12.33
add distance=2 dst-address=10.11.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.12.11.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=10.12.11.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=10.12.15.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=10.12.15.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=10.12.100.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=10.12.100.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=10.21.0.0/16 gateway=\
    10.12.12.33
add distance=2 dst-address=10.21.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.22.0.0/16 gateway=\
    10.12.12.33
add distance=2 dst-address=10.22.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.23.0.0/16 gateway=\
    10.12.12.33
add distance=2 dst-address=10.23.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.41.0.0/16 gateway=\
    10.12.12.33
add distance=2 dst-address=10.41.0.0/16 gateway=10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.121.121.33/32 gateway=\
    10.200.200.2
add distance=1 dst-address=172.16.1.3/32 gateway=172.20.1.2
add distance=1 dst-address=172.16.1.9/32 gateway=172.20.1.2
add distance=1 dst-address=172.16.2.9/32 gateway=172.20.1.2
add check-gateway=ping distance=1 dst-address=172.16.60.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=172.16.60.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=172.16.61.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=172.16.61.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=172.16.62.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=172.16.62.0/24 gateway=10.121.121.33 target-scope=\
    30
add check-gateway=ping distance=1 dst-address=172.16.63.0/24 gateway=\
    10.12.12.33
add distance=2 dst-address=172.16.63.0/24 gateway=10.121.121.33 target-scope=\
    30
add distance=1 dst-address=172.16.100.0/22 gateway=172.20.1.2
add distance=1 dst-address=172.16.120.0/22 gateway=172.20.1.2
add distance=1 dst-address=172.16.128.0/22 gateway=172.20.1.2
add distance=1 dst-address=172.16.200.0/22 gateway=172.20.1.75
add distance=1 dst-address=172.16.220.0/22 gateway=172.20.1.75
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api port=8727
set winbox port=8188
set api-ssl disabled=yes
/routing bgp network
add network=172.20.1.8/29 synchronize=no
add network=172.20.1.16/29 synchronize=no
add network=172.20.1.32/29 synchronize=no
add network=172.20.1.24/29 synchronize=no
add network=172.20.1.40/29 synchronize=no
add network=172.20.1.48/29 synchronize=no
add network=172.20.1.56/29 synchronize=no
add network=172.20.1.64/29 synchronize=no
add network=172.20.1.72/29 synchronize=no
add network=172.16.100.0/22 synchronize=no
add network=172.16.120.0/22 synchronize=no
add network=172.20.1.0/29 synchronize=no
add network=172.16.1.3/32 synchronize=no
add network=172.16.1.9/32 synchronize=no
add network=172.16.2.9/32 synchronize=no
add network=172.16.200.0/22 synchronize=no
add network=172.16.220.0/22 synchronize=no
add network=61.8.70.96/28 synchronize=no
add network=182.23.32.0/29 synchronize=no
add network=172.20.2.72/29 synchronize=no
/routing bgp peer
add in-filter=SIDOARJO-IN name=SIDOARJO remote-address=10.12.12.41 remote-as=\
    64516 ttl=default
add in-filter=SEMARANG-IN name=SEMARANG remote-address=10.12.12.57 remote-as=\
    64518 ttl=default
add in-filter=NL-IN name=NL remote-address=10.12.12.17 remote-as=64513 ttl=\
    default
add in-filter=CERES-IN name=CERES remote-address=10.12.12.9 ttl=default
add default-originate=if-installed in-filter=BACKUP-IN name=BACKUP \
    nexthop-choice=force-self remote-address=10.200.200.2 remote-as=64514 \
    ttl=default
add in-filter=INET-IN instance=internet name=INTERNET out-filter=INET-OUT \
    remote-address=123.231.208.93 remote-as=4800 ttl=default
/routing filter
add action=accept chain=CERES-IN prefix=172.20.0.32/29
add action=accept chain=CERES-IN prefix=172.20.0.40/29
add action=accept chain=CERES-IN prefix=172.20.0.48/29
add action=accept chain=CERES-IN prefix=172.20.0.56/29
add action=discard chain=CERES-IN
add action=accept chain=NL-IN prefix=172.20.0.160/29
add action=accept chain=NL-IN prefix=172.20.0.168/29
add action=accept chain=NL-IN prefix=172.20.0.176/29
add action=accept chain=NL-IN prefix=172.20.0.184/29
add action=discard chain=NL-IN
add action=accept chain=BACKUP-IN prefix=172.20.0.32/29
add action=accept chain=BACKUP-IN prefix=172.20.0.48/29
add action=accept chain=BACKUP-IN prefix=172.20.0.56/29
add action=accept chain=BACKUP-IN prefix=172.20.0.40/29
add action=accept chain=BACKUP-IN prefix=172.20.0.160/29
add action=accept chain=BACKUP-IN prefix=172.20.0.176/29
add action=accept chain=BACKUP-IN prefix=172.20.0.184/29
add action=accept chain=BACKUP-IN prefix=172.20.0.168/29
add action=accept chain=BACKUP-IN prefix=172.20.3.0/29
add action=accept chain=BACKUP-IN prefix=10.29.1.0/24
add action=accept chain=BACKUP-IN prefix=172.20.6.0/29
add action=accept chain=BACKUP-IN prefix=172.20.1.0/24 prefix-length=24-32
add action=accept chain=BACKUP-IN prefix=172.20.2.0/24 prefix-length=24-32
add action=accept chain=BACKUP-IN prefix=172.16.0.0/16 prefix-length=16-32
add action=accept chain=BACKUP-IN prefix=61.8.70.96/28
add action=accept chain=BACKUP-IN prefix=182.23.32.0/29
add action=accept chain=BACKUP-IN prefix=0.0.0.0/0
add action=discard chain=BACKUP-IN
add action=accept chain=SIDOARJO-IN prefix=172.20.3.0/29
add action=accept chain=SIDOARJO-IN prefix=10.29.1.0/24
add action=discard chain=SIDOARJO-IN
add action=accept chain=SEMARANG-IN prefix=172.20.6.0/29
add action=discard chain=SEMARANG-IN
add action=accept chain=INET-IN prefix=0.0.0.0/0
add action=discard chain=INET-IN
add action=accept chain=INET-OUT prefix=61.8.70.96/28 set-bgp-prepend=5
add action=accept chain=INET-OUT prefix=182.23.32.0/29 set-bgp-prepend=5
add action=discard chain=INET-OUT
/snmp
set enabled=yes trap-community=cpepublic
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=CERES_MAIN
/system logging
add action=action1 topics=info
add action=action1 topics=error
add action=action1 topics=warning
/system routerboard settings
set boot-device=nand-only
