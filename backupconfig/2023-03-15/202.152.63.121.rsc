# mar/15/2023 05:00:03 by RouterOS 6.49.7
# software id = A5AF-06V1
#
# model = 1100AHx2
# serial number = 47B80470A471
/interface bridge
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] name=ether1-TO_METRO_JAH rx-flow-control=on \
    tx-flow-control=on
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] name=ether3-TO_METRO_JAH_BACKUP
set [ find default-name=ether4 ] name=ether4-TO_LAN speed=100Mbps
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full name=ether5-TO_CCTV \
    rx-flow-control=on speed=100Mbps tx-flow-control=on
/interface list
add exclude=dynamic name=discover
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=DAMKAR
/ip dhcp-server option
add code=121 name=ceres value="0x20'172.16.1.7''172.16.1.29'0x20'172.16.1.9''1\
    72.16.1.29'0x20'172.16.2.3''172.16.1.29'0x20'172.16.2.9''172.16.1.29'0x20'\
    172.16.2.11''172.16.1.29'0x20'172.16.2.12''172.16.1.29'"
/ip hotspot profile
add dns-name=dppkkotabandung.com hotspot-address=192.168.1.1 login-by=\
    http-pap name=hsprof1
/ip hotspot user profile
set [ find default=yes ] shared-users=3
add add-mac-cookie=no !mac-cookie-timeout name="Paket Karyawan" \
    open-status-page=http-login parent-queue=none rate-limit=500K \
    shared-users=20 transparent-proxy=yes
add add-mac-cookie=no !mac-cookie-timeout name="Paket Tengah" \
    open-status-page=http-login parent-queue=none rate-limit=350K \
    transparent-proxy=yes
add add-mac-cookie=no !mac-cookie-timeout name=Satpam parent-queue=none \
    shared-users=6 transparent-proxy=yes
add name=insfektur parent-queue=none shared-users=10 transparent-proxy=yes
add name=Satwankar rate-limit=200K shared-users=4 transparent-proxy=yes
add name=kantin rate-limit=600 shared-users=2 transparent-proxy=yes
add name=PHL rate-limit=900K shared-users=60 transparent-proxy=yes
add address-list="Video Streaming" name=Unblock_Youtube shared-users=100
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=3des
/ip pool
add name=dhcp_pool1 ranges="172.16.0.1-172.16.0.255,172.16.1.32-172.16.1.255,1\
    72.16.2.32-172.16.2.255,172.16.3.0-172.16.3.254"
add name=dhcp_pool2 ranges=172.30.0.1-172.30.1.253,172.30.1.255-172.30.3.254
/ip dhcp-server
add address-pool=dhcp_pool1 interface=ether4-TO_LAN lease-time=10h name=LAN
add address-pool=dhcp_pool2 interface=ether5-TO_CCTV lease-time=2h name=CCTV
/ip hotspot
add address-pool=dhcp_pool1 addresses-per-mac=1 disabled=no idle-timeout=1h \
    interface=loopback name=hotspot1 profile=hsprof1
/ppp profile
add change-tcp-mss=yes dns-server=202.138.224.22,202.138.224.24 \
    local-address=192.168.1.1 name=vpn remote-address=dhcp_pool1 \
    use-encryption=yes
/queue simple
add limit-at=50M/50M max-limit=50M/50M name=jah packet-marks=mark-jah target=\
    172.16.0.0/22,172.16.240.0/20
add disabled=yes limit-at=100M/100M max-limit=100M/100M name=internet \
    packet-marks=mark-internet target=\
    172.16.0.0/22,172.16.240.0/20,172.30.0.0/22
/ip hotspot user profile
add !keepalive-timeout name="Paket Boss" open-status-page=http-login \
    parent-queue=jah transparent-proxy=yes
add name=PC parent-queue=jah shared-users=2 transparent-proxy=yes
add add-mac-cookie=no !keepalive-timeout !mac-cookie-timeout name=tamu \
    open-status-page=http-login parent-queue=jah shared-users=20 \
    transparent-proxy=yes
add name=heuses parent-queue=jah shared-users=3 transparent-proxy=yes
add name=office parent-queue=jah shared-users=12 transparent-proxy=yes
add name=DCC parent-queue=jah rate-limit=300K transparent-proxy=yes
/routing bgp instance
set default as=64512 router-id=10.1.1.1
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0 name=lapublic
/system logging action
set 0 memory-lines=100
set 1 disk-file-count=10
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface list member
add interface=loopback list=discover
add interface=ether2 list=discover
add interface=ether3-TO_METRO_JAH_BACKUP list=discover
add interface=ether4-TO_LAN list=discover
add interface=ether5-TO_CCTV list=discover
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2 enabled=yes max-mru=1460 max-mtu=\
    1460
/ip address
add address=172.16.30.49/28 disabled=yes interface=ether2 network=\
    172.16.30.48
add address=172.30.1.254/22 disabled=yes interface=ether5-TO_CCTV network=\
    172.30.0.0
add address=172.16.1.29/22 interface=ether4-TO_LAN network=172.16.0.0
add address=10.1.1.1 interface=loopback network=10.1.1.1
add address=10.100.3.6/30 interface=ether3-TO_METRO_JAH_BACKUP network=\
    10.100.3.4
add address=182.23.28.241/29 comment="BCA H2H" interface=ether10 network=\
    182.23.28.240
add address=202.152.63.121/29 comment="Mail Intranet" interface=ether10 \
    network=202.152.63.120
add address=123.231.246.233/29 comment="Remote Sites (Firman VoIP & OpenVPN)" \
    interface=ether10 network=123.231.246.232
add address=202.152.36.169/29 comment="VC / VoIP" interface=ether10 network=\
    202.152.36.168
add address=202.152.61.49/29 comment="VC / VoIP" interface=ether10 network=\
    202.152.61.48
add address=10.100.2.6/30 interface=ether1-TO_METRO_JAH network=10.100.2.4
/ip cloud
set ddns-enabled=yes
/ip dhcp-server lease
add address=172.16.0.14 mac-address=B0:4E:26:EA:D8:89 server=LAN
add address=172.16.0.15 mac-address=50:D4:F7:48:B8:DB server=LAN
add address=172.16.0.16 mac-address=EC:B1:D7:02:15:80 server=LAN
add address=172.16.0.17 mac-address=C4:6E:1F:A7:51:37 server=LAN
add address=172.16.0.18 mac-address=00:31:92:17:84:89 server=LAN
add address=172.16.0.19 mac-address=6C:3B:6B:29:C4:FA server=LAN
add address=172.16.0.20 mac-address=A0:F3:C1:DF:AD:BF server=LAN
add address=172.16.0.21 mac-address=A0:F3:C1:DF:AD:B9 server=LAN
add address=172.16.0.22 mac-address=B0:95:75:7D:B8:20 server=LAN
add address=172.16.0.23 mac-address=D8:FE:E3:5C:9B:B3 server=LAN
add address=172.16.0.24 mac-address=18:66:DA:5F:9F:81 server=LAN
add address=172.16.0.25 mac-address=00:16:76:BF:FF:F8 server=LAN
add address=172.16.0.27 mac-address=B0:4E:26:EA:D9:1C server=LAN
add address=172.16.0.28 mac-address=B0:4E:26:EA:D8:8B server=LAN
add address=172.16.0.29 mac-address=B0:4E:26:EA:D9:16 server=LAN
add address=172.16.0.30 mac-address=B0:4E:26:EA:D8:87 server=LAN
add address=172.16.0.31 mac-address=D8:0D:17:C6:B6:A6 server=LAN
add address=172.16.0.32 mac-address=50:D4:F7:3C:8F:21 server=LAN
add address=172.16.0.33 mac-address=50:D4:F7:24:32:91 server=LAN
add address=172.16.0.34 mac-address=B0:4E:26:EA:D8:EB server=LAN
add address=172.16.0.36 mac-address=50:D4:F7:24:32:95 server=LAN
add address=172.16.0.37 mac-address=00:0C:42:B7:A4:72 server=LAN
add address=172.16.0.38 mac-address=C4:AD:34:04:5E:74 server=LAN
add address=172.16.0.39 mac-address=C4:AD:34:04:63:DE server=LAN
add address=172.16.0.40 mac-address=58:69:6C:71:D9:BD server=LAN
add address=172.16.0.41 mac-address=E8:DE:27:D8:34:C7 server=LAN
add address=172.16.0.42 mac-address=B0:4E:26:C9:C9:6E server=LAN
add address=172.16.0.43 mac-address=B0:4E:26:EA:D8:D2 server=LAN
add address=172.16.0.44 mac-address=E8:DE:27:D8:34:F2 server=LAN
add address=172.16.0.45 mac-address=E8:DE:27:D8:34:C3 server=LAN
add address=172.16.0.47 mac-address=E8:DE:27:D8:34:C4 server=LAN
add address=172.16.0.48 mac-address=E8:DE:27:D8:35:11 server=LAN
add address=172.16.0.49 mac-address=E8:DE:27:D8:35:31 server=LAN
add address=172.16.0.50 mac-address=B0:95:75:E1:7E:12 server=LAN
add address=172.16.0.51 mac-address=B0:95:75:E1:7E:16 server=LAN
add address=172.16.0.52 mac-address=CC:32:E5:C5:ED:52 server=LAN
add address=172.16.0.53 mac-address=B0:95:75:7D:B8:23 server=LAN
add address=172.16.0.54 mac-address=B0:95:75:7D:B8:22 server=LAN
add address=172.16.0.55 mac-address=B0:4E:26:EA:D9:1E server=LAN
add address=172.16.0.56 mac-address=B0:95:75:7D:B8:30 server=LAN
add address=172.16.0.57 mac-address=50:D4:F7:24:32:8E server=LAN
add address=172.16.0.58 mac-address=D8:47:32:7E:04:AD server=LAN
add address=172.16.0.59 mac-address=D8:47:32:9E:87:61 server=LAN
add address=172.16.0.60 mac-address=CC:32:E5:CB:5C:9D server=LAN
add address=172.16.0.61 mac-address=00:13:57:01:18:1F server=LAN
add address=172.16.0.62 mac-address=00:13:57:01:18:13 server=LAN
add address=172.16.0.63 mac-address=00:13:57:01:18:0F server=LAN
add address=172.16.0.64 mac-address=00:13:57:01:18:0E server=LAN
add address=172.16.0.65 mac-address=00:13:57:01:18:0C server=LAN
add address=172.16.0.66 mac-address=00:13:57:01:18:12 server=LAN
add address=172.16.0.67 mac-address=00:13:57:01:18:0D server=LAN
add address=172.16.0.68 mac-address=00:13:57:01:18:11 server=LAN
add address=172.16.0.69 mac-address=00:13:57:01:5F:17 server=LAN
add address=172.16.0.70 mac-address=00:13:57:01:18:26 server=LAN
add address=172.16.0.71 mac-address=00:13:57:01:18:0B server=LAN
add address=172.16.0.72 mac-address=00:13:57:01:18:20 server=LAN
add address=172.16.0.73 mac-address=00:13:57:01:18:15 server=LAN
add address=172.16.0.74 mac-address=00:13:57:01:18:1D server=LAN
add address=172.16.0.75 mac-address=00:13:57:01:18:22 server=LAN
add address=172.16.0.76 mac-address=00:13:57:01:18:07 server=LAN
add address=172.16.0.77 mac-address=00:13:57:01:18:0A server=LAN
add address=172.16.0.78 mac-address=00:13:57:01:18:16 server=LAN
add address=172.16.0.79 mac-address=00:13:57:01:18:23 server=LAN
add address=172.16.0.80 mac-address=00:13:57:01:18:1C server=LAN
add address=172.16.0.81 mac-address=00:13:57:01:18:19 server=LAN
add address=172.16.0.82 mac-address=00:13:57:01:18:14 server=LAN
add address=172.16.0.83 mac-address=00:13:57:01:18:09 server=LAN
add address=172.16.0.84 mac-address=00:13:57:01:18:1A server=LAN
add address=172.16.0.85 mac-address=00:13:57:01:18:08 server=LAN
add address=172.16.0.86 mac-address=00:13:57:01:18:24 server=LAN
add address=172.16.0.87 mac-address=00:13:57:01:18:1E server=LAN
add address=172.16.0.88 mac-address=00:13:57:01:18:05 server=LAN
add address=172.16.0.89 mac-address=00:13:57:01:7A:25 server=LAN
add address=172.16.0.90 mac-address=00:13:57:01:18:18 server=LAN
add address=172.16.0.91 mac-address=00:13:57:01:18:17 server=LAN
add address=172.16.0.92 mac-address=00:13:57:01:18:25 server=LAN
add address=172.16.0.93 mac-address=00:13:57:01:42:2D server=LAN
add address=172.16.0.94 mac-address=00:13:57:01:18:06 server=LAN
add address=172.16.0.95 mac-address=00:13:57:01:18:21 server=LAN
add address=172.16.0.97 mac-address=F4:EE:08:C3:68:46 server=LAN
add address=172.16.0.98 mac-address=24:77:03:7F:42:A4 server=LAN
add address=172.16.0.99 mac-address=98:EE:CB:78:E0:DB server=LAN
add address=172.16.0.100 mac-address=B0:95:75:7D:B8:21 server=LAN
add address=172.16.0.101 mac-address=C0:25:A5:7C:C1:C0 server=LAN
add address=172.16.0.102 mac-address=20:47:47:14:4F:BF server=LAN
add address=172.16.0.103 mac-address=00:13:57:03:D2:E6 server=LAN
add address=172.16.0.110 mac-address=C8:1F:66:3D:54:E3 server=LAN
add address=172.16.0.111 mac-address=00:0D:B9:4C:16:D1 server=LAN
add address=172.16.0.112 mac-address=00:0D:B9:54:05:C5 server=LAN
add address=172.16.0.113 mac-address=00:13:57:01:EB:52 server=LAN
add address=172.16.0.114 mac-address=FC:F5:28:60:F2:7D server=LAN
add address=172.16.0.115 mac-address=00:13:57:02:B5:01 server=LAN
add address=172.16.0.116 mac-address=C4:65:16:DF:47:B7 server=LAN
add address=172.16.0.118 mac-address=E8:DE:27:D8:35:30 server=LAN
add address=172.16.0.119 mac-address=00:0D:B9:4B:62:69 server=LAN
add address=172.16.0.120 mac-address=E8:DE:27:D8:34:E4 server=LAN
add address=172.16.0.122 mac-address=E8:DE:27:ED:C1:46 server=LAN
add address=172.16.0.123 mac-address=00:23:24:E7:32:FE server=LAN
add address=172.16.0.125 mac-address=E8:DE:27:D8:35:0A server=LAN
add address=172.16.0.127 mac-address=F8:BC:12:6F:C0:3C server=LAN
add address=172.16.0.128 mac-address=8C:04:BA:A0:0B:AB server=LAN
add address=172.16.0.130 mac-address=00:23:24:E6:B9:F9 server=LAN
add address=172.16.0.131 mac-address=00:23:24:E7:35:64 server=LAN
add address=172.16.0.132 mac-address=00:23:24:BC:0C:BF server=LAN
add address=172.16.0.134 mac-address=00:23:24:E4:8D:0F server=LAN
add address=172.16.0.139 mac-address=00:13:57:03:02:16 server=LAN
add address=172.16.0.140 mac-address=B4:B6:86:7D:74:8E server=LAN
add address=172.16.0.144 mac-address=6C:72:20:05:79:3C server=LAN
add address=172.16.0.145 mac-address=00:23:24:BC:0C:B9 server=LAN
add address=172.16.0.147 mac-address=F8:BC:12:6F:FD:58 server=LAN
add address=172.16.0.148 mac-address=00:13:57:03:02:0E server=LAN
add address=172.16.0.149 mac-address=00:23:24:E5:99:AD server=LAN
add address=172.16.0.151 mac-address=98:EE:CB:75:49:BF server=LAN
add address=172.16.0.152 mac-address=00:23:24:E5:99:FC server=LAN
add address=172.16.0.153 mac-address=98:EE:CB:75:49:BD server=LAN
add address=172.16.0.155 mac-address=00:23:24:E6:B9:38 server=LAN
add address=172.16.0.163 mac-address=00:23:24:BC:0D:3C server=LAN
add address=172.16.0.166 mac-address=00:23:24:E9:70:05 server=LAN
add address=172.16.0.169 mac-address=B0:4E:26:C9:C9:4D server=LAN
add address=172.16.0.170 mac-address=00:23:24:BC:0B:DF server=LAN
add address=172.16.0.176 mac-address=00:23:24:B8:90:BB server=LAN
add address=172.16.0.177 mac-address=D8:47:32:9E:87:5B server=LAN
add address=172.16.0.178 mac-address=00:23:24:E6:B8:42 server=LAN
add address=172.16.0.184 mac-address=6C:2B:59:DF:F7:C1 server=LAN
add address=172.16.0.188 mac-address=00:23:24:E7:35:49 server=LAN
add address=172.16.0.189 mac-address=D8:FE:E3:5C:9B:AE server=LAN
add address=172.16.0.191 mac-address=3C:2A:F4:B9:C6:C0 server=LAN
add address=172.16.0.194 mac-address=BC:83:85:24:1F:B7 server=LAN
add address=172.16.0.195 mac-address=78:7B:8A:95:B3:2D server=LAN
add address=172.16.0.196 mac-address=00:23:24:E1:FF:1B server=LAN
add address=172.16.0.197 mac-address=00:23:24:E7:33:EA server=LAN
add address=172.16.0.198 mac-address=C4:65:16:DF:B7:15 server=LAN
add address=172.16.0.199 mac-address=00:23:24:B8:91:50 server=LAN
add address=172.16.0.200 mac-address=00:23:24:BC:0D:0A server=LAN
add address=172.16.0.202 mac-address=F4:F1:5A:3B:8E:2B server=LAN
add address=172.16.0.203 mac-address=00:13:57:02:3F:CF server=LAN
add address=172.16.0.204 mac-address=00:13:57:02:3F:D0 server=LAN
add address=172.16.0.205 mac-address=00:23:24:E7:31:F6 server=LAN
add address=172.16.0.206 mac-address=00:13:57:02:3F:C6 server=LAN
add address=172.16.0.207 mac-address=00:21:6A:8B:D6:90 server=LAN
add address=172.16.0.208 mac-address=00:24:7E:E1:CF:41 server=LAN
add address=172.16.0.209 mac-address=00:13:57:04:92:20 server=LAN
add address=172.16.0.210 mac-address=C4:65:16:DF:57:31 server=LAN
add address=172.16.0.211 mac-address=00:13:57:01:EB:57 server=LAN
add address=172.16.0.212 mac-address=00:13:57:01:EB:59 server=LAN
add address=172.16.0.213 mac-address=00:23:24:E3:BD:3C server=LAN
add address=172.16.0.214 mac-address=00:13:57:04:2C:CA server=LAN
add address=172.16.0.215 mac-address=00:23:24:E6:BB:19 server=LAN
add address=172.16.0.216 mac-address=00:13:57:01:7A:31 server=LAN
add address=172.16.0.217 mac-address=F8:BC:12:6E:E2:0C server=LAN
add address=172.16.0.218 mac-address=00:13:57:01:7A:34 server=LAN
add address=172.16.0.219 mac-address=F8:BC:12:6F:FC:42 server=LAN
add address=172.16.0.220 mac-address=F8:BC:12:8A:43:18 server=LAN
add address=172.16.0.221 mac-address=F8:0D:AC:7B:22:A4 server=LAN
add address=172.16.0.222 mac-address=6C:2B:59:DF:B1:74 server=LAN
add address=172.16.0.223 mac-address=00:13:57:04:64:E8 server=LAN
add address=172.16.0.224 mac-address=00:13:57:04:96:2A server=LAN
add address=172.16.0.225 mac-address=80:86:F2:E4:71:77 server=LAN
add address=172.16.0.226 mac-address=00:13:57:03:CE:F0 server=LAN
add address=172.16.0.227 mac-address=00:13:57:04:96:29 server=LAN
add address=172.16.0.228 mac-address=D4:BE:D9:BA:D5:58 server=LAN
add address=172.16.0.229 mac-address=C0:25:A5:7C:C4:B1 server=LAN
add address=172.16.0.230 mac-address=60:57:18:64:80:C0 server=LAN
add address=172.16.0.231 mac-address=00:13:57:03:D2:E5 server=LAN
add address=172.16.0.232 mac-address=00:13:57:01:7A:35 server=LAN
add address=172.16.0.233 mac-address=00:13:57:04:2C:C6 server=LAN
add address=172.16.0.234 mac-address=00:13:57:04:96:21 server=LAN
add address=172.16.0.235 mac-address=00:23:24:E6:B6:A5 server=LAN
add address=172.16.0.236 mac-address=00:23:24:B8:8E:E0 server=LAN
add address=172.16.0.237 mac-address=00:13:57:04:2C:CE server=LAN
add address=172.16.0.238 mac-address=6C:2B:59:DF:B4:9E server=LAN
add address=172.16.0.239 mac-address=00:23:24:E9:71:83 server=LAN
add address=172.16.0.240 mac-address=C0:25:A5:7C:00:8A server=LAN
add address=172.16.0.241 mac-address=00:13:57:04:96:22 server=LAN
add address=172.16.0.242 mac-address=00:13:57:04:96:1E server=LAN
add address=172.16.0.243 mac-address=B0:83:FE:BD:AA:CA server=LAN
add address=172.16.0.244 mac-address=00:13:57:04:96:1F server=LAN
add address=172.16.0.245 mac-address=00:23:24:B8:8C:28 server=LAN
add address=172.16.0.246 mac-address=00:23:24:BC:0D:0B server=LAN
add address=172.16.0.247 mac-address=00:13:57:04:64:EA server=LAN
add address=172.16.0.248 mac-address=C4:65:16:DF:57:55 server=LAN
add address=172.16.0.249 mac-address=88:DC:96:0F:EA:2C server=LAN
add address=172.16.0.250 mac-address=C0:25:A5:7C:C1:30 server=LAN
add address=172.16.0.251 mac-address=00:23:24:E7:32:B5 server=LAN
add address=172.16.0.252 mac-address=00:13:57:01:7A:2D server=LAN
add address=172.16.0.254 mac-address=00:23:24:B8:8D:EE server=LAN
add address=172.16.1.3 mac-address=BC:30:5B:BD:6C:03 server=LAN
add address=172.16.1.5 mac-address=18:66:DA:65:D5:0D server=LAN
add address=172.16.1.6 mac-address=D4:BE:D9:BA:C7:54 server=LAN
add address=172.16.1.7 mac-address=00:14:4F:FA:7D:7F server=LAN
add address=172.16.1.8 mac-address=00:11:95:D4:F5:F4 server=LAN
add address=172.16.1.9 mac-address=00:C0:DD:23:B3:E0 server=LAN
add address=172.16.1.10 mac-address=00:10:18:60:2E:DA server=LAN
add address=172.16.1.11 mac-address=00:00:21:EA:63:E0 server=LAN
add address=172.16.1.12 mac-address=00:01:6C:92:8F:39 server=LAN
add address=172.16.1.13 mac-address=A0:F3:C1:4B:67:6D server=LAN
add address=172.16.1.15 mac-address=00:E0:00:A8:D2:2A server=LAN
add address=172.16.1.16 mac-address=00:E0:00:A8:FF:F4 server=LAN
add address=172.16.1.21 mac-address=78:2B:CB:03:10:06 server=LAN
add address=172.16.1.22 mac-address=78:2B:CB:23:9C:A4 server=LAN
add address=172.16.1.23 mac-address=BC:30:5B:C2:8C:E3 server=LAN
add address=172.16.1.24 mac-address=78:2B:CB:23:9C:A5 server=LAN
add address=172.16.1.26 mac-address=F8:BC:12:44:56:6A server=LAN
add address=172.16.1.40 mac-address=00:13:57:02:3F:CE server=LAN
add address=172.16.1.41 mac-address=00:13:57:03:CE:EC server=LAN
add address=172.16.1.42 mac-address=00:13:57:03:CE:E9 server=LAN
add address=172.16.1.43 mac-address=00:13:57:03:D2:E1 server=LAN
add address=172.16.1.44 mac-address=00:13:57:04:2C:CB server=LAN
add address=172.16.1.45 mac-address=00:13:57:04:2C:D0 server=LAN
add address=172.16.1.46 mac-address=00:13:57:04:2C:C7 server=LAN
add address=172.16.1.47 mac-address=00:13:57:04:2C:CC server=LAN
add address=172.16.1.48 mac-address=00:13:57:04:96:20 server=LAN
add address=172.16.1.50 mac-address=E4:54:E8:C0:F6:E5 server=LAN
add address=172.16.1.51 mac-address=00:13:57:03:D2:E3 server=LAN
add address=172.16.1.52 mac-address=88:DC:96:0F:E8:B0 server=LAN
add address=172.16.1.55 mac-address=00:13:57:00:87:3B server=LAN
add address=172.16.1.56 mac-address=C4:AD:34:04:5E:CE server=LAN
add address=172.16.1.60 mac-address=00:13:57:04:2C:CF server=LAN
add address=172.16.1.61 mac-address=00:13:57:04:2C:D1 server=LAN
add address=172.16.1.62 mac-address=00:13:57:04:2C:C8 server=LAN
add address=172.16.1.63 mac-address=00:13:57:04:2C:C9 server=LAN
add address=172.16.1.64 mac-address=00:13:57:04:2C:CD server=LAN
add address=172.16.1.66 mac-address=00:13:57:04:64:EB server=LAN
add address=172.16.1.67 mac-address=00:13:57:04:64:E9 server=LAN
add address=172.16.1.68 mac-address=00:13:57:04:64:E6 server=LAN
add address=172.16.1.69 mac-address=00:13:57:04:64:EC server=LAN
add address=172.16.1.70 mac-address=00:13:57:04:64:ED server=LAN
add address=172.16.1.71 mac-address=00:13:57:04:64:EE server=LAN
add address=172.16.1.72 mac-address=00:23:24:B8:91:A8 server=LAN
add address=172.16.1.74 mac-address=00:23:24:E6:B8:DE server=LAN
add address=172.16.1.76 mac-address=00:23:24:BC:0B:96 server=LAN
add address=172.16.1.77 mac-address=00:23:24:B8:8C:2E server=LAN
add address=172.16.1.79 mac-address=00:23:24:BC:0B:E6 server=LAN
add address=172.16.1.83 mac-address=00:23:24:E7:33:56 server=LAN
add address=172.16.1.84 mac-address=C0:25:A5:7C:02:0A server=LAN
add address=172.16.1.85 mac-address=C0:25:A5:7C:C4:AB server=LAN
add address=172.16.1.86 mac-address=00:23:24:B8:8D:70 server=LAN
add address=172.16.1.88 mac-address=B0:83:FE:77:35:8F server=LAN
add address=172.16.1.89 mac-address=B0:83:FE:BD:68:8B server=LAN
add address=172.16.1.90 mac-address=D8:FE:E3:5C:9A:78 server=LAN
add address=172.16.1.91 mac-address=BC:30:5B:BE:5A:AC server=LAN
add address=172.16.1.92 mac-address=A4:1F:72:58:92:AF server=LAN
add address=172.16.1.93 mac-address=00:23:24:E6:BA:10 server=LAN
add address=172.16.1.95 mac-address=B0:83:FE:BA:1C:3D server=LAN
add address=172.16.1.96 mac-address=B0:83:FE:88:E6:2B server=LAN
add address=172.16.1.97 mac-address=00:23:24:E6:B6:DB server=LAN
add address=172.16.1.98 mac-address=F8:BC:12:60:C1:DC server=LAN
add address=172.16.1.99 mac-address=00:23:24:E6:B9:64 server=LAN
add address=172.16.1.100 mac-address=00:23:24:B8:8E:30 server=LAN
add address=172.16.1.101 mac-address=00:23:24:E6:B5:51 server=LAN
add address=172.16.1.102 mac-address=00:23:24:E6:B6:49 server=LAN
add address=172.16.1.103 mac-address=00:23:24:E7:34:6C server=LAN
add address=172.16.1.104 mac-address=00:23:24:B8:8D:04 server=LAN
add address=172.16.1.105 mac-address=00:23:24:E7:35:61 server=LAN
add address=172.16.1.106 mac-address=00:23:24:BC:0B:B0 server=LAN
add address=172.16.1.107 mac-address=00:23:24:E6:B9:87 server=LAN
add address=172.16.1.108 mac-address=98:EE:CB:78:EE:90 server=LAN
add address=172.16.1.109 mac-address=00:23:24:E6:B8:C0 server=LAN
add address=172.16.1.110 mac-address=B0:83:FE:77:3D:D0 server=LAN
add address=172.16.1.111 mac-address=00:23:24:E7:33:EC server=LAN
add address=172.16.1.112 mac-address=00:23:24:E7:32:18 server=LAN
add address=172.16.1.113 mac-address=00:23:24:E6:B8:86 server=LAN
add address=172.16.1.114 mac-address=00:23:24:BC:0C:C4 server=LAN
add address=172.16.1.115 mac-address=00:23:24:B7:3B:5B server=LAN
add address=172.16.1.116 mac-address=00:23:24:E9:71:2F server=LAN
add address=172.16.1.117 mac-address=00:23:24:B8:91:0E server=LAN
add address=172.16.1.118 mac-address=00:23:24:E5:99:45 server=LAN
add address=172.16.1.119 mac-address=00:23:24:E5:99:4C server=LAN
add address=172.16.1.120 mac-address=00:23:24:BC:0C:4A server=LAN
add address=172.16.1.121 mac-address=00:23:24:B8:8F:51 server=LAN
add address=172.16.1.122 mac-address=B0:83:FE:B9:AC:F7 server=LAN
add address=172.16.1.123 mac-address=00:23:24:E3:BE:65 server=LAN
add address=172.16.1.124 mac-address=00:23:24:BC:0C:A7 server=LAN
add address=172.16.1.125 mac-address=00:23:24:E6:B5:38 server=LAN
add address=172.16.1.126 mac-address=C8:D3:A3:84:86:68 server=LAN
add address=172.16.1.127 mac-address=00:23:24:E9:6F:8F server=LAN
add address=172.16.1.128 mac-address=00:23:24:E6:BB:53 server=LAN
add address=172.16.1.129 mac-address=00:23:24:B8:8C:55 server=LAN
add address=172.16.1.130 mac-address=B8:AC:6F:30:7A:0D server=LAN
add address=172.16.1.131 mac-address=00:23:24:E2:02:84 server=LAN
add address=172.16.1.132 mac-address=00:23:24:BC:0B:22 server=LAN
add address=172.16.1.133 mac-address=00:23:24:E9:71:A9 server=LAN
add address=172.16.1.134 mac-address=00:23:24:B8:8F:27 server=LAN
add address=172.16.1.135 mac-address=98:EE:CB:78:E0:3F server=LAN
add address=172.16.1.136 mac-address=00:23:24:E6:B9:15 server=LAN
add address=172.16.1.137 mac-address=6C:2B:59:DF:FE:93 server=LAN
add address=172.16.1.138 mac-address=00:23:24:E7:32:84 server=LAN
add address=172.16.1.139 mac-address=8C:EC:4B:A2:94:87 server=LAN
add address=172.16.1.140 mac-address=00:23:24:E6:B6:BC server=LAN
add address=172.16.1.141 mac-address=00:23:24:E7:33:91 server=LAN
add address=172.16.1.142 mac-address=00:23:24:E7:35:C6 server=LAN
add address=172.16.1.143 mac-address=00:5F:67:B4:4D:81 server=LAN
add address=172.16.1.144 mac-address=00:23:24:E6:B6:7D server=LAN
add address=172.16.1.146 mac-address=00:23:24:E6:B9:59 server=LAN
add address=172.16.1.147 mac-address=00:23:24:E7:35:CC server=LAN
add address=172.16.1.154 mac-address=00:23:24:B8:91:06 server=LAN
add address=172.16.1.155 mac-address=00:23:24:E7:35:FA server=LAN
add address=172.16.1.159 mac-address=00:23:24:B8:8E:50 server=LAN
add address=172.16.1.160 mac-address=00:23:24:BC:0C:43 server=LAN
add address=172.16.1.161 mac-address=00:23:24:BC:0C:A6 server=LAN
add address=172.16.1.162 mac-address=00:23:24:B8:8D:D5 server=LAN
add address=172.16.1.163 mac-address=00:23:24:E7:34:CC server=LAN
add address=172.16.1.164 mac-address=00:23:24:B8:91:53 server=LAN
add address=172.16.1.165 mac-address=78:A6:A0:78:E4:01 server=LAN
add address=172.16.1.166 mac-address=78:A6:A0:78:EF:3D server=LAN
add address=172.16.1.167 mac-address=00:C0:A2:06:E8:E5 server=LAN
add address=172.16.1.168 mac-address=00:23:24:B8:8F:50 server=LAN
add address=172.16.1.169 mac-address=00:23:24:BC:0D:80 server=LAN
add address=172.16.1.170 mac-address=00:23:24:B8:8E:14 server=LAN
add address=172.16.1.171 mac-address=8C:73:6E:78:00:B3 server=LAN
add address=172.16.1.172 mac-address=00:23:24:E0:99:D3 server=LAN
add address=172.16.1.173 mac-address=00:23:24:BC:0C:F3 server=LAN
add address=172.16.1.174 mac-address=00:23:24:E6:B6:BA server=LAN
add address=172.16.1.175 mac-address=00:23:24:E6:B9:13 server=LAN
add address=172.16.1.176 mac-address=00:23:24:BC:0D:8F server=LAN
add address=172.16.1.177 mac-address=00:23:24:BC:0B:24 server=LAN
add address=172.16.1.178 mac-address=00:23:24:B8:8F:E4 server=LAN
add address=172.16.1.179 mac-address=00:23:24:E0:21:A7 server=LAN
add address=172.16.1.180 mac-address=98:EE:CB:78:E0:F1 server=LAN
add address=172.16.1.181 mac-address=00:23:24:B8:8D:0F server=LAN
add address=172.16.1.182 mac-address=00:23:24:BC:0A:E2 server=LAN
add address=172.16.1.183 mac-address=E4:54:E8:A4:EE:EB server=LAN
add address=172.16.1.184 mac-address=98:EE:CB:78:EC:F3 server=LAN
add address=172.16.1.185 mac-address=00:23:24:E6:B8:EB server=LAN
add address=172.16.1.186 mac-address=00:23:24:E6:B8:D3 server=LAN
add address=172.16.1.187 mac-address=00:23:24:B8:8D:73 server=LAN
add address=172.16.1.188 mac-address=00:23:24:E6:B9:AF server=LAN
add address=172.16.1.189 mac-address=00:23:24:E7:31:C6 server=LAN
add address=172.16.1.190 mac-address=00:23:24:E6:B5:32 server=LAN
add address=172.16.1.191 mac-address=00:23:24:E0:99:6F server=LAN
add address=172.16.1.192 mac-address=B8:AC:6F:30:79:E7 server=LAN
add address=172.16.1.194 mac-address=00:23:24:BC:0C:85 server=LAN
add address=172.16.1.195 mac-address=38:8C:50:14:E0:AD server=LAN
add address=172.16.1.196 mac-address=98:EE:CB:78:DF:79 server=LAN
add address=172.16.1.197 mac-address=68:FF:7B:22:28:73 server=LAN
add address=172.16.1.198 mac-address=00:23:24:E0:24:77 server=LAN
add address=172.16.1.199 mac-address=B0:83:FE:BD:AC:B1 server=LAN
add address=172.16.1.201 mac-address=6C:2B:59:C7:27:84 server=LAN
add address=172.16.1.202 mac-address=00:23:24:BC:0C:DD server=LAN
add address=172.16.1.203 mac-address=8C:04:BA:A0:0C:BF server=LAN
add address=172.16.1.204 mac-address=00:23:24:B7:3A:96 server=LAN
add address=172.16.1.205 mac-address=00:23:24:B5:0C:8A server=LAN
add address=172.16.1.206 mac-address=00:23:24:B8:92:98 server=LAN
add address=172.16.1.207 mac-address=00:23:24:BC:0C:C8 server=LAN
add address=172.16.1.208 mac-address=5C:26:0A:2D:AE:E3 server=LAN
add address=172.16.1.209 mac-address=6C:2B:59:C7:2A:96 server=LAN
add address=172.16.1.210 mac-address=00:23:24:B8:8C:DD server=LAN
add address=172.16.1.211 mac-address=00:23:24:E6:B9:0A server=LAN
add address=172.16.1.212 mac-address=00:23:24:E1:FB:B4 server=LAN
add address=172.16.1.213 mac-address=00:23:24:BC:0C:23 server=LAN
add address=172.16.1.214 mac-address=6C:2B:59:DF:B2:0B server=LAN
add address=172.16.1.215 mac-address=8C:04:BA:A0:0B:A2 server=LAN
add address=172.16.1.216 mac-address=00:23:24:E6:B7:D2 server=LAN
add address=172.16.1.217 mac-address=6C:2B:59:E0:01:1F server=LAN
add address=172.16.1.218 mac-address=E4:54:E8:B1:09:FE server=LAN
add address=172.16.1.219 mac-address=00:23:24:BC:0C:D0 server=LAN
add address=172.16.1.220 mac-address=00:23:24:E9:71:A7 server=LAN
add address=172.16.1.221 mac-address=6C:2B:59:DF:F7:E6 server=LAN
add address=172.16.1.222 mac-address=00:23:24:BC:0D:EA server=LAN
add address=172.16.1.223 mac-address=00:23:24:B7:3B:91 server=LAN
add address=172.16.1.225 mac-address=6C:2B:59:DF:FF:C8 server=LAN
add address=172.16.1.226 mac-address=00:23:24:BC:0B:50 server=LAN
add address=172.16.1.227 mac-address=00:23:24:BC:0B:6C server=LAN
add address=172.16.1.229 mac-address=00:23:24:E6:B9:92 server=LAN
add address=172.16.1.231 mac-address=00:23:24:B8:91:14 server=LAN
add address=172.16.1.234 mac-address=B8:AC:6F:30:70:68 server=LAN
add address=172.16.1.236 mac-address=00:13:57:02:14:BF server=LAN
add address=172.16.1.237 mac-address=00:13:57:01:BB:FB server=LAN
add address=172.16.1.238 mac-address=00:23:24:E1:FB:22 server=LAN
add address=172.16.1.241 mac-address=B0:83:FE:77:37:84 server=LAN
add address=172.16.1.242 mac-address=00:23:24:BC:0C:FF server=LAN
add address=172.16.1.243 mac-address=40:3F:8C:78:30:6B server=LAN
add address=172.16.1.244 mac-address=00:23:24:E7:35:52 server=LAN
add address=172.16.1.245 mac-address=00:15:17:B3:82:AF server=LAN
add address=172.16.1.248 mac-address=00:23:24:BC:0D:57 server=LAN
add address=172.16.1.249 mac-address=00:23:24:E7:34:2D server=LAN
add address=172.16.1.250 mac-address=F8:BC:12:6F:FA:84 server=LAN
add address=172.16.1.252 mac-address=00:23:24:BC:0C:9E server=LAN
add address=172.16.1.253 mac-address=00:23:24:B8:90:98 server=LAN
add address=172.16.1.254 mac-address=00:23:24:B7:3C:0A server=LAN
add address=172.16.1.255 mac-address=00:23:24:E2:01:CF server=LAN
add address=172.16.2.3 mac-address=00:21:28:0E:AB:71 server=LAN
add address=172.16.2.4 mac-address=78:2B:CB:23:9C:A6 server=LAN
add address=172.16.2.5 mac-address=18:66:DA:65:D5:0F server=LAN
add address=172.16.2.6 mac-address=F8:BC:12:44:56:6E server=LAN
add address=172.16.2.7 mac-address=18:66:DA:5F:9F:85 server=LAN
add address=172.16.2.8 mac-address=18:66:DA:62:82:9B server=LAN
add address=172.16.2.9 mac-address=00:C0:DD:23:BA:5C server=LAN
add address=172.16.2.10 mac-address=78:2B:CB:03:10:08 server=LAN
add address=172.16.2.11 mac-address=00:21:28:46:BB:CA server=LAN
add address=172.16.2.12 mac-address=00:C0:DD:23:C2:C0 server=LAN
add address=172.16.2.20 mac-address=00:03:BA:41:B9:D8 server=LAN
add address=172.16.2.21 mac-address=00:03:BA:41:B9:CF server=LAN
add address=172.16.2.22 mac-address=00:03:BA:41:B9:D0 server=LAN
add address=172.16.2.23 mac-address=00:03:BA:41:B9:D1 server=LAN
add address=172.16.2.24 mac-address=00:03:BA:41:B9:D2 server=LAN
add address=172.16.2.31 mac-address=C4:6E:1F:A8:77:59 server=LAN
add address=172.16.2.32 mac-address=C4:6E:1F:A8:77:2D server=LAN
add address=172.16.2.33 mac-address=C4:6E:1F:A8:76:C8 server=LAN
add address=172.16.2.34 mac-address=C4:6E:1F:A8:77:48 server=LAN
add address=172.16.2.35 mac-address=C4:6E:1F:A8:77:50 server=LAN
add address=172.16.2.36 mac-address=B0:95:75:7D:B8:24 server=LAN
add address=172.16.2.37 mac-address=1C:3B:F3:C5:81:27 server=LAN
add address=172.16.2.38 mac-address=B0:95:75:7D:B8:25 server=LAN
add address=172.16.2.41 mac-address=E8:DE:27:ED:C1:03 server=LAN
add address=172.16.2.42 mac-address=E8:DE:27:D8:34:BA server=LAN
add address=172.16.2.43 mac-address=D8:07:B6:AD:11:B5 server=LAN
add address=172.16.2.44 mac-address=D8:07:B6:AD:11:A2 server=LAN
add address=172.16.2.45 mac-address=E8:DE:27:D8:34:E5 server=LAN
add address=172.16.2.51 mac-address=00:74:9C:06:32:49 server=LAN
add address=172.16.2.52 mac-address=00:74:9C:04:A0:ED server=LAN
add address=172.16.2.53 mac-address=00:74:9C:06:71:A9 server=LAN
add address=172.16.2.54 mac-address=00:74:9C:06:49:35 server=LAN
add address=172.16.2.55 mac-address=00:74:9C:04:1E:65 server=LAN
add address=172.16.2.56 mac-address=00:74:9C:05:F7:2D server=LAN
add address=172.16.2.57 mac-address=00:74:9C:06:71:F1 server=LAN
add address=172.16.2.58 mac-address=00:74:9C:04:1E:8D server=LAN
add address=172.16.2.59 mac-address=00:74:9C:04:B6:AD server=LAN
add address=172.16.2.60 mac-address=00:74:9C:06:70:15 server=LAN
add address=172.16.2.61 mac-address=00:74:9C:06:48:F1 server=LAN
add address=172.16.2.62 mac-address=00:74:9C:06:49:2D server=LAN
add address=172.16.2.63 mac-address=00:74:9C:04:94:BD server=LAN
add address=172.16.2.64 mac-address=00:74:9C:06:2D:19 server=LAN
add address=172.16.2.65 mac-address=58:69:6C:D4:27:A5 server=LAN
add address=172.16.2.66 mac-address=00:74:9C:06:42:79 server=LAN
add address=172.16.2.67 mac-address=00:74:9C:06:71:85 server=LAN
add address=172.16.2.68 mac-address=00:74:9C:06:45:B9 server=LAN
add address=172.16.2.69 mac-address=00:74:9C:06:53:DD server=LAN
add address=172.16.2.70 mac-address=00:74:9C:06:4D:D1 server=LAN
add address=172.16.2.71 mac-address=00:74:9C:06:08:61 server=LAN
add address=172.16.2.72 mac-address=00:23:24:E6:B5:A3 server=LAN
add address=172.16.2.74 mac-address=00:23:24:B8:92:51 server=LAN
add address=172.16.2.75 mac-address=00:74:9C:06:70:25 server=LAN
add address=172.16.2.76 mac-address=00:74:9C:06:2B:C5 server=LAN
add address=172.16.2.77 mac-address=00:23:24:E6:B8:A4 server=LAN
add address=172.16.2.78 mac-address=00:74:9C:06:4F:79 server=LAN
add address=172.16.2.79 mac-address=00:74:9C:06:28:49 server=LAN
add address=172.16.2.80 mac-address=00:74:9C:04:61:49 server=LAN
add address=172.16.2.81 mac-address=00:23:24:E6:B8:5A server=LAN
add address=172.16.2.82 mac-address=00:23:24:E6:B9:4E server=LAN
add address=172.16.2.83 mac-address=00:23:24:E1:FF:3E server=LAN
add address=172.16.2.84 mac-address=00:74:9C:04:63:3D server=LAN
add address=172.16.2.85 mac-address=00:74:9C:04:60:35 server=LAN
add address=172.16.2.86 mac-address=00:74:9C:04:3B:7D server=LAN
add address=172.16.2.87 mac-address=00:74:9C:04:15:A5 server=LAN
add address=172.16.2.88 mac-address=00:74:9C:04:3B:99 server=LAN
add address=172.16.2.89 mac-address=00:74:9C:04:3B:D5 server=LAN
add address=172.16.2.90 mac-address=00:74:9C:04:42:49 server=LAN
add address=172.16.2.91 mac-address=00:74:9C:04:60:31 server=LAN
add address=172.16.2.92 mac-address=00:74:9C:04:62:FD server=LAN
add address=172.16.2.93 mac-address=00:74:9C:04:60:A5 server=LAN
add address=172.16.2.94 mac-address=00:74:9C:04:C1:75 server=LAN
add address=172.16.2.95 mac-address=00:74:9C:04:D3:B5 server=LAN
add address=172.16.2.96 mac-address=00:74:9C:06:71:C9 server=LAN
add address=172.16.2.97 mac-address=00:74:9C:04:93:AD server=LAN
add address=172.16.2.98 mac-address=00:74:9C:06:43:25 server=LAN
add address=172.16.2.99 mac-address=00:74:9C:04:95:55 server=LAN
add address=172.16.2.100 mac-address=00:74:9C:06:71:E5 server=LAN
add address=172.16.2.101 mac-address=00:74:9C:04:A8:AD server=LAN
add address=172.16.2.102 mac-address=00:74:9C:06:05:E9 server=LAN
add address=172.16.2.103 mac-address=00:74:9C:06:48:E5 server=LAN
add address=172.16.2.104 mac-address=00:74:9C:04:94:45 server=LAN
add address=172.16.2.105 mac-address=00:23:24:BC:0C:99 server=LAN
add address=172.16.2.106 mac-address=00:23:24:DF:08:A7 server=LAN
add address=172.16.2.107 mac-address=00:74:9C:06:16:CD server=LAN
add address=172.16.2.108 mac-address=58:69:6C:D4:1E:19 server=LAN
add address=172.16.2.109 mac-address=00:74:9C:04:18:4D server=LAN
add address=172.16.2.110 mac-address=00:74:9C:06:2B:99 server=LAN
add address=172.16.2.111 mac-address=00:23:24:E6:BA:78 server=LAN
add address=172.16.2.112 mac-address=00:74:9C:04:C2:91 server=LAN
add address=172.16.2.113 mac-address=9C:2B:A6:43:40:11 server=LAN
add address=172.16.2.114 mac-address=8C:EC:4B:A6:8E:0E server=LAN
add address=172.16.2.115 mac-address=8C:EC:4B:A6:71:62 server=LAN
add address=172.16.2.116 mac-address=00:23:24:B8:8C:33 server=LAN
add address=172.16.2.117 mac-address=9C:2B:A6:43:3F:A8 server=LAN
add address=172.16.2.118 mac-address=9C:2B:A6:43:40:25 server=LAN
add address=172.16.2.119 mac-address=00:74:9C:04:1B:95 server=LAN
add address=172.16.2.120 mac-address=00:74:9C:04:18:41 server=LAN
add address=172.16.2.121 mac-address=9C:2B:A6:43:54:16 server=LAN
add address=172.16.2.122 mac-address=00:74:9C:04:15:41 server=LAN
add address=172.16.2.123 mac-address=00:74:9C:04:18:61 server=LAN
add address=172.16.2.124 mac-address=00:74:9C:04:1E:C5 server=LAN
add address=172.16.2.125 mac-address=00:23:24:E6:BA:0F server=LAN
add address=172.16.2.126 mac-address=00:74:9C:04:18:C1 server=LAN
add address=172.16.2.127 mac-address=9C:2B:A6:43:4F:AC server=LAN
add address=172.16.2.128 mac-address=9C:2B:A6:43:40:20 server=LAN
add address=172.16.2.129 mac-address=20:47:47:3F:C0:41 server=LAN
add address=172.16.2.130 mac-address=9C:2B:A6:43:3F:E9 server=LAN
add address=172.16.2.131 mac-address=00:23:24:E6:B9:E1 server=LAN
add address=172.16.2.132 mac-address=C4:65:16:DF:57:05 server=LAN
add address=172.16.2.133 mac-address=9C:2B:A6:43:53:5D server=LAN
add address=172.16.2.134 mac-address=6C:72:20:05:78:14 server=LAN
add address=172.16.2.135 mac-address=00:23:24:E9:70:D7 server=LAN
add address=172.16.2.136 mac-address=00:23:24:B8:8E:83 server=LAN
add address=172.16.2.137 mac-address=00:23:24:E6:B8:3E server=LAN
add address=172.16.2.138 mac-address=00:23:24:B8:8C:CE server=LAN
add address=172.16.2.139 mac-address=9C:2B:A6:43:53:B2 server=LAN
add address=172.16.2.140 mac-address=9C:2B:A6:43:54:BB server=LAN
add address=172.16.2.141 mac-address=00:23:24:BC:0B:94 server=LAN
add address=172.16.2.142 mac-address=00:23:24:E6:B8:DB server=LAN
add address=172.16.2.143 mac-address=00:23:24:B8:8E:2F server=LAN
add address=172.16.2.144 mac-address=00:23:24:E5:99:5B server=LAN
add address=172.16.2.145 mac-address=40:2C:F4:03:95:63 server=LAN
add address=172.16.2.146 mac-address=00:23:24:BC:0A:E7 server=LAN
add address=172.16.2.147 mac-address=9C:2B:A6:43:54:A2 server=LAN
add address=172.16.2.148 mac-address=9C:2B:A6:43:54:C0 server=LAN
add address=172.16.2.149 mac-address=9C:2B:A6:43:54:DE server=LAN
add address=172.16.2.150 mac-address=00:08:9B:99:33:3F server=LAN
add address=172.16.2.151 mac-address=9C:2B:A6:43:55:10 server=LAN
add address=172.16.2.152 mac-address=9C:2B:A6:43:45:93 server=LAN
add address=172.16.2.155 mac-address=00:23:24:B8:8E:0F server=LAN
add address=172.16.2.156 mac-address=00:23:24:BC:0C:AA server=LAN
add address=172.16.2.157 mac-address=00:23:24:E6:B9:AD server=LAN
add address=172.16.2.158 mac-address=00:23:24:E9:71:B5 server=LAN
add address=172.16.2.160 mac-address=00:23:24:E7:32:01 server=LAN
add address=172.16.2.161 mac-address=6C:4B:90:08:44:36 server=LAN
add address=172.16.2.162 mac-address=00:23:24:E6:B5:9B server=LAN
add address=172.16.2.163 mac-address=00:23:24:E2:01:69 server=LAN
add address=172.16.2.164 mac-address=00:23:24:B7:3B:8D server=LAN
add address=172.16.2.165 mac-address=F8:BC:12:61:1E:A2 server=LAN
add address=172.16.2.166 mac-address=6C:3B:6B:2D:8C:8F server=LAN
add address=172.16.2.167 mac-address=C4:AD:34:04:5F:70 server=LAN
add address=172.16.2.168 mac-address=C4:AD:34:04:63:E4 server=LAN
add address=172.16.2.169 mac-address=00:23:24:E9:72:5A server=LAN
add address=172.16.2.170 mac-address=20:47:47:3F:CA:2A server=LAN
add address=172.16.2.172 mac-address=00:23:24:E1:FB:2C server=LAN
add address=172.16.2.174 mac-address=00:23:24:B8:8C:19 server=LAN
add address=172.16.2.175 mac-address=00:23:24:B8:8C:11 server=LAN
add address=172.16.2.176 mac-address=00:23:24:E7:34:8A server=LAN
add address=172.16.2.177 mac-address=00:23:24:E9:6F:7F server=LAN
add address=172.16.2.179 mac-address=B8:AC:6F:30:78:AD server=LAN
add address=172.16.2.180 mac-address=00:23:24:E9:75:D1 server=LAN
add address=172.16.2.181 mac-address=00:23:24:E7:32:F9 server=LAN
add address=172.16.2.182 mac-address=00:23:24:B8:8F:EB server=LAN
add address=172.16.2.183 mac-address=B0:83:FE:77:3E:55 server=LAN
add address=172.16.2.184 mac-address=00:23:24:BC:0C:28 server=LAN
add address=172.16.2.187 mac-address=00:23:24:E9:6F:64 server=LAN
add address=172.16.2.188 mac-address=00:23:24:BC:0A:EB server=LAN
add address=172.16.2.189 mac-address=00:23:24:E6:BA:83 server=LAN
add address=172.16.2.191 mac-address=00:23:24:E6:B5:B4 server=LAN
add address=172.16.2.192 mac-address=00:23:24:E7:32:43 server=LAN
add address=172.16.2.195 mac-address=00:23:24:BC:0C:BE server=LAN
add address=172.16.2.196 mac-address=00:23:24:BC:0C:E3 server=LAN
add address=172.16.2.198 mac-address=00:13:57:01:5F:19 server=LAN
add address=172.16.2.204 mac-address=00:23:24:E7:34:01 server=LAN
add address=172.16.2.206 mac-address=00:23:24:BC:0B:A4 server=LAN
add address=172.16.2.207 mac-address=00:D0:59:06:02:EF server=LAN
add address=172.16.2.212 mac-address=00:23:24:E6:B5:4A server=LAN
add address=172.16.2.213 mac-address=00:23:24:E6:B9:24 server=LAN
add address=172.16.2.214 mac-address=B8:AC:6F:30:75:D1 server=LAN
add address=172.16.2.215 mac-address=00:23:24:E1:FB:23 server=LAN
add address=172.16.2.216 mac-address=00:23:24:B8:91:C7 server=LAN
add address=172.16.2.217 mac-address=00:23:24:B8:91:9E server=LAN
add address=172.16.2.220 mac-address=30:24:A9:C6:F6:72 server=LAN
add address=172.16.2.221 mac-address=00:23:24:E7:34:16 server=LAN
add address=172.16.2.222 mac-address=00:23:24:B8:8C:A3 server=LAN
add address=172.16.2.224 mac-address=00:23:24:B5:12:26 server=LAN
add address=172.16.2.226 mac-address=00:23:24:E6:B8:9A server=LAN
add address=172.16.2.228 mac-address=00:50:BF:1A:FD:A7 server=LAN
add address=172.16.2.230 mac-address=00:13:57:01:18:27 server=LAN
add address=172.16.2.231 mac-address=00:23:24:E1:FB:77 server=LAN
add address=172.16.2.232 mac-address=BC:1C:81:65:BD:CE server=LAN
add address=172.16.2.233 mac-address=BC:1C:81:80:60:EE server=LAN
add address=172.16.2.234 mac-address=00:23:24:BC:0C:E0 server=LAN
add address=172.16.2.235 mac-address=00:23:24:BC:0B:E9 server=LAN
add address=172.16.2.237 mac-address=98:EE:CB:78:EC:3B server=LAN
add address=172.16.2.238 mac-address=00:23:24:B8:8F:12 server=LAN
add address=172.16.2.240 mac-address=00:23:24:E1:FB:37 server=LAN
add address=172.16.2.241 mac-address=00:23:24:BC:0C:54 server=LAN
add address=172.16.2.243 mac-address=00:23:24:BC:0D:96 server=LAN
add address=172.16.2.244 mac-address=00:23:24:E9:6F:8B server=LAN
add address=172.16.2.245 mac-address=B4:B6:86:7D:95:38 server=LAN
add address=172.16.2.246 mac-address=00:50:BF:21:91:7A server=LAN
add address=172.16.2.247 mac-address=00:23:24:B8:92:22 server=LAN
add address=172.16.2.251 mac-address=00:23:24:E7:33:42 server=LAN
add address=172.16.2.252 mac-address=00:23:24:E6:B8:8A server=LAN
add address=172.16.2.253 mac-address=00:23:24:BC:0C:00 server=LAN
add address=172.16.2.254 mac-address=00:23:24:BC:0D:8A server=LAN
add address=172.16.3.1 mac-address=00:90:C2:C0:9D:0C server=LAN
add address=172.16.3.2 mac-address=00:90:C2:C3:FA:A2 server=LAN
add address=172.16.3.3 mac-address=00:90:C2:C5:FB:B8 server=LAN
add address=172.16.3.4 mac-address=00:90:C2:C0:23:B2 server=LAN
add address=172.16.3.5 mac-address=00:90:C2:C1:FA:1E server=LAN
add address=172.16.3.6 mac-address=C4:65:16:DF:F9:BD server=LAN
add address=172.16.3.8 mac-address=30:24:A9:C6:F6:76 server=LAN
add address=172.16.3.10 mac-address=C4:65:16:DF:37:97 server=LAN
add address=172.16.3.11 mac-address=00:03:27:00:EE:78 server=LAN
add address=172.16.3.12 mac-address=00:03:27:01:06:D3 server=LAN
add address=172.16.3.13 mac-address=00:03:27:01:08:3C server=LAN
add address=172.16.3.14 mac-address=00:03:27:00:F8:8D server=LAN
add address=172.16.3.15 mac-address=00:50:C2:FE:91:B0 server=LAN
add address=172.16.3.16 mac-address=00:03:27:00:54:2E server=LAN
add address=172.16.3.17 mac-address=00:03:27:01:DD:A5 server=LAN
add address=172.16.3.18 mac-address=00:C0:A2:02:FD:F3 server=LAN
add address=172.16.3.19 mac-address=70:B3:D5:BD:84:A2 server=LAN
add address=172.16.3.20 mac-address=00:9C:02:84:43:DE server=LAN
add address=172.16.3.21 mac-address=00:1B:A9:F6:8C:98 server=LAN
add address=172.16.3.22 mac-address=C4:65:16:DF:57:63 server=LAN
add address=172.16.3.23 mac-address=00:12:EA:03:68:F7 server=LAN
add address=172.16.3.24 mac-address=00:13:57:02:3F:C7 server=LAN
add address=172.16.3.25 mac-address=00:13:57:02:3F:C9 server=LAN
add address=172.16.3.26 mac-address=00:13:57:01:EB:54 server=LAN
add address=172.16.3.27 mac-address=00:13:57:01:BC:01 server=LAN
add address=172.16.3.28 mac-address=00:13:57:02:3F:CA server=LAN
add address=172.16.3.29 mac-address=00:13:57:01:5F:16 server=LAN
add address=172.16.3.31 mac-address=64:00:6A:0C:39:18 server=LAN
add address=172.16.3.32 mac-address=00:23:24:E6:B8:CF server=LAN
add address=172.16.3.33 mac-address=B8:CA:3A:95:CA:A3 server=LAN
add address=172.16.3.34 mac-address=34:17:EB:9A:D7:1D server=LAN
add address=172.16.3.35 mac-address=00:13:57:01:5F:1B server=LAN
add address=172.16.3.36 mac-address=B0:83:FE:BC:FB:2E server=LAN
add address=172.16.3.37 mac-address=00:13:57:01:7A:32 server=LAN
add address=172.16.3.39 mac-address=20:89:84:BD:C3:DA server=LAN
add address=172.16.3.40 mac-address=4C:CC:6A:01:46:4F server=LAN
add address=172.16.3.41 mac-address=00:13:57:01:7A:28 server=LAN
add address=172.16.3.42 mac-address=00:13:57:01:5F:1A server=LAN
add address=172.16.3.44 mac-address=84:7B:EB:44:EC:74 server=LAN
add address=172.16.3.45 mac-address=68:14:01:73:10:83 server=LAN
add address=172.16.3.46 mac-address=00:0C:42:B7:A4:6C server=LAN
add address=172.16.3.47 mac-address=40:49:0F:37:4B:A1 server=LAN
add address=172.16.3.48 mac-address=14:18:77:B9:AB:2A server=LAN
add address=172.16.3.49 mac-address=B0:83:FE:BA:1D:F4 server=LAN
add address=172.16.3.50 mac-address=6C:72:20:05:78:50 server=LAN
add address=172.16.3.52 mac-address=E8:DE:27:D8:35:21 server=LAN
add address=172.16.3.54 mac-address=BC:AD:28:E0:79:83 server=LAN
add address=172.16.3.55 mac-address=00:23:24:B8:8F:EC server=LAN
add address=172.16.3.56 mac-address=44:D2:44:4A:13:DC server=LAN
add address=172.16.3.57 mac-address=00:13:57:01:7A:24 server=LAN
add address=172.16.3.58 mac-address=00:13:57:01:7A:33 server=LAN
add address=172.16.3.60 mac-address=BC:AD:28:8E:0C:96 server=LAN
add address=172.16.3.61 mac-address=00:13:57:01:BB:FC server=LAN
add address=172.16.3.62 mac-address=00:13:57:01:BC:03 server=LAN
add address=172.16.3.63 mac-address=00:13:57:01:BB:FE server=LAN
add address=172.16.3.64 mac-address=BC:F1:F2:B7:0D:C0 server=LAN
add address=172.16.3.65 mac-address=20:4C:9E:9A:89:C0 server=LAN
add address=172.16.3.66 mac-address=DC:CE:C1:AC:9E:FA server=LAN
add address=172.16.3.67 mac-address=DC:CE:C1:AC:AB:6C server=LAN
add address=172.16.3.68 mac-address=DC:CE:C1:AC:AA:E5 server=LAN
add address=172.16.3.70 mac-address=EC:93:27:01:45:88 server=LAN
add address=172.16.3.71 mac-address=BC:30:5B:BD:5A:C4 server=LAN
add address=172.16.3.72 mac-address=6C:72:20:05:78:43 server=LAN
add address=172.16.3.73 mac-address=6C:72:20:05:77:0F server=LAN
add address=172.16.3.74 mac-address=00:13:57:01:5F:15 server=LAN
add address=172.16.3.75 mac-address=30:24:A9:04:97:19 server=LAN
add address=172.16.3.76 mac-address=00:13:57:01:7A:2C server=LAN
add address=172.16.3.77 mac-address=00:13:57:01:7A:2E server=LAN
add address=172.16.3.78 mac-address=A4:1F:72:58:91:E2 server=LAN
add address=172.16.3.79 mac-address=40:83:DE:F4:5E:BC server=LAN
add address=172.16.3.80 mac-address=50:F1:4A:BD:B3:30 server=LAN
add address=172.16.3.83 mac-address=A4:1F:72:62:BF:3D server=LAN
add address=172.16.3.84 mac-address=C4:12:F5:30:DD:25 server=LAN
add address=172.16.3.85 mac-address=00:23:24:BC:0D:17 server=LAN
add address=172.16.3.86 mac-address=00:13:57:02:22:B1 server=LAN
add address=172.16.3.87 mac-address=00:23:24:BC:0B:5C server=LAN
add address=172.16.3.88 mac-address=00:23:24:BC:0C:A5 server=LAN
add address=172.16.3.89 mac-address=00:23:24:B8:8D:86 server=LAN
add address=172.16.3.90 mac-address=00:23:24:B8:8E:B5 server=LAN
add address=172.16.3.91 mac-address=00:13:57:01:EB:55 server=LAN
add address=172.16.3.92 mac-address=00:23:24:E1:FB:30 server=LAN
add address=172.16.3.93 mac-address=00:13:57:02:22:9D server=LAN
add address=172.16.3.94 mac-address=00:23:24:E9:6F:6C server=LAN
add address=172.16.3.95 mac-address=00:23:24:BC:0C:E4 server=LAN
add address=172.16.3.97 mac-address=00:23:24:E9:70:25 server=LAN
add address=172.16.3.98 mac-address=00:13:57:01:EB:58 server=LAN
add address=172.16.3.99 mac-address=98:EE:CB:75:47:D7 server=LAN
add address=172.16.3.100 mac-address=00:23:24:E6:B9:18 server=LAN
add address=172.16.3.101 mac-address=B0:83:FE:77:1F:DA server=LAN
add address=172.16.3.111 mac-address=88:DC:96:11:A4:7C server=LAN
add address=172.16.3.116 mac-address=00:13:57:03:D2:EA server=LAN
add address=172.16.3.130 mac-address=C4:65:16:DF:67:4F server=LAN
add address=172.16.3.177 mac-address=00:24:D7:76:CE:68 server=LAN
add address=172.16.3.183 mac-address=18:66:DA:62:82:97 server=LAN
add address=172.16.3.191 mac-address=C4:65:16:DF:57:65 server=LAN
add address=172.16.3.195 mac-address=18:60:24:C4:59:B6 server=LAN
add address=172.16.3.200 mac-address=30:24:A9:F5:12:2D server=LAN
add address=172.30.1.1 mac-address=00:18:8A:25:CD:50 server=CCTV
add address=172.30.1.2 mac-address=00:18:8A:25:B2:54 server=CCTV
add address=172.30.1.3 mac-address=00:18:8A:25:CD:55 server=CCTV
add address=172.30.1.4 mac-address=00:18:8A:25:CD:59 server=CCTV
add address=172.30.1.5 mac-address=00:18:8A:25:CD:61 server=CCTV
add address=172.30.1.6 mac-address=00:18:8A:25:C7:50 server=CCTV
add address=172.30.1.7 mac-address=00:18:8A:25:C7:4E server=CCTV
add address=172.30.1.8 mac-address=00:18:8A:25:CD:63 server=CCTV
add address=172.30.1.9 mac-address=00:18:8A:25:CD:6A server=CCTV
add address=172.30.1.10 mac-address=00:18:8A:25:C7:55 server=CCTV
add address=172.30.1.11 mac-address=00:18:8A:24:F2:F9 server=CCTV
add address=172.30.1.12 mac-address=00:18:8A:24:F2:F4 server=CCTV
add address=172.30.1.13 mac-address=00:18:8A:24:F2:FC server=CCTV
add address=172.30.1.14 mac-address=00:18:8A:25:B2:56 server=CCTV
add address=172.30.1.15 mac-address=00:18:8A:25:B2:51 server=CCTV
add address=172.30.1.16 mac-address=00:18:8A:24:F2:FA server=CCTV
add address=172.30.1.17 mac-address=00:18:8A:25:CD:6C server=CCTV
add address=172.30.1.18 mac-address=00:18:8A:25:CD:5B server=CCTV
add address=172.30.1.19 mac-address=00:18:8A:24:F2:F6 server=CCTV
add address=172.30.1.20 mac-address=00:18:8A:25:B2:5C server=CCTV
add address=172.30.1.21 mac-address=00:18:8A:25:B2:6D server=CCTV
add address=172.30.1.22 mac-address=00:18:8A:25:B2:49 server=CCTV
add address=172.30.1.23 mac-address=00:18:8A:01:60:7C server=CCTV
add address=172.30.1.24 mac-address=00:18:8A:24:F2:FD server=CCTV
add address=172.30.1.25 mac-address=D4:E8:53:AC:A2:04 server=CCTV
add address=172.30.1.26 mac-address=00:18:8A:25:CD:6D server=CCTV
add address=172.30.1.27 mac-address=00:18:8A:24:B4:9D server=CCTV
add address=172.30.1.28 mac-address=00:18:8A:25:CD:53 server=CCTV
add address=172.30.1.29 mac-address=00:18:8A:25:CD:67 server=CCTV
add address=172.30.1.30 mac-address=00:18:8A:24:F2:F2 server=CCTV
add address=172.30.1.31 mac-address=00:18:8A:24:F3:00 server=CCTV
add address=172.30.1.32 mac-address=00:18:8A:24:F3:01 server=CCTV
add address=172.30.1.33 mac-address=00:18:8A:24:F3:03 server=CCTV
add address=172.30.1.34 mac-address=00:18:8A:24:F2:FE server=CCTV
add address=172.30.1.35 mac-address=D4:E8:53:AC:9B:57 server=CCTV
add address=172.30.1.36 mac-address=D4:E8:53:A5:1A:17 server=CCTV
add address=172.30.1.37 mac-address=00:18:8A:25:C7:53 server=CCTV
add address=172.30.1.38 mac-address=00:18:8A:25:CD:60 server=CCTV
add address=172.30.1.39 mac-address=00:18:8A:25:CD:5E server=CCTV
add address=172.30.1.40 mac-address=00:18:8A:25:CD:5C server=CCTV
add address=172.30.1.41 mac-address=00:18:8A:25:CD:5F server=CCTV
add address=172.30.1.42 mac-address=00:18:8A:25:C7:54 server=CCTV
add address=172.30.1.43 mac-address=00:18:8A:25:CD:5D server=CCTV
add address=172.30.1.44 mac-address=00:18:8A:25:CD:58 server=CCTV
add address=172.30.1.45 mac-address=00:18:8A:24:F2:F7 server=CCTV
add address=172.30.1.46 mac-address=00:18:8A:25:C7:51 server=CCTV
add address=172.30.1.47 mac-address=00:18:8A:25:CD:5A server=CCTV
add address=172.30.1.48 mac-address=00:18:8A:25:B2:55 server=CCTV
add address=172.30.1.49 mac-address=00:18:8A:25:CD:64 server=CCTV
add address=172.30.1.50 mac-address=00:18:8A:25:B2:60 server=CCTV
add address=172.30.1.51 mac-address=00:18:8A:25:B2:68 server=CCTV
add address=172.30.1.52 mac-address=00:18:8A:25:AE:A1 server=CCTV
add address=172.30.1.53 mac-address=00:18:8A:25:CD:71 server=CCTV
add address=172.30.1.54 mac-address=00:18:8A:25:CD:6E server=CCTV
add address=172.30.1.55 mac-address=00:18:8A:25:C7:4F server=CCTV
add address=172.30.1.56 mac-address=00:18:8A:25:B2:45 server=CCTV
add address=172.30.1.57 mac-address=00:18:8A:25:CD:68 server=CCTV
add address=172.30.1.58 mac-address=00:18:8A:25:CD:6F server=CCTV
add address=172.30.1.59 mac-address=00:18:8A:25:CD:69 server=CCTV
add address=172.30.1.60 mac-address=00:18:8A:25:CD:62 server=CCTV
add address=172.30.1.61 mac-address=00:18:8A:25:C7:4D server=CCTV
add address=172.30.1.62 mac-address=00:18:8A:25:CD:66 server=CCTV
add address=172.30.1.63 mac-address=00:18:8A:25:CD:65 server=CCTV
add address=172.30.1.64 mac-address=00:18:8A:25:C7:4C server=CCTV
add address=172.30.1.65 mac-address=00:18:8A:24:F2:F3 server=CCTV
add address=172.30.1.66 mac-address=00:18:8A:24:F2:F1 server=CCTV
add address=172.30.1.67 mac-address=00:18:8A:24:F2:F8 server=CCTV
add address=172.30.1.68 mac-address=00:18:8A:24:F2:F5 server=CCTV
add address=172.30.1.69 mac-address=BC:BA:C2:AC:3D:58 server=CCTV
add address=172.30.1.70 mac-address=00:18:8A:25:CD:70 server=CCTV
add address=172.30.1.71 mac-address=D4:E8:53:AC:9C:AF server=CCTV
add address=172.30.1.72 mac-address=00:18:8A:25:B2:6A server=CCTV
add address=172.30.1.73 mac-address=00:18:8A:25:B2:61 server=CCTV
add address=172.30.1.74 mac-address=00:0C:29:14:55:05 server=CCTV
add address=172.30.1.75 mac-address=00:18:8A:25:B2:46 server=CCTV
add address=172.30.1.76 mac-address=B0:83:FE:BA:1C:0E server=CCTV
add address=172.30.1.77 mac-address=C0:7B:BC:64:93:CD server=CCTV
add address=172.30.1.78 mac-address=00:E1:6D:94:95:EB server=CCTV
add address=172.30.1.79 mac-address=C0:7B:BC:64:90:80 server=CCTV
add address=172.30.1.80 mac-address=00:23:63:73:57:00 server=CCTV
add address=172.30.1.81 mac-address=00:23:63:69:1F:7B server=CCTV
add address=172.30.1.82 mac-address=00:23:63:69:1F:7A server=CCTV
add address=172.30.1.83 mac-address=00:23:63:69:1F:79 server=CCTV
add address=172.30.1.84 mac-address=00:23:63:69:1F:7D server=CCTV
add address=172.30.1.86 mac-address=1C:3B:F3:6A:D9:A9 server=CCTV
add address=172.30.1.90 mac-address=AC:84:C6:93:B6:5A server=CCTV
add address=172.30.1.91 mac-address=BC:AD:28:8E:0C:96 server=CCTV
add address=172.30.1.92 mac-address=20:4C:9E:9A:89:C1 server=CCTV
add address=172.30.1.93 mac-address=B0:83:FE:BC:F5:BD server=CCTV
add address=172.30.1.94 mac-address=BC:AD:28:E0:79:83 server=CCTV
add address=172.30.1.100 mac-address=78:24:AF:BD:0E:F2 server=CCTV
add address=172.30.1.101 mac-address=AC:9E:17:81:33:33 server=CCTV
add address=172.30.1.102 mac-address=20:47:47:34:EF:9E server=CCTV
add address=172.30.1.103 mac-address=20:47:47:3F:C0:41 server=CCTV
add address=172.30.1.156 mac-address=00:26:55:3E:2D:B6 server=CCTV
add address=172.30.1.157 mac-address=00:24:81:C5:C7:E8 server=CCTV
add address=172.30.1.158 mac-address=00:24:81:C2:17:AF server=CCTV
add address=172.30.1.160 mac-address=00:17:A4:1E:1E:E9 server=CCTV
add address=172.30.1.201 mac-address=00:0C:30:DF:73:80 server=CCTV
add address=172.30.1.202 mac-address=00:0C:30:DF:7B:C0 server=CCTV
add address=172.30.1.203 mac-address=00:0C:30:DF:87:40 server=CCTV
add address=172.30.1.204 mac-address=E8:DE:27:ED:C1:02 server=CCTV
add address=172.30.1.205 mac-address=00:0C:30:DF:74:C0 server=CCTV
add address=172.30.1.206 mac-address=00:0F:34:C5:33:00 server=CCTV
add address=172.30.1.207 mac-address=F0:25:72:84:58:C1 server=CCTV
add address=172.30.1.208 mac-address=00:11:21:EF:B1:00 server=CCTV
add address=172.30.1.209 mac-address=00:12:43:35:F0:00 server=CCTV
add address=172.30.1.210 mac-address=00:1E:F6:EB:69:C0 server=CCTV
add address=172.30.1.211 mac-address=CC:32:E5:59:EC:B2 server=CCTV
add address=172.30.1.212 mac-address=00:0B:BE:74:F4:40 server=CCTV
add address=172.30.1.213 mac-address=00:1B:0D:7A:68:00 server=CCTV
add address=172.30.1.214 mac-address=00:17:5A:1C:DA:00 server=CCTV
add address=172.30.1.215 mac-address=00:1E:F6:EB:4D:40 server=CCTV
add address=172.30.1.218 mac-address=00:0B:46:38:2B:C0 server=CCTV
add address=172.30.1.219 mac-address=00:15:2B:46:79:00 server=CCTV
add address=172.30.1.221 mac-address=AC:84:C6:93:B1:F4 server=CCTV
add address=172.30.1.223 mac-address=E8:DE:27:D8:35:27 server=CCTV
add address=172.30.2.1 mac-address=58:03:FB:C1:15:36 server=CCTV
add address=172.30.2.2 mac-address=58:03:FB:C1:14:DD server=CCTV
add address=172.30.2.3 mac-address=58:03:FB:1A:7C:6A server=CCTV
add address=172.30.2.5 mac-address=68:6D:BC:DC:1B:DB server=CCTV
add address=172.30.2.6 mac-address=58:03:FB:C1:15:54 server=CCTV
add address=172.30.2.7 mac-address=58:03:FB:01:81:AF server=CCTV
add address=172.30.2.8 mac-address=F8:4D:FC:F3:EA:CD server=CCTV
add address=172.30.2.9 mac-address=F8:4D:FC:F3:EA:E5 server=CCTV
add address=172.30.2.10 mac-address=44:47:CC:C9:0B:5B server=CCTV
add address=172.30.2.11 mac-address=98:8B:0A:DE:03:FE server=CCTV
add address=172.30.2.12 mac-address=F8:4D:FC:F3:EA:D6 server=CCTV
add address=172.30.2.13 mac-address=58:03:FB:C1:DF:86 server=CCTV
add address=172.30.2.15 mac-address=98:8B:0A:D1:4D:5E server=CCTV
add address=172.30.2.16 mac-address=58:03:FB:C1:15:39 server=CCTV
add address=172.30.2.17 mac-address=68:6D:BC:D2:99:4F server=CCTV
add address=172.30.2.18 mac-address=68:6D:BC:D2:99:58 server=CCTV
add address=172.30.2.19 mac-address=98:DF:82:D0:8D:95 server=CCTV
add address=172.30.2.65 mac-address=AC:84:C6:93:B2:D6 server=CCTV
add address=172.30.2.66 mac-address=D8:47:32:9E:87:5A server=CCTV
add address=172.30.2.67 mac-address=D8:47:32:9E:87:59 server=CCTV
add address=172.30.2.68 mac-address=D8:47:32:31:01:F5 server=CCTV
add address=172.30.2.101 mac-address=44:47:CC:6B:03:21 server=CCTV
add address=172.30.2.102 mac-address=44:47:CC:6B:02:EF server=CCTV
add address=172.30.2.103 mac-address=44:47:CC:6B:02:D7 server=CCTV
add address=172.30.2.104 mac-address=44:47:CC:6B:02:FD server=CCTV
add address=172.30.2.105 mac-address=44:47:CC:6B:03:1D server=CCTV
add address=172.30.2.106 mac-address=44:47:CC:6B:02:F5 server=CCTV
add address=172.30.2.107 mac-address=44:47:CC:6B:02:D9 server=CCTV
add address=172.30.2.108 mac-address=44:47:CC:6B:02:F4 server=CCTV
add address=172.30.2.109 mac-address=44:47:CC:6B:02:D6 server=CCTV
add address=172.30.2.110 mac-address=44:47:CC:6B:02:FA server=CCTV
add address=172.30.2.111 mac-address=44:47:CC:6B:03:02 server=CCTV
add address=172.30.2.112 mac-address=44:47:CC:6B:02:FC server=CCTV
add address=172.30.2.113 mac-address=44:47:CC:6B:03:24 server=CCTV
add address=172.30.2.114 mac-address=44:47:CC:6B:03:25 server=CCTV
add address=172.30.2.115 mac-address=44:47:CC:6B:02:F0 server=CCTV
add address=172.30.2.116 mac-address=44:47:CC:6B:03:1A server=CCTV
add address=172.30.2.117 mac-address=44:47:CC:6B:03:23 server=CCTV
add address=172.30.2.118 mac-address=44:47:CC:6B:03:05 server=CCTV
add address=172.30.2.119 mac-address=44:47:CC:6B:02:D3 server=CCTV
add address=172.30.2.120 mac-address=98:8B:0A:76:D4:EB server=CCTV
add address=172.30.2.121 mac-address=98:8B:0A:76:D4:DF server=CCTV
add address=172.30.2.122 mac-address=98:8B:0A:76:D5:00 server=CCTV
add address=172.30.2.123 mac-address=98:8B:0A:76:D4:DB server=CCTV
add address=172.30.2.124 mac-address=98:8B:0A:76:D5:3A server=CCTV
add address=172.30.2.125 mac-address=68:6D:BC:03:84:47 server=CCTV
add address=172.30.2.126 mac-address=68:6D:BC:03:84:2D server=CCTV
add address=172.30.2.127 mac-address=98:8B:0A:76:D4:E1 server=CCTV
add address=172.30.2.128 mac-address=68:6D:BC:03:84:5B server=CCTV
add address=172.30.2.129 mac-address=68:6D:BC:03:84:78 server=CCTV
add address=172.30.2.130 mac-address=68:6D:BC:03:84:86 server=CCTV
add address=172.30.2.131 mac-address=98:8B:0A:76:D5:44 server=CCTV
add address=172.30.2.132 mac-address=98:8B:0A:76:D4:EE server=CCTV
add address=172.30.2.133 mac-address=98:8B:0A:76:D4:EC server=CCTV
add address=172.30.2.134 mac-address=68:6D:BC:03:84:40 server=CCTV
add address=172.30.2.135 mac-address=98:8B:0A:76:D4:A1 server=CCTV
add address=172.30.2.136 mac-address=98:8B:0A:76:D4:E3 server=CCTV
add address=172.30.2.137 mac-address=98:8B:0A:76:D4:AC server=CCTV
add address=172.30.2.138 mac-address=98:8B:0A:76:D5:46 server=CCTV
add address=172.30.2.139 mac-address=98:8B:0A:76:D4:D2 server=CCTV
add address=172.30.2.140 mac-address=98:8B:0A:76:D4:E4 server=CCTV
add address=172.30.2.141 mac-address=98:8B:0A:76:D4:DE server=CCTV
add address=172.30.2.142 mac-address=98:8B:0A:76:D5:1C server=CCTV
add address=172.30.2.143 mac-address=68:6D:BC:03:84:29 server=CCTV
add address=172.30.2.144 mac-address=68:6D:BC:03:84:68 server=CCTV
add address=172.30.2.145 mac-address=68:6D:BC:03:84:7F server=CCTV
add address=172.30.2.146 mac-address=68:6D:BC:03:84:58 server=CCTV
add address=172.30.2.147 mac-address=68:6D:BC:03:84:34 server=CCTV
add address=172.30.2.148 mac-address=68:6D:BC:03:84:80 server=CCTV
add address=172.30.2.149 mac-address=68:6D:BC:03:84:72 server=CCTV
add address=172.30.2.150 mac-address=68:6D:BC:03:84:53 server=CCTV
add address=172.30.2.151 mac-address=68:6D:BC:03:84:3E server=CCTV
add address=172.30.2.152 mac-address=68:6D:BC:03:84:4A server=CCTV
add address=172.30.2.153 mac-address=68:6D:BC:03:84:55 server=CCTV
add address=172.30.2.154 mac-address=68:6D:BC:03:84:26 server=CCTV
add address=172.30.2.155 mac-address=98:8B:0A:76:D4:CE server=CCTV
add address=172.30.2.156 mac-address=68:6D:BC:03:84:36 server=CCTV
add address=172.30.2.157 mac-address=68:6D:BC:03:84:2B server=CCTV
add address=172.30.2.158 mac-address=98:8B:0A:76:D5:43 server=CCTV
add address=172.30.2.159 mac-address=68:6D:BC:03:84:27 server=CCTV
add address=172.30.2.160 mac-address=84:9A:40:CD:B3:6F server=CCTV
add address=172.30.2.161 mac-address=68:6D:BC:03:84:54 server=CCTV
add address=172.30.2.162 mac-address=68:6D:BC:03:84:42 server=CCTV
add address=172.30.2.163 mac-address=98:8B:0A:76:D4:EA server=CCTV
add address=172.30.2.164 mac-address=68:6D:BC:03:84:37 server=CCTV
add address=172.30.2.165 mac-address=98:8B:0A:76:D4:F7 server=CCTV
add address=172.30.2.166 mac-address=98:8B:0A:76:D5:1D server=CCTV
add address=172.30.2.167 mac-address=58:03:FB:61:DD:A2 server=CCTV
add address=172.30.2.168 mac-address=80:7C:62:8B:80:85 server=CCTV
add address=172.30.2.169 mac-address=58:03:FB:61:DD:B3 server=CCTV
add address=172.30.2.170 mac-address=98:8B:0A:76:D5:2D server=CCTV
add address=172.30.2.171 mac-address=68:6D:BC:03:84:7A server=CCTV
add address=172.30.2.172 mac-address=68:6D:BC:03:84:83 server=CCTV
add address=172.30.2.173 mac-address=BC:BA:C2:20:F9:FD server=CCTV
add address=172.30.2.174 mac-address=BC:BA:C2:20:F9:FB server=CCTV
add address=172.30.2.175 mac-address=BC:BA:C2:20:FA:04 server=CCTV
add address=172.30.2.176 mac-address=BC:BA:C2:20:F9:D3 server=CCTV
add address=172.30.2.177 mac-address=BC:BA:C2:20:F9:B7 server=CCTV
add address=172.30.2.178 mac-address=BC:BA:C2:20:F9:E0 server=CCTV
add address=172.30.2.179 mac-address=BC:BA:C2:20:F9:E1 server=CCTV
add address=172.30.2.180 mac-address=BC:BA:C2:20:FA:0B server=CCTV
add address=172.30.2.181 mac-address=BC:BA:C2:20:FA:0E server=CCTV
add address=172.30.2.182 mac-address=BC:BA:C2:20:FA:10 server=CCTV
add address=172.30.2.183 mac-address=BC:BA:C2:70:A0:E5 server=CCTV
add address=172.30.2.184 mac-address=BC:BA:C2:70:A0:B0 server=CCTV
add address=172.30.2.185 mac-address=BC:BA:C2:70:A0:E9 server=CCTV
add address=172.30.2.186 mac-address=BC:BA:C2:20:FA:0C server=CCTV
add address=172.30.2.187 mac-address=BC:BA:C2:20:F9:BE server=CCTV
add address=172.30.2.188 mac-address=BC:BA:C2:20:F9:C6 server=CCTV
add address=172.30.2.189 mac-address=BC:BA:C2:20:FA:0F server=CCTV
add address=172.30.2.190 mac-address=BC:BA:C2:20:FA:0A server=CCTV
add address=172.30.2.191 mac-address=BC:BA:C2:20:F9:C4 server=CCTV
add address=172.30.2.192 mac-address=BC:BA:C2:20:FA:06 server=CCTV
add address=172.30.2.193 mac-address=BC:BA:C2:20:F9:CE server=CCTV
add address=172.30.2.194 mac-address=BC:BA:C2:20:F9:CF server=CCTV
add address=172.30.2.195 mac-address=BC:BA:C2:20:F9:FC server=CCTV
add address=172.30.2.196 mac-address=BC:BA:C2:20:F9:D9 server=CCTV
add address=172.30.2.197 mac-address=BC:BA:C2:20:F9:FF server=CCTV
add address=172.30.2.198 mac-address=84:9A:40:FD:A4:55 server=CCTV
add address=172.30.2.199 mac-address=84:9A:40:8A:86:8D server=CCTV
add address=172.30.2.200 mac-address=64:F2:FB:18:0F:39 server=CCTV
add address=172.30.2.201 mac-address=64:F2:FB:18:0F:4C server=CCTV
add address=172.30.2.202 mac-address=64:F2:FB:18:06:D6 server=CCTV
add address=172.30.2.203 mac-address=64:F2:FB:18:07:20 server=CCTV
add address=172.30.2.204 mac-address=64:F2:FB:18:0E:E7 server=CCTV
add address=172.30.2.205 mac-address=64:F2:FB:18:06:B0 server=CCTV
add address=172.30.2.206 mac-address=64:F2:FB:18:0E:44 server=CCTV
add address=172.30.2.207 mac-address=64:F2:FB:18:06:95 server=CCTV
add address=172.30.2.208 mac-address=64:F2:FB:18:0F:94 server=CCTV
add address=172.30.2.209 mac-address=64:F2:FB:18:07:56 server=CCTV
add address=172.30.2.210 mac-address=84:9A:40:CB:F6:FF server=CCTV
add address=172.30.2.211 mac-address=84:9A:40:CB:F7:11 server=CCTV
add address=172.30.2.212 mac-address=BC:BA:C2:38:E9:43 server=CCTV
add address=172.30.2.213 mac-address=84:9A:40:CD:B2:6A server=CCTV
add address=172.30.2.214 mac-address=44:47:CC:0E:7B:C1 server=CCTV
add address=172.30.2.215 mac-address=68:6D:BC:B3:1A:09 server=CCTV
add address=172.30.2.216 mac-address=24:28:FD:D9:17:CF server=CCTV
add address=172.30.2.217 mac-address=4C:F5:DC:BE:2F:D8 server=CCTV
add address=172.30.2.218 mac-address=24:28:FD:D9:17:E3 server=CCTV
add address=172.30.2.219 mac-address=4C:F5:DC:BE:2F:DF server=CCTV
add address=172.30.2.220 mac-address=D4:E8:53:AC:9B:7F server=CCTV
add address=172.30.2.221 mac-address=D4:E8:53:AC:9B:7C server=CCTV
add address=172.16.0.46 mac-address=E8:DE:27:ED:C1:47 server=LAN
add address=172.16.0.96 mac-address=00:13:57:01:18:1B server=LAN
add address=172.16.0.121 mac-address=E8:DE:27:D8:34:C8 server=LAN
add address=172.16.0.201 mac-address=00:13:57:03:D2:EC server=LAN
add address=172.16.0.253 mac-address=00:13:57:03:CE:EF server=LAN
add address=172.16.0.255 mac-address=00:13:57:03:CE:E8 server=LAN
add address=172.16.1.65 mac-address=00:13:57:03:CE:EB server=LAN
add address=172.16.1.200 mac-address=00:23:24:E7:34:1C server=LAN
add address=172.16.2.153 mac-address=B0:4E:26:EA:D9:1D server=LAN
/ip dhcp-server network
add address=172.16.0.0/22 dhcp-option=ceres dns-server=172.16.1.29 gateway=\
    172.16.1.29 ntp-server=172.16.1.29
add address=172.30.0.0/22 dns-server=172.16.1.30 gateway=172.30.1.254 \
    ntp-server=172.16.1.30
/ip dns
set allow-remote-requests=yes servers=202.152.0.2,202.152.5.36
/ip dns static
add address=34.87.119.159 name=apex.ceresnl.com
add address=172.16.100.11 name=apexdemo.ceresnl.com
add address=172.16.202.32 name=backupserver2.delfilimited.com
add address=172.16.100.11 name=ceres.co.id
add address=172.16.100.11 name=www.ceres.co.id
add address=172.16.51.68 name=bi.ceresnl.com
add address=172.16.100.11 name=dev.ceresnl.com
add address=172.16.1.4 name=imap.ceresnl.com
add address=34.87.119.159 name=k2.ceresnl.com
add address=172.16.102.100 name=k2dev.ceresnl.com
add address=172.16.1.4 name=mail.ceresnl.com
add address=172.16.1.4 name=mailmgr.ceresnl.com
add address=34.87.119.159 disabled=yes name=mss.ceresnl.com
add address=172.16.1.4 name=mx.ceresnl.com
add address=182.23.9.210 name=mx2.ceresnl.com
add address=172.16.1.30 name=ns1.ceresnl.com
add address=34.87.119.159 name=order.ceresnl.com
add address=172.16.1.4 name=pop3.ceresnl.com
add address=172.16.1.4 name=portal.ceresnl.com
add address=172.16.1.4 name=smtp.ceresnl.com
add address=172.16.100.11 name=web.ceresnl.com
add address=172.16.1.4 name=www.ceresnl.com
add address=172.16.48.18 name=imap.ceres-pt.com
add address=172.16.48.18 name=mail.ceres-pt.com
add address=172.16.48.18 name=mailmgr.ceres-pt.com
add address=172.16.48.18 name=mx.ceres-pt.com
add address=172.16.50.81 name=ns1.ceres-pt.com
add address=172.16.48.1 name=ns2.ceres-pt.com
add address=172.16.1.22 name=orange.ceres-pt.com
add address=172.16.48.18 name=pop3.ceres-pt.com
add address=172.16.48.18 name=smtp.ceres-pt.com
add address=172.16.48.18 name=webmail.ceres-pt.com
add address=172.16.1.50 name=apexone.delfi-chocolate.com
add address=172.16.0.22 name=avserver.delfi-chocolate.com
add address=172.16.1.5 name=bcaclient.delfi-chocolate.com
add address=172.16.0.24 name=ceres.delfi-chocolate.com
add address=172.16.2.9 name=ceresprod.delfi-chocolate.com
add address=172.16.100.19 name=crstest.delfi-chocolate.com
add address=172.16.2.11 name=dw.delfi-chocolate.com
add address=172.16.200.11 name=dwstby.delfi-chocolate.com
add address=172.16.2.12 name=faiprod.delfi-chocolate.com
add address=172.16.1.22 name=hr.delfi-chocolate.com
add address=172.16.1.22 name=hr-prod.delfi-chocolate.com
add address=172.16.0.24 name=imap.delfi-chocolate.com
add address=172.16.0.24 name=mail.delfi-chocolate.com
add address=202.152.63.122 name=mail2.delfi-chocolate.com
add address=172.16.3.183 name=mailadmin.delfi-chocolate.com
add address=172.16.3.183 name=mailer.delfi-chocolate.com
add address=172.16.3.183 name=mailmgr.delfi-chocolate.com
add address=172.16.0.24 name=mx.delfi-chocolate.com
add address=172.16.0.24 name=mx2.delfi-chocolate.com
add address=172.16.1.3 name=ceres-smb.delfi-chocolate.com
add address=172.16.1.30 name=ns1.delfi-chocolate.com
add address=172.16.1.30 name=ntp.delfi-chocolate.com
add address=172.16.1.23 name=optimus.delfi-chocolate.com
add address=172.16.1.22 name=orange.delfi-chocolate.com
add address=172.16.0.24 name=pop3.delfi-chocolate.com
add address=172.16.0.24 name=smtp.delfi-chocolate.com
add address=172.16.0.24 name=webmail.delfi-chocolate.com
add address=202.152.63.122 name=www.delfi-chocolate.com
add address=182.23.32.3 name=wmftp.delfi-chocolate.com
add address=182.23.28.243 name=wmftp2.delfi-chocolate.com
add address=172.16.2.9 name=ceresprod.delficocoa.co.id
add address=172.16.1.2 name=imap.delficocoa.co.id
add address=172.16.1.2 name=mail.delficocoa.co.id
add address=172.16.1.27 name=mailtest.delficocoa.co.id
add address=172.16.1.27 name=manage.delficocoa.co.id
add address=172.16.1.2 name=mx.delficocoa.co.id
add address=172.16.1.22 name=orange.delficocoa.co.id
add address=172.16.1.2 name=smtp.delficocoa.co.id
add address=172.16.1.126 name=itasset.delficocoa.co.id
add address=202.152.63.123 name=www.delficocoa.co.id
add address=172.16.1.24 name=hr.delficocoa.co.id
add address=172.16.1.30 name=ns1.delficocoa.co.id
add address=172.16.100.2 name=glpi.delfilimited.com
add address=172.16.202.12 name=hw00001.delfilimited.com
add address=172.16.102.14 name=hw00001sr.delfilimited.com
add address=172.16.102.15 name=hw00002sr.delfilimited.com
add address=172.16.100.11 disabled=yes name=mss.ceresnl.com
add address=172.16.102.27 name=myhr.delfilimited.com
add address=172.16.202.34 name=myhrdev.delfilimited.com
add address=172.16.202.34 name=myhrqa.delfilimited.com
add address=172.16.100.11 name=nirwanalestari.co.id
add address=172.16.100.11 name=www.nirwanalestari.co.id
add address=172.16.102.100 name=apex-ws2016.nirwanalestari.com
add address=172.16.1.7 name=nlappserver.nirwanalestari.com
add address=172.16.1.9 name=nldbserver.nirwanalestari.com
add address=172.16.50.76 name=nlappstby.nirwanalestari.com
add address=172.16.50.77 name=nldbstby.nirwanalestari.com
add address=172.16.100.56 name=nlappclone.nirwanalestari.com
add address=172.16.100.15 name=nldbclone.nirwanalestari.com
add address=172.16.48.18 name=imap.nirwanalestari.com
add address=172.16.48.18 name=pop3.nirwanalestari.com
add address=172.16.48.18 name=smtp.nirwanalestari.com
add address=172.16.48.18 name=webmail.nirwanalestari.com
add address=172.16.48.18 name=mail.nirwanalestari.com
add address=182.23.37.203 name=mx.nirwanalestari.com
add address=182.23.37.203 name=mailserver.nirwanalestari.com
add address=172.16.48.18 name=mailmgr.nirwanalestari.com
add address=172.16.1.30 name=ns1.nirwanalestari.com
add address=172.16.1.22 name=orange.nirwanalestari.com
add address=182.23.32.3 name=wmftp.nirwanalestari.com
add address=182.23.28.243 name=wmftp2.nirwanalestari.com
add address=172.16.50.46 name=fileserver01.nl.com
add address=172.16.50.39 name=ndw.nl.com
add address=172.16.1.30 name=ns1.nl.com
add address=172.16.50.81 name=ns2.nl.com
add address=172.16.50.37 name=nsp.nl.com
add address=172.16.50.43 name=sesmsserver.nl.com
add address=172.16.51.62 name=webserver.nl.com
add address=172.16.50.38 name=zion.nl.com
add address=172.16.100.10 name=portal.delfilimited.com
add address=172.16.102.28 name=sapdep.delfilimited.com
add address=172.16.202.23 name=sapgwdevapp1.delfilimited.com
add address=172.16.102.29 name=sapgwprdapp1.delfilimited.com
add address=172.16.202.24 name=sapgwqasapp1.delfilimited.com
add address=172.16.202.34 name=sapprtdevapp1.delfilimited.com
add address=172.16.102.35 name=sapprtprdapp1.delfilimited.com
add address=172.16.102.27 name=saprouteprd.delfilimited.com
add address=172.16.202.21 name=saps4devapp1.delfilimited.com
add address=172.16.102.28 name=saps4prdapp1.delfilimited.com
add address=172.16.102.29 name=saps4prdapp2.delfilimited.com
add address=172.16.202.22 name=saps4qasapp1.delfilimited.com
add address=172.16.202.26 name=saps4sbxapp1.delfilimited.com
add address=172.16.102.33 name=sapsolprdapp1.delfilimited.com
add address=172.16.100.11 name=selamat.co.id
add address=172.16.100.11 name=www.selamat.co.id
add address=172.16.100.11 name=sesms.ceresnl.com
add address=172.16.100.11 name=silverqueen.co.id
add address=172.16.100.11 name=www.silverqueen.co.id
add address=172.16.102.40 name=vhanaprd1.delfilimited.com
add address=172.16.134.184 name=vhdfidpdwd01.sap.delfilimited.com
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=forward comment="BLOK PUBLIK KE PRIVATE" disabled=yes \
    dst-address-list=private src-address-list=!private
add action=drop chain=output disabled=yes dst-address-list=private \
    src-address-list=!private
add action=accept chain=forward comment="ALLOW KE NIRWANA" dst-address=\
    172.16.48.0/20 src-address=172.16.1.126
add action=accept chain=forward dst-address=172.16.48.0/20 src-address=\
    172.16.1.3
add action=accept chain=forward dst-address=172.16.48.0/20 src-address=\
    172.16.1.22
add action=accept chain=forward dst-address=172.16.48.0/20 src-address=\
    172.16.0.19
add action=accept chain=forward dst-address=172.16.48.0/20 src-address=\
    172.16.3.101
add action=accept chain=forward dst-address=172.16.52.141 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.60.208 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.52.141 src-address=\
    172.16.240.0/20
add action=accept chain=forward dst-address=172.16.60.208 src-address=\
    172.16.240.0/20
add action=accept chain=forward dst-address=172.16.50.81 src-address=\
    172.16.1.30
add action=accept chain=forward dst-address=172.16.50.40 src-address=\
    172.16.1.30
add action=accept chain=forward dst-address=172.16.50.38 src-address=\
    172.16.1.30
add action=accept chain=forward comment="Allow access to this IPs (Oracle)" \
    dst-address=172.16.50.73 src-address=172.16.0.0/22
add action=accept chain=forward dst-address=172.16.50.74 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.50.75 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.50.76 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.50.77 src-address=\
    172.16.0.0/22
add action=accept chain=forward dst-address=172.16.50.78 src-address=\
    172.16.0.0/22
add action=drop chain=forward comment="BLOK KE NIRWANA" dst-address=\
    172.16.48.0/20 src-address=172.16.0.0/22
add action=drop chain=output dst-address=172.16.48.0/20 src-address=\
    172.16.0.0/22
/ip firewall mangle
add action=mark-connection chain=prerouting comment="CONN JATILUHUR" \
    dst-address=172.16.100.0/22 new-connection-mark=conn-jah passthrough=yes \
    src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.128.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.200.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.1.7 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.1.9 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.2.9 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.2.11 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.2.12 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address=172.16.100.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.128.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.200.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.1.7 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.1.9 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.2.9 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.2.11 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.2.12 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.240.0/20
add action=mark-packet chain=prerouting connection-mark=conn-jah \
    new-packet-mark=mark-jah passthrough=no
add action=mark-connection chain=prerouting comment="CONN INTERNET" \
    dst-address-list=!private new-connection-mark=conn-internet passthrough=\
    yes src-address=172.16.0.0/22
add action=mark-connection chain=prerouting dst-address-list=!private \
    new-connection-mark=conn-internet passthrough=yes src-address=\
    172.16.240.0/20
add action=mark-connection chain=prerouting dst-address-list=!private \
    new-connection-mark=conn-internet passthrough=yes src-address=\
    172.30.0.0/22
add action=mark-packet chain=prerouting connection-mark=conn-internet \
    new-packet-mark=mark-internet passthrough=no
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip hotspot ip-binding
add address=192.168.1.2 comment="Lantai 1 Indoor" disabled=yes mac-address=\
    88:DC:96:02:D8:64 to-address=192.168.1.2 type=bypassed
add address=192.168.1.4 comment="Lantai 1 Kadis" disabled=yes mac-address=\
    88:DC:96:02:D8:62 to-address=192.168.1.4 type=bypassed
add address=192.168.1.5 comment="Lantai 2 Program Keuangan" disabled=yes \
    mac-address=88:DC:96:02:D8:66 to-address=192.168.1.5 type=bypassed
add address=192.168.1.6 comment="Lantai 2 Area TV" disabled=yes mac-address=\
    88:DC:96:14:5F:24 to-address=192.168.1.6 type=bypassed
add address=192.168.1.7 comment="Lantai 3_1" disabled=yes mac-address=\
    88:DC:96:14:5F:26 to-address=192.168.1.7 type=bypassed
add address=192.168.1.8 comment="Lantai 3_2" disabled=yes mac-address=\
    88:DC:96:14:5F:22 to-address=192.168.1.8 type=bypassed
add address=192.168.1.9 comment="Lantai 1 Outdoor" disabled=yes mac-address=\
    88:DC:96:02:D8:58 to-address=192.168.1.9 type=bypassed
add address=192.168.1.10 comment="Lantai 2 Umpeg" disabled=yes mac-address=\
    88:DC:96:42:3A:5A to-address=192.168.1.10 type=bypassed
add address=192.168.1.11 comment="Lantai 2 Kantin" disabled=yes mac-address=\
    88:DC:96:42:3A:94 to-address=192.168.1.11 type=bypassed
add address=192.168.1.12 comment="Lantai 3 Mushola" disabled=yes mac-address=\
    88:DC:96:37:B9:71 to-address=192.168.1.12 type=bypassed
add address=192.168.1.105 comment="NVR 3" disabled=yes to-address=\
    192.168.1.105 type=bypassed
add address=192.168.1.106 comment="NVR 2" disabled=yes to-address=\
    192.168.1.106 type=bypassed
add address=192.168.1.110 comment="Cam-Damkar BCC" disabled=yes to-address=\
    192.168.1.110 type=bypassed
add address=192.168.1.107 comment="NVR 1" disabled=yes to-address=\
    192.168.1.107 type=bypassed
add address=192.168.1.109 comment="Cam-Pintu Masuk" disabled=yes to-address=\
    192.168.1.109 type=bypassed
add address=192.168.1.111 comment="CAM 1" disabled=yes to-address=\
    192.168.1.111 type=bypassed
add address=192.168.1.112 comment="CAM 2" disabled=yes to-address=\
    192.168.1.112 type=bypassed
add address=192.168.1.113 comment="CAM 3" disabled=yes to-address=\
    192.168.1.113 type=bypassed
add address=192.168.1.114 comment="CAM 4" disabled=yes to-address=\
    192.168.1.114 type=bypassed
add address=192.168.1.115 comment="CAM 5" disabled=yes to-address=\
    192.168.1.115 type=bypassed
add address=192.168.1.116 comment="CAM 6" disabled=yes to-address=\
    192.168.1.116 type=bypassed
add comment="Mesin Absensi" mac-address=00:17:61:10:E6:EF type=bypassed
add comment="Komputer Kepegawaian" mac-address=60:02:92:62:05:B7 server=\
    hotspot1 type=bypassed
add comment="Papden-Laptop Asus" mac-address=74:2F:68:6E:88:B9 type=bypassed
add comment=Sitmul-Laptop mac-address=20:16:D8:52:BE:84 server=hotspot1 type=\
    bypassed
add comment=Sitmul-HP mac-address=B0:EE:45:78:8E:E5 server=hotspot1 type=\
    bypassed
add comment=Bintania-Laptop mac-address=30:10:B3:D4:1B:FB server=hotspot1 \
    type=bypassed
add comment="SIMDA BMD" mac-address=30:52:CB:2C:53:41 server=hotspot1 type=\
    bypassed
add comment=simdapenerimaan mac-address=80:A5:89:B3:0C:DF server=hotspot1 \
    type=bypassed
add comment="BCC Mini" mac-address=08:D4:0C:40:1A:96 server=hotspot1 type=\
    bypassed
add comment="AKHMAD SIJI" mac-address=00:30:18:CC:1B:C1 server=hotspot1 type=\
    bypassed
add comment="SERVER PAD" disabled=yes mac-address=00:E0:4C:51:20:37 server=\
    hotspot1 type=bypassed
add address=202.138.230.139 comment="mesin absen baru" to-address=\
    202.138.230.139 type=bypassed
add address=202.138.230.141 to-address=202.138.230.141 type=bypassed
add comment="pc sekretariat" mac-address=00:23:54:C0:31:6A server=hotspot1 \
    type=bypassed
add comment="akung laptop asus" mac-address=F0:03:8C:29:B7:FB server=hotspot1 \
    type=bypassed
add comment="noonk iphone" mac-address=18:AF:61:C3:50:68 server=hotspot1 \
    type=bypassed
add comment="vivo mpap" mac-address=70:78:8B:CB:A5:3F server=hotspot1 type=\
    bypassed
add comment="mardi samsung new" mac-address=0C:A8:A7:1E:F6:42 server=hotspot1 \
    type=bypassed
add comment="alfi sekre hp" mac-address=8C:BE:BE:14:F3:9B server=hotspot1 \
    type=bypassed
add comment="server retribusi pad" disabled=yes mac-address=60:02:92:61:F8:B4 \
    server=hotspot1 type=bypassed
add comment="ahmad orok" mac-address=28:83:35:84:1F:08 server=hotspot1 type=\
    bypassed
add comment="mesin aben baru" mac-address=00:17:61:11:7B:71 type=bypassed
add comment="komp program 1" mac-address=90:32:4B:20:34:F5 server=hotspot1 \
    type=bypassed
add comment="KadiskarPB Dair" mac-address=E8:50:8B:BB:29:20 server=hotspot1 \
    type=bypassed
add comment="kadishp1 dair" mac-address=28:83:35:84:8A:90 server=hotspot1 \
    type=bypassed
add comment="komp dcc mini" mac-address=00:25:AB:90:46:8C server=hotspot1 \
    type=bypassed
add address=202.138.230.142 to-address=202.138.230.142 type=bypassed
add address=202.138.230.138 to-address=202.138.230.138 type=bypassed
add comment="laptop jae" mac-address=28:E3:47:9C:CC:F0 server=hotspot1 type=\
    bypassed
add comment="ahmad absen" mac-address=00:E0:4C:4C:23:FB server=hotspot1 type=\
    bypassed
add comment="zae lenovo laptop" mac-address=F8:A2:D6:EC:09:2D server=hotspot1 \
    type=bypassed
add address=192.168.1.11 mac-address=88:DC:96:42:3A:94 server=hotspot1 \
    to-address=192.168.1.11
add comment="laptop lenovo hendra new" mac-address=F8:A2:D6:EB:32:5D server=\
    hotspot1 type=bypassed
add address=192.168.1.141 mac-address=20:1A:06:FF:34:BD to-address=\
    192.168.1.141 type=bypassed
add comment="cori i7 absen umpeg" mac-address=04:0E:3C:8A:BE:2D server=\
    hotspot1 type=bypassed
add comment="manda hp kantin" mac-address=06:A2:D2:B1:34:D2 server=hotspot1 \
    type=bypassed
add comment="laptop irwan kantin manda" mac-address=E8:2A:44:10:7A:CD server=\
    hotspot1 type=bypassed
add comment="kantin manda" mac-address=3C:B6:B7:4F:3C:5B server=hotspot1 \
    type=bypassed
add comment="kw diki ob" mac-address=58:C6:F0:45:8B:47 server=hotspot1 type=\
    bypassed
add comment="tono ton 1 " mac-address=68:BF:C4:8D:02:74 server=hotspot1 type=\
    bypassed
add comment="nuel hp samsung" mac-address=C0:87:EB:8B:FA:83 server=hotspot1 \
    type=bypassed
add comment="hadiw ob jaya" mac-address=98:C8:B8:80:D6:E9 server=hotspot1 \
    type=bypassed
add comment="hp keu liti" mac-address=5C:87:9C:53:35:FE server=hotspot1 type=\
    bypassed
add comment="hp am musingin" mac-address=A4:D9:90:63:35:A3 server=hotspot1 \
    type=bypassed
add comment="hp komp umpeg" mac-address=5C:87:9C:53:46:D4 server=hotspot1 \
    type=bypassed
add comment="carles gudang" mac-address=20:F7:7C:02:75:0F server=hotspot1 \
    type=bypassed
add comment="sitmul hp samsung" mac-address=C0:87:EB:9B:9D:93 server=hotspot1 \
    type=bypassed
add comment="ncus hp oppo" mac-address=7A:24:76:3A:4B:DB server=hotspot1 \
    type=bypassed
add comment="asud kupt utara" mac-address=0C:A8:A7:62:41:AC server=hotspot1 \
    type=bypassed
add comment="lapto kabid dalop" mac-address=84:A9:3E:04:B8:B6 server=hotspot1 \
    type=bypassed
add address=192.168.1.107 comment="Ruijie AP R.Sekretariat" mac-address=\
    80:05:88:11:F0:F1 server=hotspot1 to-address=192.168.1.107 type=bypassed
add address=192.168.1.5 comment="Ruijie AP Keuangan" mac-address=\
    00:74:9C:D9:F2:29 server=hotspot1 to-address=192.168.1.5 type=bypassed
add address=192.168.1.227 comment="Ruijie AP Bagum Kepegawaian" mac-address=\
    00:74:9C:EC:B9:CE server=hotspot1 to-address=192.168.1.227 type=bypassed
add address=192.168.1.194 comment="Ruijie AP LT2 Dulop" mac-address=\
    80:05:88:11:FD:2D server=hotspot1 to-address=192.168.1.194 type=bypassed
add address=192.168.1.20 comment="Rujiie AP LT3 Sartek" mac-address=\
    80:05:88:11:FC:FD server=hotspot1 to-address=192.168.1.20 type=bypassed
add address=192.168.1.202 comment="Rujie AP Area Kantin" mac-address=\
    80:05:88:11:FC:E1 server=hotspot1 to-address=192.168.1.202 type=bypassed
add address=192.168.1.106 comment="Rujiie AP LT3 Penceg" mac-address=\
    00:74:9C:D9:ED:AD server=hotspot1 to-address=192.168.1.106 type=bypassed
add address=192.168.1.195 comment="Ruijie AP Area Lapang" mac-address=\
    80:05:88:11:F0:FD server=hotspot1 to-address=192.168.1.195 type=bypassed
add address=192.168.1.186 comment="Ruijie AP Koridor Pleton" mac-address=\
    00:74:9C:EC:22:5B server=hotspot1 to-address=192.168.1.186 type=bypassed
add comment="hotspot burhan" mac-address=C8:3A:35:32:68:60 server=hotspot1 \
    type=bypassed
add comment="hp papih sholihudin" mac-address=70:78:8B:CB:5C:FF server=\
    hotspot1 type=bypassed
add comment="intan hp xiaomi" mac-address=7C:2A:DB:B4:22:EE server=hotspot1 \
    type=bypassed
add address=192.168.1.181 mac-address=56:9D:0D:40:E6:63 server=hotspot1 \
    to-address=192.168.1.181 type=bypassed
add mac-address=08:7F:98:BE:EF:27
add comment="Akung Laptop Asus New" mac-address=90:CC:DF:C7:A5:D8 server=\
    hotspot1 type=bypassed
add comment="asri oppo reno 5" mac-address=52:7C:CD:57:9A:B5 server=hotspot1 \
    type=bypassed
add comment="denih sungsang ton2" mac-address=68:BF:C4:E1:6C:76 server=\
    hotspot1 type=bypassed
add comment="ahong andri ton3" mac-address=8C:BE:BE:15:0C:FD server=hotspot1 \
    type=bypassed
add comment="hp santi indriyani luhbin,." mac-address=B8:C7:4A:A8:DD:0B \
    server=hotspot1 type=bypassed
add comment="Komp HP BMD Gudang Igun" mac-address=B4:B6:86:D9:D9:BD server=\
    hotspot1 type=bypassed
add address=192.168.1.12 mac-address=88:DC:96:37:B9:71 server=hotspot1 \
    to-address=192.168.1.12 type=bypassed
add comment="jerry hp oppo A5 Ton 2" mac-address=F6:65:A7:FE:29:E1 server=\
    hotspot1 type=bypassed
add comment="nugi gudang" mac-address=32:89:27:40:48:01 server=hotspot1 type=\
    bypassed
add comment="komp alpi sekretariat" mac-address=5C:87:9C:53:36:35 server=\
    hotspot1 type=bypassed
add comment="Absensi Bagas Komp HP" mac-address=5C:87:9C:53:39:05 server=\
    hotspot1 type=bypassed
add comment="maudi komp prog" mac-address=D4:25:8B:BB:34:10 server=hotspot1 \
    type=bypassed
add comment="komp asus kasubag keu new" mac-address=C8:B2:9B:5D:11:BE server=\
    hotspot1 type=bypassed
add comment="HP kasubag keu" mac-address=38:B1:DB:EC:DB:0D server=hotspot1 \
    type=bypassed
add comment="oval iphone 5s" mac-address=DC:9B:9C:4B:88:8B server=hotspot1 \
    type=bypassed
add comment="PC Sleefdur SIMDA" mac-address=00:E0:B6:12:7E:0C server=hotspot1 \
    type=bypassed
add comment="rojak alfi hp new" mac-address=D2:24:DC:11:C6:EF server=hotspot1 \
    type=bypassed
add comment="komp HP Putri noonk" mac-address=5C:87:9C:53:36:08 server=\
    hotspot1 type=bypassed
add comment="adhi ton 2 sungsang" mac-address=A4:D9:90:66:05:03 server=\
    hotspot1 type=bypassed
add comment="Lebaran fitri HP sungsang" mac-address=56:01:6C:A4:DB:B9 type=\
    bypassed
add comment="kabid penceg new user" mac-address=30:52:CB:2C:51:E3 server=\
    hotspot1 type=bypassed
add comment="akung hp oppo A9" mac-address=5C:66:6C:E5:5D:39 server=hotspot1 \
    type=bypassed
add comment="adi st xiomi note 10S" mac-address=8C:D9:D6:FE:34:0C server=\
    hotspot1 type=bypassed
add comment="judo diki ob" mac-address=DA:CA:E9:2C:A6:84 server=hotspot1 \
    type=bypassed
add comment="sungsang sleefdur A50" mac-address=66:91:CB:60:E5:9B server=\
    hotspot1 type=bypassed
add comment="iphone 6S+ bobo" mac-address=EE:EF:17:63:DE:9C server=hotspot1 \
    type=bypassed
add comment="aspire acer ani " mac-address=64:27:37:0B:F9:53 server=hotspot1 \
    type=bypassed
add comment="hp bu er kepeg" mac-address=20:5E:F7:5B:2A:BE server=hotspot1 \
    type=bypassed
add comment="Komp Anton Hilman " mac-address=60:14:B3:CC:29:01 server=\
    hotspot1 type=bypassed
add comment="debay komp HP Hudang" mac-address=5C:87:9C:53:35:F4 server=\
    hotspot1 type=bypassed
add comment="Budi Kasubag Umpeg HP" mac-address=4E:74:EC:13:AD:9C server=\
    hotspot1 type=bypassed
add comment="ihpone 11 prointan " mac-address=7A:1D:0D:77:B9:00 server=\
    hotspot1 type=bypassed
add comment="nuel HP A52 kasubag artos" mac-address=5A:41:20:D2:54:BF server=\
    hotspot1 type=bypassed
add comment="ani hp samsung" mac-address=0C:A8:A7:56:91:5C server=hotspot1 \
    type=bypassed
add comment="asmul selatan" mac-address=E2:71:78:D6:6A:8E server=hotspot1 \
    type=bypassed
add comment="denih samsung2" mac-address=A0:CC:2B:AB:7B:05 server=hotspot1 \
    type=bypassed
add comment="Laptop Pa Sekdis Gun Gun" mac-address=40:EC:99:00:EA:6A server=\
    hotspot1 type=bypassed
add comment="Hp Bu Kabid Sarpras Riani" mac-address=22:0A:19:22:79:65 server=\
    hotspot1 type=bypassed
add comment="hp adem barat" mac-address=70:78:8B:CA:2F:9D server=hotspot1 \
    type=bypassed
add comment="calvin cikmunk" mac-address=6C:24:A6:E5:32:43 server=hotspot1 \
    type=bypassed
add comment="mul the sheep subag selatan" mac-address=0A:E1:9A:3D:85:4C \
    server=hotspot1 type=bypassed
add comment="Mayong Rimar HP New" mac-address=AE:E1:86:25:BF:86 server=\
    hotspot1 type=bypassed
add comment="Dika OB Pusat" mac-address=2C:D0:66:1E:19:EA server=hotspot1 \
    type=bypassed
add comment="Komp pa sekdis damkar" mac-address=48:5F:99:27:04:DD server=\
    hotspot1 type=bypassed
add comment="stb 1" mac-address=58:5F:F6:D3:98:D4 server=hotspot1 type=\
    bypassed
add comment=stb2 mac-address=D4:C1:C8:FE:A0:05 server=hotspot1 type=bypassed
add comment=stb2 mac-address=28:8C:B8:14:B0:03 server=hotspot1 type=bypassed
/ip hotspot user
add name=liti password=buled profile="Paket Boss" server=hotspot1
add name=roby password=darwan server=hotspot1
add name=umpeg password=sekre server=hotspot1
add name=nuri password=jul profile="Paket Boss" server=hotspot1
add name=thinta password=ink profile="Paket Boss" server=hotspot1
add name=atha password=halilintar server=hotspot1
add name=kuadrat password=ised profile="Paket Boss" server=hotspot1
add name=keu password=artos profile=PC server=hotspot1
add name=nuel password=toel server=hotspot1
add name=apuy password=kabid profile=PC server=hotspot1
add name=bobo password=sleefdur profile="Paket Boss" server=hotspot1
add name=hadi password=wijaya server=hotspot1
add name=anton password=hilman server=hotspot1
add name=alpi password=sekre server=hotspot1
add name=FO password=front profile=PC server=hotspot1
add name=sekdis password=sekre
add name=iwan password=carles server=hotspot1
add name=debay password=orok profile=PC server=hotspot1
add name=wil password=luhbin profile=PC server=hotspot1
add name=hendi password=payu profile="Paket Boss" server=hotspot1
add name=odonk password=pb profile="Paket Boss" server=hotspot1
add name=hpumpeg password=new profile="Paket Boss" server=hotspot1
add name=lucky password=el23 profile="Paket Boss" server=hotspot1
add name=am password=m server=hotspot1
add name=113 password=damkar profile=office server=hotspot1
add name=ton1 password=damkar profile=PHL server=hotspot1
add name=penceg password=cegah
add name=ton2 password=mako profile=PHL server=hotspot1
add name=ton3 password=mako profile=PHL server=hotspot1
add name=ntan password=in server=hotspot1
add name=codet password=dar profile=heuses server=hotspot1
add name=erna password=wati profile="Paket Boss" server=hotspot1
add name=ade password=ntar server=hotspot1
add name=kasubag password=keu server=hotspot1
add name=utara password=asud profile="Paket Boss" server=hotspot1
add name=yuni password=iyun server=hotspot1
add name=irawan password=mpap
add name=burhan password=ji server=hotspot1
add name=putri password=noonk profile=PC server=hotspot1
add name=ua password=suo server=hotspot1
add name=ajat password=yoyoy profile="Paket Boss" server=hotspot1
add name=yanyan password=bend
add name=sitmul password=bubend
add name=ackung password=ncus
add name=pemadaman password=kasi profile="Paket Boss" server=hotspot1
add name=smile password=seri profile="Paket Boss" server=hotspot1
add name=raka password=akar profile="Paket Boss" server=hotspot1
add name=kabid password=dalop server=hotspot1
add name=asud password=utara profile="Paket Boss" server=hotspot1
add name=mang password=yusuf profile="Paket Boss" server=hotspot1
add name=jenong password=leni profile=PC server=hotspot1
add name=uta password=ma profile="Paket Boss" server=hotspot1
add name=jengas password=buas profile="Paket Boss" server=hotspot1
add name=sit password=mul profile="Paket Boss" server=hotspot1
add name=kein password=a32 profile="Paket Boss" server=hotspot1
add name=ajeng password=sekar profile="Paket Boss" server=hotspot1
add name=emul password=yadi profile="Paket Boss" server=hotspot1
add name=deni password=birm profile=PC server=hotspot1
add name=pc password=lusi profile="Paket Boss" server=hotspot1
add name=ratika password=kartika profile="Paket Boss"
add name=boris password=jalu profile="Paket Boss" server=hotspot1
add name=pipit password=piit profile="Paket Boss" server=hotspot1
add name=yolanda password=maree profile="Paket Boss" server=hotspot1
add name=sida password=adis server=hotspot1
add name=anir password=rina profile=PC server=hotspot1
add name=kompdalop password=pc profile="Paket Boss" server=hotspot1
add name=nurul password=nimat profile="Paket Boss" server=hotspot1
add name=satpam password=aman profile=office server=hotspot1
add name=satpam password=aman profile=tamu
add name=irwan password=kantin profile="Paket Boss" server=hotspot1
add name=iyus password=doank profile="Paket Boss" server=hotspot1
add name=sholih password=udin profile="Paket Boss" server=hotspot1
add name=dewantoro password=taro profile="Paket Boss" server=hotspot1
add name=intan password=teuas profile="Paket Boss" server=hotspot1
add name=denih password=sanah profile="Paket Boss" server=hotspot1
add name=ncus password=akung profile="Paket Boss"
add name=rangga password=tanggah profile="Paket Boss" server=hotspot1
add name=dadan password=idad profile="Paket Boss" server=hotspot1
add name=tesYT password=1234 profile=Unblock_Youtube
add name=tv password=mako profile="Paket Boss"
add name=adis password=sida profile="Paket Boss" server=hotspot1
add name=nchi password=akew profile="Paket Boss" server=hotspot1
add name=lebaran password=fitri profile=PC
add name=cep password=gorbacep server=hotspot1
add name=rati password=euis profile="Paket Boss"
add name=sejak password=dini profile="Paket Boss" server=hotspot1
add name=dina password=amparan profile=PC server=hotspot1
add name=koperasi password=brahma
add name=kompmojang password=bandung profile="Paket Boss" server=hotspot1
add name=ineu password=wind profile="Paket Boss" server=hotspot1
add name=tom password=jery profile="Paket Boss" server=hotspot1
add name=tvled password=damkar profile="Paket Boss"
add name=kartika password=ratika profile="Paket Boss" server=hotspot1
add name=budi password=113113 profile=PC server=hotspot1
add name=berkas password=hp profile="Paket Boss" server=hotspot1
add name=mamat password=rehab profile="Paket Boss" server=hotspot1
add name=riki password=pemel profile="Paket Boss" server=hotspot1
add name=riani password=kabid profile=PC server=hotspot1
add name=erwin password=gutawa profile="Paket Boss" server=hotspot1
add name=risma password=boris profile="Paket Boss" server=hotspot1
add name=inspektorat password=tera profile=office server=hotspot1
add name=kadis password=kar
add name=santi password=safitri
add name=udan password=mintaryat profile="Paket Boss" server=hotspot1
add name=tv password=prog profile=PC server=hotspot1
add name=asri password=jengas server=hotspot1
add name=Akung password=Asus profile=PC server=hotspot1
add name=sukma password=samsung
add name=ngelan password=p2p server=hotspot1
add name=gudang password=komphp profile="Paket Boss" server=hotspot1
add name=mau password=ingin profile="Paket Boss" server=hotspot1
add name=indriyani password=santi profile="Paket Boss" server=hotspot1
add name=citra password=wulan profile="Paket Boss" server=hotspot1
add name=sihab password=budin profile="Paket Boss" server=hotspot1
add name=diah password=rodiah profile=PC server=hotspot1
add name=adist password=susanto profile=PC server=hotspot1
add name=tri password=tri profile="Paket Boss"
add name=hendra password=den profile="Paket Boss" server=hotspot1
add name=andri password=ahong profile="Paket Boss" server=hotspot1
add name=INDRI password=yani profile=PC server=hotspot1
add name=umat password=tamu profile=Unblock_Youtube
add name=hpbmd password=gudang profile="Paket Boss" server=hotspot1
add name=nugi password=alfa profile="Paket Boss" server=hotspot1
add name=nazla password=luncat profile="Paket Boss" server=hotspot1
add name=piddin password=hapid profile="Paket Boss" server=hotspot1
add name=apple password=6s profile="Paket Boss" server=hotspot1
add name=tamu password=umat profile=tamu
add name=tio password=paku profile=PC server=hotspot1
add name=program password=tv profile="Paket Boss" server=hotspot1
add name=kail password=usep profile=PC server=hotspot1
add name=emi password=search profile="Paket Boss" server=hotspot1
add name="hp alpi" password=komp profile="Paket Boss" server=hotspot1
add name=luthfiah password=nazla profile="Paket Boss" server=hotspot1
add name=thinta1 password=ink profile="Paket Boss" server=hotspot1
add name=Jhon password=rescue profile="Paket Boss" server=hotspot1
add name=subagkeu password=asus profile="Paket Boss" server=hotspot1
add name=lenovoburhan password=ji profile="Paket Boss" server=hotspot1
add name=hpkeu password=nuel profile="Paket Boss" server=hotspot1
add name=oval password=1234 profile="Paket Boss" server=hotspot1
add name=malu password=putri profile=PC server=hotspot1
add name=sleef password=dur profile="Paket Boss" server=hotspot1
add name=rojak password=ngalfi profile="Paket Boss" server=hotspot1
add name=prog password=nazla profile="Paket Boss" server=hotspot1
add name="pc hp putri" password=noonk profile="Paket Boss" server=hotspot1
add name=micle password=ucup server=hotspot1
add name=indri password=liti profile="Paket Boss" server=hotspot1
add name=rahmat password=asep profile="Paket Boss" server=hotspot1
add name=riyan password=luhbin profile=PC server=hotspot1
add name=adhi password=sukma profile="Paket Boss"
add name=tengtop password=hp profile="Paket Boss" server=hotspot1
add name=asep password=rahmat server=hotspot1
add name=mardi password=coc server=hotspot1
add name=yadi password=ncus
add name=adist password=susanto profile="Paket Boss"
add name=judo password=ikid
add name=ini password=idub
add name=star password=liti
add name=koperasi password=brahma server=hotspot1
add name=gonjales password=gogogn profile="Paket Boss" server=hotspot1
add name=ani password=ina profile="Paket Boss"
add name=ata password=torix profile="Paket Boss" server=hotspot1
add name=udung password=uud server=hotspot1
add name=majid password=sella profile="Paket Boss" server=hotspot1
add name=asmul password=selatan server=hotspot1
add name=onod password=torik server=hotspot1
add name=fauzan password=uzan server=hotspot1
add name=user2
add name=adem password=made server=hotspot1
add name=athifa password=mecca profile="Paket Boss" server=hotspot1
add name=hermawan password=irwan
add name=lanchah password=nempel server=hotspot1
add name=mulyadi password=domba server=hotspot1
add name=gogon password=murka server=hotspot1
add name=oki password=jely server=hotspot1
add name=rafi password=ahmad server=hotspot1
add name=calvin password=cikmunk profile="Paket Boss" server=hotspot1
add name=marimar password=mayong profile="Paket Boss" server=hotspot1
add name=DCC113 password=113 server=hotspot1
add name=angga password=angger profile="Paket Boss" server=hotspot1
add name=boboran password=fitri
add name=baby password=alien
add name=pahibut password=facfi profile="Paket Boss" server=hotspot1
add name=dika password=duka profile="Paket Boss" server=hotspot1
/ip proxy
set cache-administrator="" cache-path=web-proxy1 parent-proxy=0.0.0.0 port=\
    4444
/ip route
add distance=1 dst-address=172.16.2.11/32 gateway=10.100.2.5
add distance=1 dst-address=172.16.8.0/24 gateway=172.16.1.10
add distance=1 dst-address=172.16.22.0/23 gateway=172.16.1.10
add distance=1 dst-address=172.16.36.0/24 gateway=172.16.1.10
add distance=1 dst-address=172.16.220.0/22 gateway=10.100.2.5
add distance=1 dst-address=172.16.240.0/20 gateway=172.16.0.40
add distance=1 dst-address=172.30.0.0/22 gateway=172.16.1.23
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api-ssl disabled=yes
/routing bgp network
add network=172.16.0.0/22 synchronize=no
add network=172.16.240.0/20 synchronize=no
add network=172.16.8.0/24 synchronize=no
add network=172.30.0.0/22 synchronize=no
add network=182.23.28.240/29 synchronize=no
add network=202.152.63.120/29 synchronize=no
add network=123.231.246.232/29 synchronize=no
add network=202.152.36.168/29 synchronize=no
add network=202.152.61.48/29 synchronize=no
add network=172.16.36.0/24 synchronize=no
add network=172.16.22.0/23 synchronize=no
/routing bgp peer
add in-filter=JAH name=JAH remote-address=10.100.2.5 remote-as=64514
add in-filter=JAH-BACKUP name=JAH-BACKUP remote-address=10.100.3.5 remote-as=\
    64514
/routing filter
add action=accept chain=JAH prefix=0.0.0.0/0
add action=accept chain=JAH prefix=172.16.100.0/22
add action=accept chain=JAH prefix=172.16.128.0/22
add action=accept chain=JAH prefix=172.16.200.0/22
add action=accept chain=JAH prefix=172.18.0.0/24
add action=accept chain=JAH prefix=172.16.1.7
add action=accept chain=JAH prefix=172.16.1.9
add action=accept chain=JAH prefix=172.16.2.9
add action=accept chain=JAH prefix=172.16.2.12
add action=accept chain=JAH prefix=172.16.2.11
add action=discard chain=JAH
add action=accept chain=JAH-BACKUP prefix=0.0.0.0/0 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.100.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.200.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.128.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.18.0.0/24 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.1.7 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.1.9 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.2.9 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.2.12 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.2.11 set-bgp-prepend=5
add action=discard chain=JAH-BACKUP
/snmp
set enabled=yes trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name="CERES BDG"
/system ntp client
set enabled=yes primary-ntp=203.160.128.59 secondary-ntp=14.102.153.110
/system scheduler
add disabled=yes interval=1d name="Firewall Drop Sosmed ON" on-event=\
    "/ip firewall filter enable numbers=14" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/25/2021 start-time=08:00:00
add interval=1d name="Firwall Drop Video OFF" on-event=\
    "/ip firewall filter enable numbers=15" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/25/2021 start-time=08:00:00
add interval=1d name="Firwall Drop Video Istirahat" on-event=\
    "/ip firewall filter disable numbers=15" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/25/2021 start-time=12:00:00
add interval=1d name="Firwall Drop Video Selesai Istirahat" on-event=\
    "/ip firewall filter enable numbers=15" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/25/2021 start-time=13:00:00
add interval=1d name="Firwall Drop Video JamPulang" on-event=\
    "/ip firewall filter disable numbers=15" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/25/2021 start-time=16:00:00
