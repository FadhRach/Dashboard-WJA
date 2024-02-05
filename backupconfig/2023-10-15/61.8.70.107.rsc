# oct/15/2023 05:00:00 by RouterOS 6.48
# software id = 88M7-GN1W
#
# model = 1100Hx2
# serial number = 3E6A022B53BA
/interface bridge
add name=BCA
add name=PPTP
add name=bridge1
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] name=ether1-TO_FORTI
set [ find default-name=ether2 ] l2mtu=1600 name=\
    ether2-TRK_METRO-2017004323-MAIN
set [ find default-name=ether3 ] name=ether3-LAN_CERES
set [ find default-name=ether4 ] name=ether4-LAN_CERES
set [ find default-name=ether5 ] name=ether5-TUNELING
set [ find default-name=ether6 ] name=ether6-TO_AWS
set [ find default-name=ether7 ] disabled=yes name=ether7-FORTI_GOLDEN_UNIT
set [ find default-name=ether9 ] name=ether9-ROUTER_BACKUP
set [ find default-name=ether11 ] name=ether11-LAN_INTERNET
set [ find default-name=ether12 ] name=ether12-LAN_INTERNET
/interface l2tp-server
add name=l2tp-in1 user=soettacopacker
add name=l2tp-in2 user=soettafgwh
/interface vrrp
add disabled=yes interface=ether11-LAN_INTERNET name=vrrp1 priority=254 vrid=\
    51
add disabled=yes interface=ether11-LAN_INTERNET name=vrrp2 priority=254 vrid=\
    52
add interface=ether3-LAN_CERES name=vrrp100 priority=254 vrid=100
add interface=ether4-LAN_CERES name=vrrp200 priority=254 vrid=200
/interface vlan
add interface=ether2-TRK_METRO-2017004323-MAIN name=METRO_BDG-vlan-2128 \
    vlan-id=2128
add interface=ether2-TRK_METRO-2017004323-MAIN name=METRO_NL_BEKASI-vlan-2129 \
    vlan-id=2129
add interface=ether2-TRK_METRO-2017004323-MAIN name=METRO_SEMARANG-vlan-809 \
    vlan-id=809
add interface=ether2-TRK_METRO-2017004323-MAIN name=METRO_SIDOARJO-vlan-817 \
    vlan-id=817
add interface=ether2-TRK_METRO-2017004323-MAIN name=METRO_SINGAPORE-vlan-816 \
    vlan-id=816
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing bgp instance
set default as=64514 router-id=10.1.1.3
/snmp community
set [ find default=yes ] name=cpepublic
/interface bridge port
add bridge=bridge1 interface=ether12-LAN_INTERNET
add bridge=bridge1 interface=ether11-LAN_INTERNET
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface l2tp-server server
set enabled=yes ipsec-secret=nasional one-session-per-host=yes
/interface ovpn-server server
set cipher=blowfish128,aes128,aes192,aes256 enabled=yes port=5034 \
    require-client-certificate=yes
/interface pptp-server server
set enabled=yes mrru=1500
/ip address
add address=10.100.2.5/30 interface=METRO_BDG-vlan-2128 network=10.100.2.4
add address=10.100.2.2/30 interface=ether1-TO_FORTI network=10.100.2.0
add address=10.100.2.9/30 interface=METRO_NL_BEKASI-vlan-2129 network=\
    10.100.2.8
add address=10.1.1.3 interface=loopback network=10.1.1.3
add address=10.12.12.34/29 interface=METRO_SINGAPORE-vlan-816 network=\
    10.12.12.32
add address=10.100.2.17/30 interface=METRO_SEMARANG-vlan-809 network=\
    10.100.2.16
add address=10.100.2.13/30 interface=METRO_SIDOARJO-vlan-817 network=\
    10.100.2.12
add address=10.200.200.1/30 interface=ether9-ROUTER_BACKUP network=\
    10.200.200.0
add address=61.8.70.107/28 interface=ether11-LAN_INTERNET network=61.8.70.96
add address=182.23.32.5/29 interface=ether11-LAN_INTERNET network=182.23.32.0
add address=103.8.64.233/29 interface=PPTP network=103.8.64.232
add address=61.8.70.97/28 disabled=yes interface=vrrp1 network=61.8.70.96
add address=182.23.32.1/29 disabled=yes interface=vrrp2 network=182.23.32.0
add address=172.16.100.202/22 interface=ether3-LAN_CERES network=172.16.100.0
add address=172.16.200.202/22 interface=ether4-LAN_CERES network=172.16.200.0
add address=172.16.100.201/22 interface=vrrp100 network=172.16.100.0
add address=172.16.200.201/22 interface=vrrp200 network=172.16.200.0
add address=61.8.70.97/28 interface=ether11-LAN_INTERNET network=61.8.70.96
add address=182.23.32.1/29 interface=ether11-LAN_INTERNET network=182.23.32.0
add address=123.231.208.186/30 interface=ether6-TO_AWS network=\
    123.231.208.184
add address=10.100.200.9/29 disabled=yes interface=METRO_NL_BEKASI-vlan-2129 \
    network=10.100.200.8
add address=10.100.2.21/30 interface=ether7-FORTI_GOLDEN_UNIT network=\
    10.100.2.20
/ip dns
set allow-remote-requests=yes servers=202.152.0.2,202.152.5.36
/ip firewall nat
add action=src-nat chain=srcnat comment=SINGAPORE out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=10.200.200.0/30 to-addresses=\
    10.12.12.34
add action=src-nat chain=srcnat dst-address=10.21.12.36 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.0.0/22 to-addresses=\
    172.16.100.201
add action=src-nat chain=srcnat dst-address=10.21.12.36 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.48.0/20 to-addresses=\
    172.16.100.201
add action=masquerade chain=srcnat dst-address=10.0.12.31 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.0.0/22 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.31 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.48.0/20 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.0.0/22 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.48.0/20 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.16.240.0/20 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.17.240.0/20 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.18.1.0/24 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.11.12.13 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.18.1.0/24 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.0.12.2 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.18.0.0/24 to-addresses=\
    10.12.12.33
add action=masquerade chain=srcnat dst-address=10.11.12.13 out-interface=\
    METRO_SINGAPORE-vlan-816 src-address=172.18.0.0/24 to-addresses=\
    10.12.12.33
add action=src-nat chain=srcnat comment="NAT SEMARANG - SAP RISE" \
    dst-address=172.16.132.0/22 src-address=10.26.2.0/24 to-addresses=\
    172.16.100.202
add action=src-nat chain=srcnat comment="NAT PPTP - SAP RISE" dst-address=\
    172.16.132.0/22 src-address=172.16.86.0/24 to-addresses=172.16.100.202
add action=src-nat chain=srcnat comment="NAT L2TP - SAP RISE" dst-address=\
    172.16.132.0/22 src-address=192.168.20.0/24 to-addresses=172.16.100.201
add action=src-nat chain=srcnat comment="NAT SIDOARJO - SAP RISE" \
    dst-address=172.16.132.0/22 src-address=10.29.1.0/24 to-addresses=\
    172.16.100.202
add action=accept chain=srcnat comment="EXCLUDE NAT " dst-address=\
    172.16.134.69 out-interface=ether1-TO_FORTI src-address=172.16.1.5
add action=accept chain=srcnat dst-address=172.16.134.150 out-interface=\
    ether1-TO_FORTI src-address=172.16.1.5
add action=accept chain=srcnat dst-address=172.16.134.165 out-interface=\
    ether1-TO_FORTI src-address=172.16.1.5
add action=accept chain=srcnat dst-address=172.16.133.60 out-interface=\
    ether1-TO_FORTI src-address=172.16.1.5
add action=src-nat chain=srcnat comment="SNAT SAP-RISE WIRELESS NL" \
    dst-address=172.16.134.69 out-interface=ether1-TO_FORTI src-address=\
    172.17.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.150 out-interface=\
    ether1-TO_FORTI src-address=172.17.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.165 out-interface=\
    ether1-TO_FORTI src-address=172.17.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.133.60 out-interface=\
    ether1-TO_FORTI src-address=172.17.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat comment="SNAT SAP-RISE WIRELESS CERES" \
    dst-address=172.16.134.69 out-interface=ether1-TO_FORTI src-address=\
    172.16.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.150 out-interface=\
    ether1-TO_FORTI src-address=172.16.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.165 out-interface=\
    ether1-TO_FORTI src-address=172.16.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.133.60 out-interface=\
    ether1-TO_FORTI src-address=172.16.240.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat comment="SNAT SAP-RISE WIRED NL" dst-address=\
    172.16.134.69 out-interface=ether1-TO_FORTI src-address=172.16.48.0/20 \
    to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.150 out-interface=\
    ether1-TO_FORTI src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.165 out-interface=\
    ether1-TO_FORTI src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.133.60 out-interface=\
    ether1-TO_FORTI src-address=172.16.48.0/20 to-addresses=172.16.100.201
add action=src-nat chain=srcnat comment="SNAT SAP-RISE WIRED CERES" \
    dst-address=172.16.134.69 out-interface=ether1-TO_FORTI src-address=\
    172.16.0.0/22 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.150 out-interface=\
    ether1-TO_FORTI src-address=172.16.0.0/22 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.134.165 out-interface=\
    ether1-TO_FORTI src-address=172.16.0.0/22 to-addresses=172.16.100.201
add action=src-nat chain=srcnat dst-address=172.16.133.60 out-interface=\
    ether1-TO_FORTI src-address=172.16.0.0/22 to-addresses=172.16.100.201
/ip route
add check-gateway=ping distance=1 gateway=10.100.2.1
add check-gateway=ping distance=1 dst-address=10.0.0.0/16 gateway=10.12.12.33
add check-gateway=ping distance=2 dst-address=10.0.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.1.0.0/16 gateway=10.12.12.33
add check-gateway=ping distance=2 dst-address=10.1.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.3.0.0/16 gateway=10.12.12.33
add check-gateway=ping distance=2 dst-address=10.3.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.11.0.0/16 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.11.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.12.11.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.12.11.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.12.15.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.12.15.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.12.100.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.12.100.0/24 gateway=\
    10.121.121.33 target-scope=30
add comment=benns distance=1 dst-address=10.20.0.88/30 gateway=172.16.100.1
add check-gateway=ping distance=1 dst-address=10.21.0.0/16 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.21.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.22.0.0/16 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.22.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.23.0.0/16 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.23.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.24.0.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.24.0.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.25.0.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.25.0.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.26.0.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.26.0.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.27.0.0/24 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.27.0.0/24 gateway=\
    10.121.121.33 target-scope=30
add check-gateway=ping distance=1 dst-address=10.41.0.0/16 gateway=\
    10.12.12.33
add check-gateway=ping distance=2 dst-address=10.41.0.0/16 gateway=\
    10.121.121.33 target-scope=30
add distance=1 dst-address=10.121.121.33/32 gateway=10.200.200.2
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
add distance=1 dst-address=172.16.16.0/22 gateway=172.16.86.2
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
add distance=1 dst-address=172.16.132.0/22 gateway=10.100.2.1
add distance=1 dst-address=172.16.232.0/22 gateway=10.12.12.33
add distance=1 dst-address=172.17.3.0/24 gateway=172.16.86.3
add distance=1 dst-address=172.18.0.0/24 gateway=10.100.2.1
add distance=1 dst-address=172.18.1.0/24 gateway=10.100.2.1
add distance=1 dst-address=172.18.16.0/22 gateway=10.100.2.1
add distance=1 dst-address=172.20.1.40/29 gateway=172.16.100.1
add comment="Storage HUS-110 @ JAH" distance=1 dst-address=192.168.0.16/32 \
    gateway=172.16.100.1
add distance=1 dst-address=192.168.20.0/24 gateway=l2tp-in1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add local-address=172.16.86.1 name=CIBATU1 password=CIBATU123 remote-address=\
    172.16.86.2
add local-address=172.16.86.1 name=NLJAKBAR password=NLjakbar23 \
    remote-address=172.16.86.3
add local-address=172.16.86.1 name=soettacopacker password=c3r3s!@# \
    remote-address=172.16.86.4
add local-address=172.16.86.1 name=soettafgwh password=c3r3s!@# \
    remote-address=172.16.86.5
add local-address=172.16.86.1 name=fairy password=f41ry remote-address=\
    172.16.86.6
/routing bgp network
add network=172.16.100.0/22 synchronize=no
add network=172.16.200.0/22 synchronize=no
add network=172.16.1.9/32 synchronize=no
add network=172.16.2.9/32 synchronize=no
add network=172.16.1.7/32 synchronize=no
add network=172.16.2.12/32 synchronize=no
add network=172.16.128.0/22 synchronize=no
add network=172.18.0.0/24 synchronize=no
add network=172.18.1.0/24 synchronize=no
add network=172.16.50.73/32 synchronize=no
add network=172.16.50.74/32 synchronize=no
add network=172.16.50.75/32 synchronize=no
add network=172.16.50.76/32 synchronize=no
add network=172.16.50.77/32 synchronize=no
add network=172.16.50.78/32 synchronize=no
add network=61.8.70.96/28 synchronize=no
add network=182.23.32.0/29 synchronize=no
add network=172.16.0.0/22 synchronize=no
add network=172.16.8.0/24 synchronize=no
add network=172.16.240.0/20 synchronize=no
add network=172.30.0.0/22 synchronize=no
add network=172.16.48.0/20 synchronize=no
add network=172.17.240.0/20 synchronize=no
add network=10.26.2.0/24 synchronize=no
add network=10.29.1.0/24 synchronize=no
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
add network=172.20.1.40/29 synchronize=no
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
add network=10.100.2.8/30 synchronize=no
add network=10.100.2.4/30 synchronize=no
add network=172.16.247.0/24 synchronize=no
/routing bgp peer
add default-originate=if-installed name=CERES remote-address=10.100.2.6
add default-originate=if-installed name=NL remote-address=10.100.2.10 \
    remote-as=64513
add default-originate=if-installed name=SEMARANG remote-address=10.100.2.18 \
    remote-as=64518
add default-originate=if-installed name=SIDOARJO remote-address=10.100.2.14 \
    remote-as=64516
add in-filter=BACKUP name=TO-ROUTER-BACKUP nexthop-choice=force-self \
    remote-address=10.200.200.2 remote-as=64514
/routing filter
add action=accept chain=BACKUP comment=JAH prefix=182.23.32.0/29
add action=accept chain=BACKUP prefix=61.8.70.96/28
add action=accept chain=BACKUP prefix=172.16.100.0/22
add action=accept chain=BACKUP prefix=172.16.128.0/22
add action=accept chain=BACKUP prefix=172.16.200.0/22
add action=accept chain=BACKUP prefix=172.16.50.73
add action=accept chain=BACKUP prefix=172.16.50.74
add action=accept chain=BACKUP prefix=172.16.50.75
add action=accept chain=BACKUP prefix=172.16.50.76
add action=accept chain=BACKUP prefix=172.16.50.77
add action=accept chain=BACKUP prefix=172.16.50.78
add action=accept chain=BACKUP prefix=172.16.1.7
add action=accept chain=BACKUP prefix=172.16.1.9
add action=accept chain=BACKUP prefix=172.16.2.9
add action=accept chain=BACKUP prefix=172.16.2.12
add action=accept chain=BACKUP prefix=172.16.2.11
add action=accept chain=BACKUP prefix=172.20.1.40/29
add action=accept chain=BACKUP prefix=192.168.0.16
add action=accept chain=BACKUP comment=BDG prefix=123.231.246.232/29
add action=accept chain=BACKUP prefix=182.23.28.240/29
add action=accept chain=BACKUP prefix=202.152.36.168/29
add action=accept chain=BACKUP prefix=202.152.61.48/29
add action=accept chain=BACKUP prefix=202.152.63.120/29
add action=accept chain=BACKUP prefix=172.16.0.0/22
add action=accept chain=BACKUP prefix=172.16.8.0/24
add action=accept chain=BACKUP prefix=172.16.240.0/20
add action=accept chain=BACKUP prefix=172.30.0.0/22
add action=accept chain=BACKUP prefix=172.16.22.0/23
add action=accept chain=BACKUP prefix=172.16.36.0/24
add action=accept chain=BACKUP prefix=10.1.1.1
add action=accept chain=BACKUP prefix=10.100.3.4/30
add action=accept chain=BACKUP comment=BKS prefix=172.16.48.0/20
add action=accept chain=BACKUP prefix=172.17.240.0/20
add action=accept chain=BACKUP prefix=182.23.37.200/29
add action=accept chain=BACKUP prefix=182.23.98.152/29
add action=accept chain=BACKUP prefix=182.23.104.112/29
add action=accept chain=BACKUP prefix=202.152.28.64/28
add action=accept chain=BACKUP prefix=202.152.59.160/29
add action=accept chain=BACKUP prefix=10.1.1.2
add action=accept chain=BACKUP prefix=10.100.3.8/30
add action=accept chain=BACKUP comment=SDJ prefix=10.29.1.0/24
add action=accept chain=BACKUP prefix=10.1.1.5
add action=accept chain=BACKUP comment=SMG prefix=10.26.2.0/24
add action=accept chain=BACKUP prefix=10.1.1.7
add action=discard chain=BACKUP
/snmp
set enabled=yes trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name="CERES JAH"
/system ntp client
set enabled=yes primary-ntp=103.123.108.224 secondary-ntp=103.87.68.2
/tool sniffer
set file-name=fairy filter-interface=ether1-TO_FORTI filter-ip-address=\
    172.16.102.31/32
