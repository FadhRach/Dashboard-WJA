# apr/15/2023 04:59:48 by RouterOS 6.48.4
# software id = PAC6-ZVYI
#
# model = CCR1036-8G-2S+
# serial number = D83A0D9EDEE9
/interface ethernet
set [ find default-name=sfp-sfpplus1 ] name=".:LINK TO WAN INTERNET:."
/interface eoip
add local-address=172.169.0.38 mac-address=02:EE:33:67:18:97 name=IDM1 \
    remote-address=172.169.0.39 tunnel-id=38
add local-address=172.169.0.40 mac-address=02:EE:33:67:18:97 name=IDM2 \
    remote-address=172.169.0.41 tunnel-id=40
add local-address=172.169.0.30 mac-address=02:EE:33:67:18:97 name=\
    eoip-tunnel3-Ciereng1 remote-address=172.169.0.31 tunnel-id=30
add local-address=172.169.0.32 mac-address=02:EE:33:67:18:97 name=\
    eoip-tunnel4-Ciereng2 remote-address=172.169.0.33 tunnel-id=32
/interface bonding
add name=CIERENG slaves=eoip-tunnel3-Ciereng1,eoip-tunnel4-Ciereng2
add name=INDRAMAYU slaves=IDM1,IDM2
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/snmp community
add addresses=::/0 name=lapublic
/user group
set write policy="local,telnet,ssh,reboot,read,write,test,winbox,password,web,\
    sniff,sensitive,api,romon,dude,tikapp,!ftp,!policy"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/dude
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface detect-internet
set detect-interface-list=all
/interface l2tp-server server
set enabled=yes max-mru=2000 max-mtu=2000 mrru=2000
/interface pptp-server server
set enabled=yes mrru=1500
/ip address
add address=123.231.237.114/29 interface=".:LINK TO WAN INTERNET:." network=\
    123.231.237.112
add address=123.231.237.115/29 interface=".:LINK TO WAN INTERNET:." network=\
    123.231.237.112
add address=123.231.237.116/29 interface=".:LINK TO WAN INTERNET:." network=\
    123.231.237.112
add address=123.231.237.117/29 interface=".:LINK TO WAN INTERNET:." network=\
    123.231.237.112
add address=123.231.237.118/29 interface=".:LINK TO WAN INTERNET:." network=\
    123.231.237.112
add address=150.150.150.1/24 interface=CIERENG network=150.150.150.0
add address=160.160.160.1/30 interface=INDRAMAYU network=160.160.160.0
/ip dns
set servers=202.152.0.2,202.152.5.36
/ip firewall filter
add action=accept chain=output disabled=yes dst-address=172.169.0.3 dst-port=\
    8291 protocol=tcp
add action=accept chain=output disabled=yes dst-address=172.169.0.5 dst-port=\
    8291 protocol=tcp
add action=accept chain=output disabled=yes dst-address=172.169.0.2 dst-port=\
    8291 protocol=tcp
add action=accept chain=output disabled=yes dst-address=172.169.0.8 dst-port=\
    8291 protocol=tcp
add action=fasttrack-connection chain=forward dst-address=172.169.0.14
/ip firewall nat
add action=masquerade chain=srcnat out-interface=".:LINK TO WAN INTERNET:." \
    src-address=172.169.0.0/24
add action=masquerade chain=srcnat out-interface=".:LINK TO WAN INTERNET:." \
    src-address=150.150.150.0/24
add action=masquerade chain=srcnat out-interface=".:LINK TO WAN INTERNET:." \
    src-address=160.160.160.0/30
add action=src-nat chain=srcnat comment="D-NAT CCR CT MAJALENGKA" \
    dst-address=172.169.0.3 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=8090 \
    protocol=tcp to-addresses=172.169.0.3 to-ports=8291
add action=dst-nat chain=dstnat comment="2022307087 KWS CIANJUR 11" \
    dst-address=123.231.237.115 dst-port=190 protocol=tcp to-addresses=\
    172.169.0.27 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.27 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=191 \
    protocol=tcp to-addresses=192.169.1.251 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.251 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=192 \
    protocol=tcp to-addresses=192.169.1.250 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.250 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=195 \
    protocol=tcp to-addresses=192.169.1.252 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.1.252 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=193 \
    protocol=tcp to-addresses=192.169.101.250 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.250 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=194 \
    protocol=tcp to-addresses=192.169.201.250 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.250 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat comment="D-NAT KWS KARANGHARJA" disabled=yes \
    dst-address=192.169.0.172 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8100 protocol=tcp to-addresses=192.169.0.172 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT KWS KARANGHARJAA" disabled=yes \
    dst-address=172.169.0.5 dst-port=100 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8200 protocol=tcp to-addresses=172.169.0.5 to-ports=100
add action=src-nat chain=srcnat comment="D-NAT PTP ANJATANN" disabled=yes \
    dst-address=172.169.0.17 dst-port=100 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8300 protocol=tcp to-addresses=172.169.0.17 to-ports=100
add action=src-nat chain=srcnat comment="PTP CIKADU GIRIJAYA" disabled=yes \
    dst-address=172.169.0.15 dst-port=100 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8210 protocol=tcp to-addresses=172.169.0.15 to-ports=100
add action=src-nat chain=srcnat comment="PTMP CIANJUR 2 CIKADU" disabled=yes \
    dst-address=172.169.0.15 dst-port=200 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8310 protocol=tcp to-addresses=172.169.0.15 to-ports=200
add action=src-nat chain=srcnat comment="PTP CIANJUR 2 CIKADU" disabled=yes \
    dst-address=172.169.0.15 dst-port=300 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8410 protocol=tcp to-addresses=172.169.0.15 to-ports=300
add action=src-nat chain=srcnat comment="D-NAT KWS CIANJUR 2 CIKADU" \
    disabled=yes dst-address=172.169.0.15 dst-port=8291 protocol=tcp \
    to-addresses=172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.114 \
    dst-port=8110 protocol=tcp to-addresses=172.169.0.15 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT CCR CT CICURUG SKB" disabled=\
    yes dst-address=172.169.0.2 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat disabled=yes dst-address=123.231.237.116 \
    dst-port=8090 protocol=tcp to-addresses=172.169.0.2 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT CCR CT CIERENG SUBANG" \
    dst-address=150.150.150.2 dst-port=8291 protocol=tcp to-addresses=\
    150.150.150.1
add action=src-nat chain=srcnat comment="D-NAT CCR CT CIERENG SUBANG" \
    dst-address=172.169.0.33 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.32
add action=dst-nat chain=dstnat comment=CIERENG dst-address=123.231.237.114 \
    dst-port=8090 protocol=tcp to-addresses=150.150.150.2 to-ports=8291
add action=dst-nat chain=dstnat comment=CIERENG dst-address=123.231.237.115 \
    dst-port=8090 protocol=tcp to-addresses=172.169.0.33 to-ports=8293
add action=src-nat chain=srcnat comment="D-NAT CCR CT CIERENG SUBANG" \
    dst-address=172.169.0.41 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.40
add action=dst-nat chain=dstnat comment=CIERENG dst-address=123.231.237.117 \
    dst-port=7788 protocol=tcp to-addresses=172.169.0.41 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT KBB 2 CIBODAS" dst-address=\
    172.169.0.9 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8119 \
    protocol=tcp to-addresses=172.169.0.9 to-ports=8291
add action=src-nat chain=srcnat comment="PTMP KBB 2 CIBODAS" dst-address=\
    172.169.0.9 dst-port=100 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8120 \
    protocol=tcp to-addresses=172.169.0.9 to-ports=100
add action=src-nat chain=srcnat comment="PTP CIBOGO KBB 2" dst-address=\
    172.169.0.9 dst-port=200 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8130 \
    protocol=tcp to-addresses=172.169.0.9 to-ports=200
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8131 \
    protocol=tcp to-addresses=172.10.10.6 to-ports=8080
add action=src-nat chain=srcnat dst-address=172.10.10.6 dst-port=8080 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8132 \
    protocol=tcp to-addresses=172.10.10.1 to-ports=443
add action=src-nat chain=srcnat dst-address=172.10.10.3 dst-port=443 \
    protocol=tcp to-addresses=172.10.10.1
add action=dst-nat chain=dstnat comment="PTP CT PAGELARAN#R. GIRIJAYA" \
    dst-address=123.231.237.114 dst-port=8301 protocol=tcp to-addresses=\
    192.169.0.178 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.0.178 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="PTP R. GIRIJAYA#CT PAGELARAN" \
    dst-address=123.231.237.114 dst-port=8302 protocol=tcp to-addresses=\
    172.169.0.13 to-ports=120
add action=src-nat chain=srcnat dst-address=172.169.0.13 dst-port=120 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat comment=SRC_BOJONGSALAM dst-address=\
    172.169.0.70 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment=DST_BOJONGSALAM dst-address=\
    123.231.237.118 dst-port=9191 protocol=tcp to-addresses=172.169.0.70 \
    to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT KWS KERTANEGARA SUBANG" \
    dst-address=10.200.200.14 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=277 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8291
add action=dst-nat chain=dstnat comment="PTP CT PAGELARAN#KARANGHARJA" \
    dst-address=123.231.237.114 dst-port=8303 protocol=tcp to-addresses=\
    192.169.0.170 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.0.170 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="PTP KARANGHARJA#CT PAGELARAN" \
    dst-address=123.231.237.114 dst-port=8304 protocol=tcp to-addresses=\
    172.169.0.13 to-ports=140
add action=src-nat chain=srcnat dst-address=172.169.0.13 dst-port=140 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=8091 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8291
add action=dst-nat chain=dstnat comment="D-NAT KWS TANJUNG SURIAN" \
    dst-address=123.231.237.117 dst-port=273 protocol=tcp to-addresses=\
    10.200.200.22 to-ports=8291
add action=src-nat chain=srcnat dst-address=10.200.200.22 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="D-NAT R. AWILEGA" dst-address=\
    123.231.237.117 dst-port=8094 protocol=tcp to-addresses=10.200.200.22 \
    to-ports=101
add action=dst-nat chain=dstnat comment="D-NAT TANJUNGMULYA" dst-address=\
    123.231.237.117 dst-port=8095 protocol=tcp to-addresses=10.200.200.22 \
    to-ports=201
add action=dst-nat chain=dstnat comment="PTP R. AWILEGA#TANJUNGKERTA" \
    dst-address=123.231.237.117 dst-port=8096 protocol=tcp to-addresses=\
    10.200.200.22 to-ports=203
add action=dst-nat chain=dstnat comment="PTP TANJUNGKERTA#R. AWILEGA" \
    dst-address=123.231.237.117 dst-port=8097 protocol=tcp to-addresses=\
    10.200.200.22 to-ports=204
add action=src-nat chain=srcnat comment="PTP CT CIERENG#KERTANEGARA" \
    dst-address=10.200.200.14 dst-port=8071 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat comment="PTP CT CIERENG#TANJUNG SURIAN" \
    dst-address=123.231.237.117 dst-port=271 protocol=tcp to-addresses=\
    172.169.0.33 to-ports=71
add action=dst-nat chain=dstnat comment="PTP TANJUNG SURIAN#CT CIERENG" \
    dst-address=123.231.237.117 dst-port=272 protocol=tcp to-addresses=\
    172.169.0.31 to-ports=72
add action=dst-nat chain=dstnat comment="PTMP TANJUNG SURIAN" dst-address=\
    123.231.237.117 dst-port=274 protocol=tcp to-addresses=172.169.0.31 \
    to-ports=73
add action=dst-nat chain=dstnat comment="PTP TANJUNG SURIAN#R. AWILEGA" \
    dst-address=123.231.237.117 dst-port=275 protocol=tcp to-addresses=\
    172.169.0.31 to-ports=74
add action=dst-nat chain=dstnat comment="PTP R. AWILEGA#TANJUNG SURIAN" \
    dst-address=123.231.237.117 dst-port=276 protocol=tcp to-addresses=\
    172.169.0.31 to-ports=75
add action=dst-nat chain=dstnat comment="PTP CT INDRAMAYU#CANGKINGAN" \
    dst-address=123.231.237.114 dst-port=171 protocol=tcp to-addresses=\
    172.169.0.7 to-ports=101
add action=src-nat chain=srcnat dst-address=172.169.0.7 dst-port=101 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="PTP CANGKINGAN#CT INDRAMAYU" \
    dst-address=123.231.237.114 dst-port=172 protocol=tcp to-addresses=\
    172.169.0.7 to-ports=102
add action=src-nat chain=srcnat dst-address=172.169.0.7 dst-port=102 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="PTP CT CIERENG#KERTANEGARA" \
    dst-address=123.231.237.117 dst-port=91 protocol=tcp to-addresses=\
    172.169.0.31 to-ports=50
add action=src-nat chain=srcnat comment="PTP CT CIERENG#KERTANEGARA" \
    dst-address=10.200.200.14 dst-port=8072 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=92 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8072
add action=src-nat chain=srcnat comment="PTMP KERTANEGARA" dst-address=\
    10.200.200.14 dst-port=8060 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=100 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8060
add action=src-nat chain=srcnat comment="PTP KERTANEGARA" dst-address=\
    10.200.200.14 dst-port=8065 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=200 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8065
add action=src-nat chain=srcnat comment="PTP ANJATAN BARU#KERTANEGARA" \
    dst-address=10.200.200.14 dst-port=8061 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=8093 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8061
add action=src-nat chain=srcnat comment="PTP KERTANEGARA#ANJATAN BARU" \
    dst-address=10.200.200.14 dst-port=8062 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=8094 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8062
add action=src-nat chain=srcnat comment="PTMP ANJATAN BARU" dst-address=\
    10.200.200.14 dst-port=8063 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=8095 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8063
add action=src-nat chain=srcnat comment="D-NAT KWS ANJATAN BARU" dst-address=\
    10.200.200.14 dst-port=8070 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.117 dst-port=8092 \
    protocol=tcp to-addresses=10.200.200.14 to-ports=8070
add action=src-nat chain=srcnat comment="D-NAT KWS WARUNG KIARA" dst-address=\
    10.200.200.46 dst-port=8060 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=8093 \
    protocol=tcp to-addresses=10.200.200.46 to-ports=8060
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=8062 \
    protocol=tcp to-addresses=10.200.200.46 to-ports=120
add action=src-nat chain=srcnat comment="D-NAT CCR CT INDRAMAYU" dst-address=\
    172.169.0.7 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8089 \
    protocol=tcp to-addresses=172.169.0.7 to-ports=8291
add action=dst-nat chain=dstnat comment="D-NAT PTMP WARUNG KIARA" \
    dst-address=123.231.237.116 dst-port=8061 protocol=tcp to-addresses=\
    10.200.200.46 to-ports=110
add action=src-nat chain=srcnat comment="D-NAT MKT KWS SUKAMAJU KUNINGAN" \
    dst-address=172.169.0.8 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8095 \
    protocol=tcp to-addresses=172.169.0.8 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KWS PALUTUNGAN KUNINGAN" \
    dst-address=172.169.0.10 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8096 \
    protocol=tcp to-addresses=172.169.0.10 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT DESA CIBUNTU KUNINGAN" \
    dst-address=172.169.0.11 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=8094 \
    protocol=tcp to-addresses=172.169.0.11 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT PAGELARAN" dst-address=\
    172.169.0.13 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8013 \
    protocol=tcp to-addresses=172.169.0.13 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KARANGMULYA" dst-address=\
    172.169.0.34 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8034 \
    protocol=tcp to-addresses=172.169.0.34 to-ports=8291
add action=src-nat chain=srcnat comment=\
    "D-NAT RADIO PTMP KWS SUKAMAJU KUNINGAN" dst-address=192.169.100.42 \
    dst-port=443 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8097 \
    protocol=tcp to-addresses=192.169.100.42 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT RADIO PTP SUBANG-DAWUAN" \
    dst-address=192.169.1.2 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=src-nat chain=srcnat dst-address=192.169.1.3 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat dst-address=192.169.1.5 dst-port=93 protocol=\
    tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.118 dst-port=91 \
    protocol=tcp to-addresses=192.169.1.2 to-ports=80
add action=dst-nat chain=dstnat dst-address=123.231.237.118 dst-port=92 \
    protocol=tcp to-addresses=192.169.1.3 to-ports=80
add action=dst-nat chain=dstnat dst-address=123.231.237.118 dst-port=93 \
    protocol=tcp to-addresses=192.169.1.5 to-ports=93
add action=src-nat chain=srcnat comment="D-NAT MKT KWS GN MENYAN MAJALENGKA" \
    dst-address=10.200.200.2 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8091 \
    protocol=tcp to-addresses=10.200.200.2 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KWS SUKADANA MAJALENGKA" \
    dst-address=10.200.200.6 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=8092 \
    protocol=tcp to-addresses=10.200.200.6 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KWS GINANJAR SUKABUMI" \
    dst-address=10.200.200.42 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=8091 \
    protocol=tcp to-addresses=10.200.200.42 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KWS TAMANSARI SUKABUMI" \
    dst-address=10.200.200.46 dst-port=8291 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=8092 \
    protocol=tcp to-addresses=10.200.200.46 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.0.138 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8098 \
    protocol=tcp to-addresses=192.169.0.138 to-ports=443
add action=src-nat chain=srcnat comment="MKT JATIBARANG BARU" dst-address=\
    172.169.0.12 dst-port=8060 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8111 \
    protocol=tcp to-addresses=172.169.0.12 to-ports=8060
add action=src-nat chain=srcnat comment="PTMP CANGKINGAN" dst-address=\
    172.169.0.12 dst-port=8070 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8113 \
    protocol=tcp to-addresses=172.169.0.12 to-ports=8070
add action=src-nat chain=srcnat comment="PTP CANGKINGAN" dst-address=\
    172.169.0.12 dst-port=8065 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8114 \
    protocol=tcp to-addresses=172.169.0.12 to-ports=8065
add action=src-nat chain=srcnat comment="MKT CANGKINGAN" dst-address=\
    172.169.0.12 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8112 \
    protocol=tcp to-addresses=172.169.0.12 to-ports=8291
add action=src-nat chain=srcnat comment="D-NAT MKT KWS DAWUAN" dst-address=\
    192.169.1.5 dst-port=8355 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.118 dst-port=8093 \
    protocol=tcp to-addresses=192.169.1.5 to-ports=8355
add action=src-nat chain=srcnat comment=\
    "D-NAT RADIO PTP SISI GN MENYAN MJLGRA" dst-address=192.169.0.11 \
    dst-port=443 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2754 \
    protocol=tcp to-addresses=192.169.0.11 to-ports=443
add action=src-nat chain=srcnat comment=\
    "D-NAT RADIO PTP SISI MJLGRA TO GN MENYAN" dst-address=192.169.0.10 \
    dst-port=443 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2755 \
    protocol=tcp to-addresses=192.169.0.10 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT RADIO PTP MJLGRA TO SUKADANA" \
    dst-address=192.169.0.18 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2730 \
    protocol=tcp to-addresses=192.169.0.18 to-ports=80
add action=src-nat chain=srcnat comment="D-NAT RADIO PTP MJLGRA TO SUKADANA" \
    dst-address=192.169.0.19 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2731 \
    protocol=tcp to-addresses=192.169.0.19 to-ports=443
add action=src-nat chain=srcnat comment="PTP CANGKINGAN - JATIBARANG BARU" \
    dst-address=192.169.0.90 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2734 \
    protocol=tcp to-addresses=192.169.0.90 to-ports=443
add action=src-nat chain=srcnat comment=\
    "D-NAT PTP JATIBARANG BARU TO CANGKINGAN " dst-address=192.169.0.91 \
    dst-port=443 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2888 \
    protocol=tcp to-addresses=192.169.0.91 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT PTP JATIBARANG BARU" \
    dst-address=172.169.0.12 dst-port=8063 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2736 \
    protocol=tcp to-addresses=172.169.0.12 to-ports=8063
add action=src-nat chain=srcnat comment="D-NAT PTP PAGELARAN TO KARANGHARJA" \
    dst-address=192.169.0.170 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2735 \
    protocol=tcp to-addresses=192.169.0.170 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT PTP KARANGHARJA TO PAGELARAN" \
    dst-address=192.169.0.171 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2736 \
    protocol=tcp to-addresses=192.169.0.171 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT PTP PAGELARAN TO CIKADU" \
    dst-address=192.169.0.178 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2738 \
    protocol=tcp to-addresses=192.169.0.178 to-ports=443
add action=src-nat chain=srcnat comment="D-NAT PTP CIKADU TO PAGELARAN" \
    dst-address=192.169.0.179 dst-port=443 protocol=tcp to-addresses=\
    172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2739 \
    protocol=tcp to-addresses=192.169.0.179 to-ports=443
add action=src-nat chain=srcnat comment="PTP GIRIJAYA CIKADU" dst-address=\
    172.169.0.16 dst-port=100 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2741 \
    protocol=tcp to-addresses=172.169.0.16 to-ports=100
add action=src-nat chain=srcnat dst-address=172.169.0.16 dst-port=200 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2742 \
    protocol=tcp to-addresses=172.169.0.16 to-ports=200
add action=src-nat chain=srcnat dst-address=172.169.0.16 dst-port=300 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2743 \
    protocol=tcp to-addresses=172.169.0.16 to-ports=300
add action=src-nat chain=srcnat dst-address=172.169.0.16 dst-port=400 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2744 \
    protocol=tcp to-addresses=172.169.0.16 to-ports=400
add action=src-nat chain=srcnat dst-address=172.169.0.16 dst-port=500 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=2745 \
    protocol=tcp to-addresses=172.169.0.16 to-ports=500
add action=src-nat chain=srcnat comment=\
    "D-NAT MIKROTIK GIRIJAYA (CIKADU REPEATER)" dst-address=192.169.0.180 \
    dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2740 \
    protocol=tcp to-addresses=192.169.0.180 to-ports=8291
add action=dst-nat chain=dstnat comment="PTMP KWS TRIJAYA UNGGUL" \
    dst-address=123.231.237.116 dst-port=92 protocol=tcp to-addresses=\
    172.169.0.2 to-ports=110
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=93 \
    protocol=tcp to-addresses=172.169.0.2 to-ports=120
add action=masquerade chain=srcnat out-interface=".:LINK TO WAN INTERNET:." \
    src-address=1.1.1.0/30
add action=dst-nat chain=dstnat comment="AP Gelaranyar" disabled=yes \
    dst-address=123.231.237.114 dst-port=9113 protocol=tcp to-addresses=\
    172.169.0.14 to-ports=103
add action=dst-nat chain=dstnat comment="STA Gelaranyar" disabled=yes \
    dst-address=123.231.237.114 dst-port=9114 protocol=tcp to-addresses=\
    172.169.0.14 to-ports=104
add action=dst-nat chain=dstnat comment="Pagelaran#Cianjur 1" disabled=yes \
    dst-address=123.231.237.114 dst-port=9115 protocol=tcp to-addresses=\
    172.169.0.14 to-ports=105
add action=dst-nat chain=dstnat comment="PTP Trijaya Unggul" dst-address=\
    123.231.237.114 dst-port=2021 protocol=tcp to-addresses=172.169.0.2 \
    to-ports=201
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2022 \
    protocol=tcp to-addresses=172.169.0.2 to-ports=202
add action=dst-nat chain=dstnat comment="PTMP Trijaya Unggul" dst-address=\
    123.231.237.114 dst-port=2025 protocol=tcp to-addresses=172.169.0.2 \
    to-ports=110
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2026 \
    protocol=tcp to-addresses=172.169.0.2 to-ports=120
add action=dst-nat chain=dstnat comment="PTP Sari Mekar" dst-address=\
    123.231.237.114 dst-port=2023 protocol=tcp to-addresses=172.169.0.2 \
    to-ports=203
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=2024 \
    protocol=tcp to-addresses=172.169.0.2 to-ports=204
add action=dst-nat chain=dstnat comment="2022307068 KWS INDRAMAYU 3" \
    dst-address=123.231.237.114 dst-port=190 protocol=tcp to-addresses=\
    10.200.202.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=10.200.202.2 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=191 \
    protocol=tcp to-addresses=192.169.1.34 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.34 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=192 \
    protocol=tcp to-addresses=192.169.1.35 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.35 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=193 \
    protocol=tcp to-addresses=192.169.101.34 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.34 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022307070 KWS INDRAMAYU 1" \
    dst-address=123.231.237.114 dst-port=290 protocol=tcp to-addresses=\
    10.200.202.6 to-ports=8291
add action=src-nat chain=srcnat dst-address=10.200.202.6 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=291 \
    protocol=tcp to-addresses=192.169.1.42 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.42 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=292 \
    protocol=tcp to-addresses=192.169.1.43 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.43 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=293 \
    protocol=tcp to-addresses=192.169.101.42 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.42 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=294 \
    protocol=tcp to-addresses=192.169.201.42 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.42 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022312982 KWS SUBANG 1" \
    dst-address=123.231.237.116 dst-port=390 protocol=tcp to-addresses=\
    10.200.202.10 to-ports=8291
add action=src-nat chain=srcnat dst-address=10.200.202.10 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=391 \
    protocol=tcp to-addresses=192.169.1.50 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.50 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=392 \
    protocol=tcp to-addresses=192.169.1.51 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.51 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=393 \
    protocol=tcp to-addresses=192.169.201.50 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.50 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="WIFI PUBLIC CIPALI" dst-address=\
    123.231.237.114 dst-port=1111 protocol=tcp to-addresses=192.169.10.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.10.2 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1112 \
    protocol=tcp to-addresses=192.169.10.3 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.10.3 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1110 \
    protocol=tcp to-addresses=192.169.10.4 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.10.4 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1113 \
    protocol=tcp to-addresses=192.169.10.10 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.10.10 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1115 \
    protocol=tcp to-addresses=192.169.10.11 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.10.11 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1116 \
    protocol=tcp to-addresses=192.169.10.13 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.10.13 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1117 \
    protocol=tcp to-addresses=192.169.10.12 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.10.12 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1118 \
    protocol=tcp to-addresses=192.169.10.14 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.10.14 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022307081 KWS SUBANG 2" \
    dst-address=123.231.237.114 dst-port=490 protocol=tcp to-addresses=\
    192.169.1.60 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.1.60 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=491 \
    protocol=tcp to-addresses=192.169.1.58 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.58 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=492 \
    protocol=tcp to-addresses=192.169.1.59 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.59 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=493 \
    protocol=tcp to-addresses=192.169.201.58 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.58 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=494 \
    protocol=tcp to-addresses=192.169.201.59 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.59 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=495 \
    protocol=tcp to-addresses=192.169.101.186 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.186 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022307078 KWS GARUT 1" dst-address=\
    123.231.237.115 dst-port=590 protocol=tcp to-addresses=192.169.1.164 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.1.164 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=591 \
    protocol=tcp to-addresses=192.169.1.162 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.162 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=592 \
    protocol=tcp to-addresses=192.169.1.163 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.163 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022307089 KWS CISOLOK NAN ELOK" \
    dst-address=123.231.237.114 dst-port=790 protocol=tcp to-addresses=\
    172.169.0.35 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.35 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=793 \
    protocol=tcp to-addresses=192.169.202.18 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.202.18 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="2022307088 KWS CILETUH MANDIRI" \
    dst-address=123.231.237.114 dst-port=890 protocol=tcp to-addresses=\
    172.169.0.29 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.29 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=893 \
    protocol=tcp to-addresses=192.169.102.10 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.102.10 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=894 \
    protocol=tcp to-addresses=192.169.202.10 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.202.10 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="KWS KBB 5" dst-address=\
    123.231.237.116 dst-port=970 protocol=tcp to-addresses=172.169.0.21 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.21 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="KWS KBB 6" dst-address=\
    123.231.237.116 dst-port=990 protocol=tcp to-addresses=172.169.0.22 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.22 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=991 \
    protocol=tcp to-addresses=192.169.101.210 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.210 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=992 \
    protocol=tcp to-addresses=192.169.101.211 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.211 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat dst-address=192.169.101.73 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=993 \
    protocol=tcp to-addresses=192.169.201.210 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.210 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=995 \
    protocol=tcp to-addresses=192.169.101.212 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.101.212 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="KWS MITRA RAHARJA" dst-address=\
    123.231.237.114 dst-port=1100 protocol=tcp to-addresses=172.169.0.18 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.18 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=1103 \
    protocol=tcp to-addresses=192.169.101.106 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.106 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1104 \
    protocol=tcp to-addresses=192.169.201.106 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.106 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1201 \
    protocol=tcp to-addresses=192.169.1.106 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.106 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1202 \
    protocol=tcp to-addresses=192.169.1.107 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.107 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.116 dst-port=1200 \
    protocol=tcp to-addresses=192.169.1.108 to-ports=8291
add action=src-nat chain=srcnat dst-address=192.169.1.108 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1203 \
    protocol=tcp to-addresses=192.169.101.114 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.101.114 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1204 \
    protocol=tcp to-addresses=192.169.201.114 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.201.114 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SLBN 1 KARAWANG BARAT" dst-address=\
    123.231.237.115 dst-port=8144 protocol=tcp to-addresses=172.169.0.66 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.66 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="KWS BEKASI 1" dst-address=\
    123.231.237.115 dst-port=8143 protocol=tcp to-addresses=172.169.0.43 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.43 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=1568 \
    protocol=tcp to-addresses=172.169.0.43 to-ports=8291
add action=dst-nat chain=dstnat comment="MKT KARANGMULYA" dst-address=\
    123.231.237.115 dst-port=8230 protocol=tcp to-addresses=172.169.0.92 \
    to-ports=8240
add action=src-nat chain=srcnat dst-address=172.169.0.92 dst-port=8240 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat comment="KWS BEKASI 2" dst-address=\
    172.169.0.44 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DNAT MIKROTIK BKS2" dst-address=\
    123.231.237.114 dst-port=998 protocol=tcp to-addresses=172.169.0.44 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=123.231.237.115 dst-port=999 \
    protocol=tcp to-addresses=192.169.1.82 to-ports=443
add action=src-nat chain=srcnat dst-address=192.169.1.82 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat dst-address=192.169.1.84 dst-port=443 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=1301 \
    protocol=tcp to-addresses=192.169.1.84 to-ports=443
add action=dst-nat chain=dstnat comment="CSR SMAN4 SUBANG" dst-address=\
    123.231.237.114 dst-port=8088 protocol=tcp to-addresses=172.169.0.57 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.57 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="CSR SMAN BINONG" dst-address=\
    123.231.237.114 dst-port=8101 protocol=tcp to-addresses=172.169.0.58 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.58 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="CSR SMKS JABABEKA" dst-address=\
    123.231.237.114 dst-port=8102 protocol=tcp to-addresses=172.169.0.46 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.46 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="CSR IBNU SINA" dst-address=\
    123.231.237.114 dst-port=8103 protocol=tcp to-addresses=172.169.0.53 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.53 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="CSR SMKN 1 PELABUHAN RATU" \
    dst-address=123.231.237.114 dst-port=8104 protocol=tcp to-addresses=\
    172.169.0.61 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.61 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="CSR PESANTREN ARQOM" dst-address=\
    123.231.237.114 dst-port=8105 protocol=tcp to-addresses=172.169.0.67 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.67 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="GUNUNG GEULIS" dst-address=\
    123.231.237.114 dst-port=8106 protocol=tcp to-addresses=172.169.0.63 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.63 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SMAN 2 PAGADEN" dst-address=\
    123.231.237.114 dst-port=8107 protocol=tcp to-addresses=172.169.0.56 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.56 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SLBN PURWAKARTA" dst-address=\
    123.231.237.114 dst-port=8108 protocol=tcp to-addresses=172.169.0.55 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.55 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SMA NUR SAFIIL PWK" dst-address=\
    123.231.237.114 dst-port=8109 protocol=tcp to-addresses=172.169.0.54 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.54 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SLBN ANANDA BEKASI" dst-address=\
    123.231.237.114 dst-port=8202 protocol=tcp to-addresses=172.169.0.48 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.48 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="STAIMA CIREBON" dst-address=\
    123.231.237.114 dst-port=8203 protocol=tcp to-addresses=172.169.0.69 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.69 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SMAN 1 KALAPANUNGGAL" dst-address=\
    123.231.237.114 dst-port=8204 protocol=tcp to-addresses=172.169.0.60 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.60 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DESA BOJONGSALAM" dst-address=\
    123.231.237.114 dst-port=8205 protocol=tcp to-addresses=172.169.0.70 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.70 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=src-nat chain=srcnat comment="DESA CIBITUNG" dst-address=\
    172.169.0.72 dst-port=8291 protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8206 \
    protocol=tcp to-addresses=172.169.0.72 to-ports=8291
add action=dst-nat chain=dstnat dst-address=123.231.237.114 dst-port=8207 \
    protocol=tcp to-addresses=172.169.0.72 to-ports=100
add action=src-nat chain=srcnat dst-address=172.169.0.72 dst-port=100 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="SMAN 1 MAJALAYA KAB KARAWANG" \
    dst-address=123.231.237.114 dst-port=8209 protocol=tcp to-addresses=\
    172.169.0.92 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.71 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DESA CIRAWAMEKAR" dst-address=\
    123.231.237.114 dst-port=8208 protocol=tcp to-addresses=172.169.0.71 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.92 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DESA MEKARWANGI" dst-address=\
    123.231.237.114 dst-port=8210 protocol=tcp to-addresses=172.169.0.74 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.74 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DESA SUKAWANGI SUKATENANG" \
    dst-address=123.231.237.114 dst-port=8211 protocol=tcp to-addresses=\
    172.169.0.76 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.76 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
add action=dst-nat chain=dstnat comment="DESA KEDUNGWARINGIN MEKARJAYA" \
    dst-address=123.231.237.114 dst-port=8212 protocol=tcp to-addresses=\
    172.169.0.31 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.169.0.31 dst-port=8291 \
    protocol=tcp to-addresses=172.169.0.1
/ip route
add distance=1 gateway=123.231.237.113
add comment="IP MKT KWS GN MENYAN MAJALENGKA" distance=1 dst-address=\
    10.200.200.0/30 gateway=172.169.0.3
add comment="IP MKT KWS SUKADANA MAJALENGKA" distance=1 dst-address=\
    10.200.200.4/30 gateway=172.169.0.3
add comment="IP MKT KWS KERTANEGARA SUBANG" distance=1 dst-address=\
    10.200.200.12/30 gateway=172.169.0.31
add comment="IP PTMP KERTANEGARA" distance=1 dst-address=10.200.200.14/32 \
    gateway=172.169.0.31
add comment="IP MKT KWS ANJATAN BARU" distance=1 dst-address=10.200.200.16/30 \
    gateway=172.169.0.31
add comment="IP MKT TANJUNG SURIAN" distance=1 dst-address=10.200.200.22/32 \
    gateway=172.169.0.33
add comment="IP MKT KWS JATIBARANG BARU" distance=1 dst-address=\
    10.200.200.32/30 gateway=172.169.0.7
add comment="IP MKT KWS GINANJAR SUKABUMI" distance=1 dst-address=\
    10.200.200.40/30 gateway=172.169.0.2
add comment="IP MKT KWS TAMANSARI SUKABUMI" distance=1 dst-address=\
    10.200.200.44/30 gateway=172.169.0.2
add comment="IP MKT R. AWILEGA" distance=1 dst-address=10.200.200.58/32 \
    gateway=172.169.0.33
add comment="IP MKT 2022307068 KWS INDRAMAYU 3" distance=1 dst-address=\
    10.200.202.0/30 gateway=172.169.0.7
add comment="IP MKT 2022307070 KWS INDRAMAYU 1" distance=1 dst-address=\
    10.200.202.4/30 gateway=172.169.0.7
add comment="IP MKT KWS SUBANG 1" distance=1 dst-address=10.200.202.8/30 \
    gateway=172.169.0.33
add comment="IP MKT 2022307081 KWS SUBANG 2" distance=1 dst-address=\
    10.200.202.12/30 gateway=172.169.0.33
add distance=1 dst-address=172.10.10.0/29 gateway=172.169.0.9
add distance=1 dst-address=192.168.66.0/24 gateway=172.169.0.9
add comment="RADIO MJLGRA ARAH GN MENYAN" distance=1 dst-address=\
    192.169.0.10/32 gateway=172.169.0.3
add comment="RADIO GN MENYAN MAJALENGKA" distance=1 dst-address=\
    192.169.0.11/32 gateway=172.169.0.3
add comment="RADIO PTP SISI MJLGRA TO SUKADANA" distance=1 dst-address=\
    192.169.0.18/32 gateway=172.169.0.3
add comment="RADIO PTP SISI MJLGRA TO SUKADANA" distance=1 dst-address=\
    192.169.0.19/32 gateway=172.169.0.3
add comment="RADIO PTP CT SUBANG - KWS KERTANEGARA" distance=1 dst-address=\
    192.169.0.48/29 gateway=172.169.0.31
add comment="RADIO PTP KWS KERTANEGARA - KWS ANJATAN BARU" distance=1 \
    dst-address=192.169.0.56/29 gateway=172.169.0.31
add comment="IP PTP TANJUNG SURIAN" distance=1 dst-address=192.169.0.66/32 \
    gateway=172.169.0.33
add comment="IP PTP CANGKINGAN" distance=1 dst-address=192.169.0.88/29 \
    gateway=172.169.0.7
add comment="RADIO PTP CANGKINGAN TO JATIBARANG BARU" distance=1 dst-address=\
    192.169.0.90/32 gateway=172.169.0.12
add distance=1 dst-address=192.169.0.136/29 gateway=172.169.0.2
add comment="IP PTP JATIBARANG BARU" distance=1 dst-address=192.169.0.140/32 \
    gateway=172.169.0.2
add comment="MIKROTIK KARANGHARJA" distance=1 dst-address=192.169.0.168/29 \
    gateway=172.169.0.13
add comment="RADIO PTP CT PAGELARAN-KWS KARANGHARJA" distance=1 dst-address=\
    192.169.0.170/32 gateway=172.169.0.13
add comment="RADIO PTP KWS KARANGHARJA-CT PAGELARAN" distance=1 dst-address=\
    192.169.0.171/32 gateway=172.169.0.13
add comment="RADIO PTP CT PAGELARAN-KWS CIKADU" distance=1 dst-address=\
    192.169.0.178/32 gateway=172.169.0.13
add comment="RADIO PTP KWS CIKADU-CT PAGELARAN" distance=1 dst-address=\
    192.169.0.179/32 gateway=172.169.0.13
add comment="MIKROTIK CIKADU" distance=1 dst-address=192.169.0.180/32 \
    gateway=172.169.0.13
add comment="RADIO PTP CT SUBANG - KWS DAWUAN" distance=1 dst-address=\
    192.169.1.0/29 gateway=172.169.0.33
add distance=1 dst-address=192.169.1.16/29 gateway=172.169.0.33
add comment="IP PTP 2022307068 KWS INDRAMAYU 3" distance=1 dst-address=\
    192.169.1.32/29 gateway=172.169.0.7
add comment="IP PTP 2022307070 KWS INDRAMAYU 1" distance=1 dst-address=\
    192.169.1.40/29 gateway=172.169.0.7
add comment="IP PTP KWS SUBANG 1" distance=1 dst-address=192.169.1.48/29 \
    gateway=172.169.0.33
add comment="IP PTP 2022307081 KWS SUBANG 2" distance=1 dst-address=\
    192.169.1.56/29 gateway=172.169.0.33
add comment="MITRA RAHARJA" distance=1 dst-address=192.169.1.104/29 gateway=\
    172.169.0.18
add comment="2022307078 KWS GARUT 1" distance=1 dst-address=192.169.1.160/29 \
    gateway=172.169.0.34
add comment="IP PTMP 2022307081 KWS SUBANG 2" distance=1 dst-address=\
    192.169.1.160/29 gateway=172.169.0.32
add comment="IP PTP 2022307087 CIANJUR 11" distance=1 dst-address=\
    192.169.1.248/29 gateway=172.169.0.27
add comment="IP PTP WIFI CIPALI" distance=1 dst-address=192.169.10.0/29 \
    gateway=172.169.0.33
add comment="IP PTP WIFI CIPALI" distance=1 dst-address=192.169.10.8/29 \
    gateway=172.169.0.33
add comment="IP NMS RADIO PTMP SUKAMAJU" distance=1 dst-address=\
    192.169.100.40/29 gateway=172.169.0.8
add comment="IP PTMP CANGKINGAN" distance=1 dst-address=192.169.100.80/29 \
    gateway=172.169.0.7
add distance=1 dst-address=192.169.100.146/32 gateway=172.169.0.2
add distance=1 dst-address=192.169.101.18/32 gateway=172.169.0.2
add comment="IP PTMP 2022307068 KWS INDRAMAYU 3" distance=1 dst-address=\
    192.169.101.32/29 gateway=172.169.0.7
add comment="IP PTMP 2022307070 KWS INDRAMAYU 1" distance=1 dst-address=\
    192.169.101.40/29 gateway=172.169.0.7
add comment="MITRA RAHARJA" distance=1 dst-address=192.169.101.104/29 \
    gateway=172.169.0.18
add comment="MITRA RAHARJA" distance=1 dst-address=192.169.101.112/29 \
    gateway=172.169.0.18
add comment="IP PTMP 2022307081 KWS SUBANG 2" distance=1 dst-address=\
    192.169.101.184/29 gateway=172.169.0.33
add comment="KWS KBB 6" distance=1 dst-address=192.169.101.208/29 gateway=\
    172.169.0.22
add comment="IP PTMP 2022307087 CIANJUR 11" distance=1 dst-address=\
    192.169.101.248/29 gateway=172.169.0.27
add comment="RADIO PTP CT SUBANG - KWS DAWUAN" distance=1 dst-address=\
    192.169.102.8/29 gateway=172.169.0.29
add comment="IP PTP KERTANEGARA" distance=1 dst-address=192.169.200.48/29 \
    gateway=172.169.0.31
add comment="IP PTP CANGKINGAN" distance=1 dst-address=192.169.200.80/29 \
    gateway=172.169.0.7
add comment="IP PTP JATIBARANG BARU" distance=1 dst-address=192.169.200.90/32 \
    gateway=172.169.0.12
add comment="IP PTMP 2 2022307070 KWS INDRAMAYU 1" distance=1 dst-address=\
    192.169.201.40/29 gateway=172.169.0.7
add comment="IP PTMP KWS SUBANG 1" distance=1 dst-address=192.169.201.48/29 \
    gateway=172.169.0.33
add comment="IP PTMP 2022307081 KWS SUBANG 2" distance=1 dst-address=\
    192.169.201.56/29 gateway=172.169.0.33
add comment="MITRA RAHARJA" distance=1 dst-address=192.169.201.104/29 \
    gateway=172.169.0.18
add comment="MITRA RAHARJA" distance=1 dst-address=192.169.201.112/29 \
    gateway=172.169.0.18
add comment="IP PTMP KWS KBB 6" distance=1 dst-address=192.169.201.208/29 \
    gateway=172.169.0.22
add comment="IP PTMP 2022307087 CIANJUR 11" distance=1 dst-address=\
    192.169.201.248/29 gateway=172.169.0.27
add comment="RADIO PTP CT SUBANG - KWS DAWUAN" distance=1 dst-address=\
    192.169.202.8/29 gateway=172.169.0.29
add comment="IP PTMP CISOLOK NAN ELOK" distance=1 dst-address=\
    192.169.202.16/29 gateway=172.169.0.35
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www address=202.152.1.147/32
set ssh port=8222
set www-ssl disabled=no
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add local-address=1.1.1.1 name=la password=la remote-address=1.1.1.2
add disabled=yes local-address=33.33.33.1 name=prtg-padabeunghar password=\
    nasional remote-address=33.33.33.2
add disabled=yes local-address=172.169.0.1 name=nmsradio password=nmsradio \
    remote-address=172.169.0.200
add disabled=yes local-address=172.170.0.3 name=TEST password=123 profile=\
    default-encryption remote-address=172.170.0.4
add disabled=yes local-address=172.170.0.1 name=TEST2 password=123 profile=\
    default-encryption remote-address=172.170.0.2
add disabled=yes local-address=172.169.0.1 name=MEKARBAKTI password=\
    P4ssword2023 remote-address=172.169.0.19
add disabled=yes local-address=172.169.0.1 name=KERTAYASA password=\
    P4ssword2023 remote-address=172.169.0.26
add local-address=172.169.0.1 name=JAYALAKSANA password=P4ssword2023 \
    remote-address=172.169.0.28
add local-address=172.169.0.1 name=CIBARUSAH password=P4ssword2022 \
    remote-address=172.169.0.45
add local-address=172.169.0.1 name=CIKARANG password=P4ssword2022 \
    remote-address=172.169.0.46
add local-address=172.169.0.1 name=TAMBUN1 password=P4ssword2022 \
    remote-address=172.169.0.47
add local-address=172.169.0.1 name=TAMBUN2 password=P4ssword2022 \
    remote-address=172.169.0.48
add local-address=172.169.0.1 name=PURWASARI password=P4ssword2022 \
    remote-address=172.169.0.50
add local-address=172.169.0.1 name=PURWAKARTA1 password=P4ssword2022 \
    remote-address=172.169.0.53
add local-address=172.169.0.1 name=PURWAKARTA2 password=P4ssword2022 \
    remote-address=172.169.0.54
add local-address=172.169.0.1 name=PAGADEN password=P4ssword2022 \
    remote-address=172.169.0.56
add local-address=172.169.0.1 name=SUBANG password=P4ssword2022 \
    remote-address=172.169.0.57
add local-address=172.169.0.1 name=BINONG password=P4ssword2022 \
    remote-address=172.169.0.58
add local-address=172.169.0.1 name=KALAPANUNGGAL password=P4ssword2022 \
    remote-address=172.169.0.60
add local-address=172.169.0.1 name=PELABUHAN password=P4ssword2022 \
    remote-address=172.169.0.61
add local-address=172.169.0.1 name=GUNUNGGEULIS password=P4ssword2022 \
    remote-address=172.169.0.63
add local-address=172.169.0.1 name=SUKAMAJU password=P4ssword2022 \
    remote-address=172.169.0.64
add local-address=172.169.0.1 name=CIKEASUDIK password=P4ssword2022 \
    remote-address=172.169.0.65
add local-address=172.169.0.1 name=PURWAKARTA3 password=P4ssword2029 \
    remote-address=172.169.0.55
add local-address=172.169.0.1 name=BUNGKO password=P4ssword2042 \
    remote-address=172.169.0.68
add local-address=172.169.0.1 name=STAIMA password=P4ssword2043 \
    remote-address=172.169.0.69
add local-address=172.169.0.1 name=ARQAM password=P4ssword2041 \
    remote-address=172.169.0.67
add local-address=172.169.0.1 name=bojongsalam password=P4ssword \
    remote-address=172.169.0.70
add disabled=yes local-address=172.169.0.1 name=NAJATEN password=P4ssword2023 \
    remote-address=172.169.0.62
add disabled=yes local-address=172.169.0.1 name=CIGADOG password=P4ssword2023 \
    remote-address=172.169.0.59
add disabled=yes local-address=172.169.0.1 name=TANJUNGANOM password=\
    P4ssword2023 remote-address=172.169.0.52
add disabled=yes local-address=172.169.0.1 name=LEBAKAGUNG password=\
    P4ssword2023 remote-address=172.169.0.49
add disabled=yes local-address=172.169.0.1 name=CINTA password=P4ssword2023 \
    remote-address=172.169.0.44
add disabled=yes local-address=172.169.0.1 name=KARYAMUKTI password=\
    P4ssword2023 remote-address=172.169.0.43
add disabled=yes local-address=172.169.0.1 name=CIMAREMEGRT password=\
    P4ssword2023 remote-address=172.169.0.41
add local-address=172.169.0.1 name=KARANGTENGAH password=P4ssword2023 \
    profile=default-encryption remote-address=172.169.0.39
add disabled=yes local-address=172.169.0.1 name=KARANGSARI password=\
    P4ssword2023 remote-address=172.169.0.40
add disabled=yes local-address=172.169.0.1 name=SINGABANGSA password=\
    P4ssword2023 remote-address=172.169.0.38
add disabled=yes local-address=172.169.0.1 name=BOJONGINDAH password=\
    P4ssword2023 remote-address=172.169.0.37
add disabled=yes local-address=172.169.0.1 name=CIKUTAMAHI password=\
    P4ssword2023 remote-address=172.169.0.36
add disabled=yes local-address=172.169.0.1 name=PANCAWATI password=\
    P4ssword2023 remote-address=172.169.0.35
add disabled=yes local-address=172.169.0.1 name=SUKAMEKAR password=\
    P4ssword2023 remote-address=172.169.0.34
add disabled=yes local-address=172.169.0.1 name=SUKAKERTA password=\
    P4ssword2023 remote-address=172.169.0.33
add disabled=yes local-address=172.169.0.1 name=BANJARSARI password=\
    P4ssword2023 remote-address=172.169.0.32
add local-address=172.169.0.1 name=MEKARJAYA password=P4ssword2023 \
    remote-address=172.169.0.31
add disabled=yes local-address=172.169.0.1 name=KARANGBAHAGIA password=\
    P4ssword2023 remote-address=172.169.0.30
add local-address=172.169.0.1 name=LENGGAHSARI password=P4ssword2023 \
    remote-address=172.169.0.29
add local-address=172.169.0.1 name=NAGARAJATI password=P4ssword2023 \
    remote-address=172.169.0.27
add disabled=yes local-address=172.169.0.1 name=PASANGGRAHAN password=\
    P4ssword2023 remote-address=172.169.0.25
add disabled=yes local-address=172.169.0.1 name=TALAGAWANGI password=\
    P4ssword2023 remote-address=172.169.0.24
add disabled=yes local-address=172.169.0.1 name=TAMBAKSARI password=\
    P4ssword2023 remote-address=172.169.0.23
add disabled=yes local-address=172.169.0.1 name=KARANGANYAR password=\
    P4ssword2023 remote-address=172.169.0.22
add disabled=yes local-address=172.169.0.1 name=CINTAMANIK password=\
    P4ssword2023 remote-address=172.169.0.21
add disabled=yes local-address=172.169.0.1 name=SINDANGGALIH password=\
    P4ssword2023 remote-address=172.169.0.20
add disabled=yes local-address=172.169.0.1 name=PASANGGARAHANCLW password=\
    P4ssword2023 remote-address=172.169.0.18
add disabled=yes local-address=172.169.0.1 name=KERESEK password=P4ssword2023 \
    remote-address=172.169.0.17
add disabled=yes local-address=172.169.0.1 name=GALIHPAKUWON password=\
    P4ssword2023 remote-address=172.169.0.16
add disabled=yes local-address=172.169.0.1 name=SUKAMUKTI password=\
    P4ssword2023 remote-address=172.169.0.15
add disabled=yes local-address=172.169.0.1 name=SUKALAKSANA password=\
    P4ssword2023 remote-address=172.169.0.14
add disabled=yes local-address=172.169.0.1 name=JUNGJANGWETAN password=\
    P4ssword2023 remote-address=172.169.0.13
add local-address=172.169.0.1 name=SAGANTEN password=P4ssword2023 \
    remote-address=172.169.0.12
add disabled=yes local-address=172.169.0.1 name=KUBANG password=P4ssword2023 \
    remote-address=172.169.0.11
add local-address=172.169.0.1 name=CIBODAS password=P4ssword2023 \
    remote-address=172.169.0.10
add disabled=yes local-address=172.169.0.1 name=GUNUNGMULYA password=\
    P4ssword2023 remote-address=172.169.0.9
add disabled=yes local-address=172.169.0.1 name=TANJUNGSARI password=\
    P4ssword2023 remote-address=172.169.0.8
add disabled=yes local-address=172.169.0.1 name=WARGAJAYA password=\
    P4ssword2023 remote-address=172.169.0.7
add disabled=yes local-address=172.169.0.1 name=KIARASARI password=\
    P4ssword2023 remote-address=172.169.0.6
add disabled=yes local-address=172.169.0.1 name=CIDOKOM password=P4ssword2023 \
    remote-address=172.169.0.5
add disabled=yes local-address=172.169.0.1 name=PABANGBON password=\
    P4ssword2023 remote-address=172.169.0.4
add local-address=172.169.0.1 name=CIOMAS password=P4ssword2023 \
    remote-address=172.169.0.3
add local-address=172.169.0.1 name=WARGAJAYABGR password=P4ssword2023 \
    remote-address=172.169.0.2
add local-address=172.169.0.1 name=CIBITUNG password=P4ssword2023 \
    remote-address=172.169.0.72
add local-address=172.169.0.1 name=SAGULING password=P4ssword2023 profile=\
    default-encryption remote-address=172.169.0.73
add local-address=172.169.0.1 name=MEKARWANGI password=P4ssword2023 profile=\
    default-encryption remote-address=172.169.0.74
add disabled=yes local-address=172.169.0.1 name=SUKARINGIN password=\
    P4ssword2023 remote-address=172.169.0.75
add disabled=yes local-address=172.169.0.1 name=SUKAWANGI password=\
    P4ssword2023 remote-address=172.169.0.77
add disabled=yes local-address=172.169.0.1 name=LEUWIKOLOT password=\
    P4ssword2023 remote-address=172.169.0.77
add disabled=yes local-address=172.169.0.1 name=CINTAMANIKBGR password=\
    P4ssword2023 remote-address=172.169.0.79
add disabled=yes local-address=172.169.0.1 name=KARYAJAYA password=\
    P4ssword2023 remote-address=172.169.0.80
add disabled=yes local-address=172.169.0.1 name=TANJUNGJAYA password=\
    P4ssword2023 remote-address=172.169.0.81
add disabled=yes local-address=172.169.0.1 name=BANYURESMI password=\
    P4ssword2023 remote-address=172.169.0.82
add disabled=yes local-address=172.169.0.1 name=SIMPANG password=P4ssword2023 \
    remote-address=172.169.0.83
add local-address=172.169.0.1 name=SUKAPURA password=P4ssword2023 \
    remote-address=172.169.0.84
add local-address=172.169.0.1 name=SELAGEDANG password=P4ssword2023 \
    remote-address=172.169.0.85
add disabled=yes local-address=172.169.0.1 name=KARYAMUKTICJR password=\
    P4ssword2023 remote-address=172.169.0.86
add disabled=yes local-address=172.169.0.1 name=GIRIMULYA password=\
    P4ssword2023 remote-address=172.169.0.87
add local-address=172.169.0.1 name=NAGREGKENDAN password=P4ssword2023 \
    profile=default-encryption remote-address=172.169.0.88
add local-address=172.169.0.1 name=PANYADAP password=P4ssword2023 \
    remote-address=172.169.0.89
add local-address=172.169.0.1 name=BOJONGKONENG password=P4ssword2023 \
    profile=default-encryption remote-address=172.169.0.90
add local-address=172.169.0.1 name=SUMURBANDUNG password=P4ssword2023 \
    remote-address=172.169.0.91
add local-address=172.169.0.1 name=CIRAWAMEKAR password=P4ssword2023 profile=\
    default-encryption remote-address=172.169.0.92
add local-address=172.169.0.1 name=JATI password=P4ssword2023 profile=\
    default-encryption remote-address=172.169.0.93
add disabled=yes local-address=172.169.0.1 name=RAWAGATEL password=\
    P4ssword2023 remote-address=172.169.0.94
add disabled=yes local-address=172.169.0.1 name=TEGALGUBUGLOR password=\
    P4ssword2023 remote-address=172.169.0.95
add disabled=yes local-address=172.169.0.1 name=DOMPYONGKULON password=\
    P4ssword2023 remote-address=172.169.0.96
add disabled=yes local-address=172.169.0.1 name=KENDUNGDALEM password=\
    P4ssword2023 remote-address=172.169.0.97
add disabled=yes local-address=172.169.0.1 name=BUNGKOCRB password=\
    P4ssword2023 remote-address=172.169.0.98
add disabled=yes local-address=172.169.0.1 name=ASTANAMUKTI password=\
    P4ssword2023 remote-address=172.169.0.99
add disabled=yes local-address=172.169.0.1 name=CIKULAK password=P4ssword2023 \
    remote-address=172.169.0.100
add disabled=yes local-address=172.169.0.1 name=ARAHANKIDUL password=\
    P4ssword2023 remote-address=172.169.0.101
add disabled=yes local-address=172.169.0.1 name=SUKAREJA password=\
    P4ssword2023 remote-address=172.169.0.102
add disabled=yes local-address=172.169.0.1 name=JAMBAK password=P4ssword2023 \
    remote-address=172.169.0.103
add disabled=yes local-address=172.169.0.1 name=CIPANCUH password=\
    P4ssword2023 remote-address=172.169.0.104
add disabled=yes local-address=172.169.0.1 name=LOHBENER password=\
    P4ssword2023 remote-address=172.169.0.105
add disabled=yes local-address=172.169.0.1 name=PAMIJAHAN password=\
    P4ssword2023 remote-address=172.169.0.106
add disabled=yes local-address=172.169.0.1 name=RANDUSARI password=\
    P4ssword2023 remote-address=172.169.0.107
add disabled=yes local-address=172.169.0.1 name=DATAR password=P4ssword2023 \
    remote-address=172.169.0.108
add disabled=yes local-address=172.169.0.1 name=PUNCAK password=P4ssword2023 \
    remote-address=172.169.0.109
add disabled=yes local-address=172.169.0.1 name=KAWAHMANUK password=\
    P4ssword2023 remote-address=172.169.0.110
add local-address=172.169.0.1 name=PARUNG password=P4ssword2023 profile=\
    default-encryption remote-address=172.169.0.111
add disabled=yes local-address=172.169.0.1 name=PARTAWANGUNAN password=\
    P4ssword2023 remote-address=172.169.0.112
add local-address=172.169.0.1 name=BABAJURANG password=P4ssword2023 \
    remote-address=172.169.0.113
add local-address=172.169.0.1 name=LIGUNGLOR password=P4ssword2023 \
    remote-address=172.169.0.114
add local-address=172.169.0.1 name=MEKARMUKTI password=P4ssword2023 \
    remote-address=172.169.0.115
add local-address=172.169.0.1 name=CIBUNAR password=P4ssword2023 \
    remote-address=172.169.0.116
add local-address=172.169.0.1 name=CIHERANG password=P4ssword2023 \
    remote-address=172.169.0.117
add local-address=172.169.0.1 name=CISURAT password=P4ssword2023 \
    remote-address=172.169.0.118
add local-address=172.169.0.1 name=KARAWANGBARAT password=P4ssword2022 \
    remote-address=172.169.0.66
add local-address=172.169.0.1 name=MAJALAYA password=P4ssword2026 \
    remote-address=172.169.0.71
add local-address=172.169.0.1 name=CCTVALJABAR1 password=P4sswordcctv \
    remote-address=172.169.0.51
add local-address=172.169.0.1 name=PADAMUKTI password=P4ssword2023 \
    remote-address=172.169.0.119
add local-address=172.169.0.1 name=BABELAN password=P4ssword2023 \
    remote-address=172.169.0.120
add local-address=172.169.0.1 name=SUKATENANG password=P4ssword2023 \
    remote-address=172.169.0.76
/snmp
set enabled=yes trap-community=lapublic
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=2021257866-DISKOMINFO_JABAR
/tool bandwidth-server
set authenticate=no
