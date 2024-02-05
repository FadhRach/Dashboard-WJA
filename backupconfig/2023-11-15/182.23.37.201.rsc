# nov/15/2023 05:00:03 by RouterOS 6.49.7
# software id = FEXE-QFT9
#
# model = 1100AHx2
# serial number = 47B8044DD126
/interface bridge
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] name=Ether1-TO_METRO_JAH
set [ find default-name=ether2 ] name=ether2-TO_LAN
set [ find default-name=ether3 ] name=ether3-TO_METRO_JAH_BACKUP
set [ find default-name=ether10 ] name=ether10-TO_LAN_PUBLIC
set [ find default-name=ether12 ] name=ether12-TO_ORION
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server option
add code=121 name=nirwana value="0x20'172.16.50.15''172.16.48.2'0x20'172.16.50\
    .73''172.16.48.2'0x20'172.16.50.74''172.16.48.2'0x20'172.16.50.75''172.16.\
    48.2'0x20'172.16.50.76''172.16.48.2'0x20'172.16.50.77''172.16.48.2'0x20'17\
    2.16.50.78''172.16.48.2'"
/ip pool
add name=dhcp_pool1 ranges=\
    172.16.48.3-172.16.49.255,172.16.50.128-172.16.63.254
/ip dhcp-server
add address-pool=dhcp_pool1 interface=ether2-TO_LAN lease-time=12h name=LAN
/queue simple
add limit-at=20M/20M max-limit=20M/20M name=jah packet-marks=mark-jah target=\
    172.16.48.0/20,172.17.240.0/20
add disabled=yes limit-at=100M/100M max-limit=100M/100M name=internet \
    packet-marks=mark-internet target=172.16.48.0/20,172.17.240.0/20
add max-limit=100M/100M name=nl-vip packet-marks=mark-nl-vip target=\
    172.17.249.0/24,172.17.251.0/24
add max-limit=100M/100M name=nl-vvip packet-marks=mark-nl-vvip target=\
    172.17.250.0/24
add max-limit=100M/100M name=nl-orion packet-marks=mark-nl-orion target=\
    182.23.104.112/29
/routing bgp instance
set default as=64513 router-id=10.1.1.2
/snmp community
set [ find default=yes ] name=cpepublic
/ip address
add address=10.100.2.10/30 interface=Ether1-TO_METRO_JAH network=10.100.2.8
add address=172.16.48.2/20 interface=ether2-TO_LAN network=172.16.48.0
add address=10.1.1.2 interface=loopback network=10.1.1.2
add address=10.100.3.10/30 interface=ether3-TO_METRO_JAH_BACKUP network=\
    10.100.3.8
add address=182.23.98.153/29 comment="Remote Sites (OpenVPN)" interface=\
    ether10-TO_LAN_PUBLIC network=182.23.98.152
add address=182.23.104.113/29 comment="Delfi Orion" interface=\
    ether12-TO_ORION network=182.23.104.112
add address=182.23.37.201/29 comment="Mail Intranet (sales)" interface=\
    ether10-TO_LAN_PUBLIC network=182.23.37.200
add address=202.152.28.65/28 comment="VC / VoIP" interface=\
    ether10-TO_LAN_PUBLIC network=202.152.28.64
add address=202.152.59.161/29 comment="VC / VoIP" interface=\
    ether10-TO_LAN_PUBLIC network=202.152.59.160
add address=10.100.200.10/29 disabled=yes interface=Ether1-TO_METRO_JAH \
    network=10.100.200.8
/ip dhcp-server lease
add address=172.16.48.100 mac-address=58:69:6C:70:71:B9 server=LAN
add address=172.16.48.101 mac-address=58:69:6C:D4:18:61 server=LAN
add address=172.16.48.102 mac-address=58:69:6C:D4:3D:60 server=LAN
add address=172.16.48.103 mac-address=58:69:6C:D4:28:35 server=LAN
add address=172.16.48.104 mac-address=58:69:6C:D4:31:79 server=LAN
add address=172.16.48.105 mac-address=58:69:6C:D4:3D:5D server=LAN
add address=172.16.48.106 mac-address=58:69:6C:D4:1F:45 server=LAN
add address=172.16.48.107 mac-address=58:69:6C:D4:44:49 server=LAN
add address=172.16.48.108 mac-address=58:69:6C:D4:21:39 server=LAN
add address=172.16.48.109 mac-address=58:69:6C:D4:3D:99 server=LAN
add address=172.16.48.110 mac-address=58:69:6C:D4:1E:0D server=LAN
add address=172.16.48.111 mac-address=58:69:6C:D4:25:85 server=LAN
add address=172.16.48.112 mac-address=58:69:6C:D4:2B:C5 server=LAN
add address=172.16.48.113 mac-address=58:69:6C:D4:30:C5 server=LAN
add address=172.16.48.114 mac-address=58:69:6C:D4:2D:6D server=LAN
add address=172.16.48.115 mac-address=58:69:6C:D4:3C:B9 server=LAN
add address=172.16.48.116 mac-address=58:69:6C:D4:3A:BD server=LAN
add address=172.16.48.117 mac-address=58:69:6C:D4:18:F9 server=LAN
add address=172.16.48.118 mac-address=58:69:6C:D4:2F:B5 server=LAN
add address=172.16.48.201 mac-address=EC:CD:6D:D9:90:6E server=LAN
add address=172.16.48.202 mac-address=E8:DE:27:D8:35:41 server=LAN
add address=172.16.48.203 mac-address=E8:DE:27:D8:34:C5 server=LAN
add address=172.16.48.204 mac-address=14:CC:20:86:1E:50 server=LAN
add address=172.16.48.206 mac-address=F4:F2:6D:2C:88:19 server=LAN
add address=172.16.48.207 mac-address=C4:69:84:39:8D:3E server=LAN
add address=172.16.48.209 mac-address=60:E3:27:5D:BC:91 server=LAN
add address=172.16.48.210 mac-address=00:31:92:3B:F5:BF server=LAN
add address=172.16.48.211 mac-address=00:31:92:3B:F5:BE server=LAN
add address=172.16.48.212 mac-address=00:31:92:3B:F5:C1 server=LAN
add address=172.16.48.213 mac-address=E4:C3:2A:DB:90:16 server=LAN
add address=172.16.48.214 mac-address=E4:C3:2A:DB:90:15 server=LAN
add address=172.16.48.215 mac-address=E4:C3:2A:DB:90:12 server=LAN
add address=172.16.48.216 mac-address=00:5F:67:B4:4D:A3 server=LAN
add address=172.16.48.217 mac-address=C0:06:C3:A1:43:50 server=LAN
add address=172.16.48.218 mac-address=00:5F:67:B4:4D:A5 server=LAN
add address=172.16.48.219 mac-address=00:5F:67:B4:4D:A2 server=LAN
add address=172.16.48.220 mac-address=C0:06:C3:A1:43:4F server=LAN
add address=172.16.48.221 mac-address=00:5F:67:B4:4D:A6 server=LAN
add address=172.16.48.222 mac-address=C0:06:C3:A1:43:4E server=LAN
add address=172.16.48.223 mac-address=00:5F:67:B4:4D:A7 server=LAN
add address=172.16.48.224 mac-address=00:5F:67:B4:4D:A9 server=LAN
add address=172.16.48.225 mac-address=00:5F:67:B4:4D:A8 server=LAN
add address=172.16.48.226 mac-address=00:5F:67:B4:4D:A4 server=LAN
add address=172.16.48.227 mac-address=50:D4:F7:0F:1B:A1 server=LAN
add address=172.16.50.11 mac-address=00:11:95:61:76:A9 server=LAN
add address=172.16.50.46 mac-address=00:01:2E:BC:6E:08 server=LAN
add address=172.16.50.49 mac-address=84:2B:2B:6F:FA:0D server=LAN
add address=172.16.50.50 mac-address=68:6D:BC:DB:69:3A server=LAN
add address=172.16.50.51 mac-address=00:13:57:03:D2:E2 server=LAN
add address=172.16.50.52 mac-address=00:13:57:03:02:0D server=LAN
add address=172.16.50.53 mac-address=00:17:61:10:A0:F1 server=LAN
add address=172.16.50.54 mac-address=00:13:57:03:33:D8 server=LAN
add address=172.16.50.60 mac-address=00:E0:4C:5C:00:8D server=LAN
add address=172.16.50.61 mac-address=00:E0:4C:5C:00:8F server=LAN
add address=172.16.50.63 mac-address=00:E0:4C:5C:00:5E server=LAN
add address=172.16.50.65 mac-address=BC:30:5B:E3:03:A6 server=LAN
add address=172.16.50.67 mac-address=00:16:B6:8B:1D:86 server=LAN
add address=172.16.50.69 mac-address=78:2B:CB:62:45:BD server=LAN
add address=172.16.50.70 mac-address=78:2B:CB:45:B1:30 server=LAN
add address=172.16.50.73 mac-address=5C:26:0A:D0:0A:74 server=LAN
add address=172.16.50.74 mac-address=5C:26:0A:D0:08:34 server=LAN
add address=172.16.50.81 mac-address=BC:30:5B:BE:57:3C server=LAN
add address=172.16.50.83 mac-address=50:E5:49:54:7B:8F server=LAN
add address=172.16.50.84 mac-address=84:8F:69:38:73:C9 server=LAN
add address=172.16.50.85 mac-address=84:8F:69:38:73:D6 server=LAN
add address=172.16.50.86 mac-address=CC:7E:E7:D2:91:D9 server=LAN
add address=172.16.50.89 mac-address=B0:83:FE:98:FB:27 server=LAN
add address=172.16.50.90 mac-address=00:17:61:10:38:CA server=LAN
add address=172.16.50.91 mac-address=00:17:61:10:39:28 server=LAN
add address=172.16.50.92 mac-address=00:17:61:10:8A:7B server=LAN
add address=172.16.50.101 mac-address=00:18:F8:EE:2D:10 server=LAN
add address=172.16.50.103 mac-address=68:7F:74:08:78:A9 server=LAN
add address=172.16.50.104 mac-address=68:7F:74:08:77:89 server=LAN
add address=172.16.50.105 mac-address=20:AA:4B:F8:F8:44 server=LAN
add address=172.16.50.106 mac-address=D4:CA:6D:20:D2:E3 server=LAN
add address=172.16.50.107 mac-address=D4:CA:6D:20:D2:E2 server=LAN
add address=172.16.50.108 mac-address=F8:32:E4:AE:C6:48 server=LAN
add address=172.16.50.109 mac-address=60:E3:27:E5:DA:E6 server=LAN
add address=172.16.50.111 mac-address=D8:47:32:59:B4:BD server=LAN
add address=172.16.50.121 mac-address=00:1E:E5:CD:CE:41 server=LAN
add address=172.16.50.122 mac-address=00:0C:42:E8:FE:D8 server=LAN
add address=172.16.50.123 mac-address=D4:CA:6D:93:16:CB server=LAN
add address=172.16.50.124 mac-address=CC:2D:E0:7E:0F:A5 server=LAN
add address=172.16.50.125 mac-address=CC:2D:E0:7E:0F:45 server=LAN
add address=172.16.50.127 mac-address=CC:2D:E0:7E:0F:85 server=LAN
add address=172.16.50.128 mac-address=CC:2D:E0:69:DB:D8 server=LAN
add address=172.16.50.135 mac-address=00:1E:E5:E0:D2:4C server=LAN
add address=172.16.50.201 mac-address=9C:B6:54:15:3F:7D server=LAN
add address=172.16.50.202 mac-address=F4:CE:46:35:43:B1 server=LAN
add address=172.16.50.204 mac-address=1C:C1:DE:81:FD:0C server=LAN
add address=172.16.50.205 mac-address=68:B5:99:AB:A2:19 server=LAN
add address=172.16.50.206 mac-address=00:1A:4B:19:17:EB server=LAN
add address=172.16.50.208 mac-address=C8:5A:CF:F6:5D:82 server=LAN
add address=172.16.50.209 mac-address=A0:48:1C:68:2B:9C server=LAN
add address=172.16.50.210 mac-address=48:EE:0C:23:7E:D2 server=LAN
add address=172.16.50.211 mac-address=A0:B3:CC:9B:53:9D server=LAN
add address=172.16.50.212 mac-address=40:A8:F0:B9:66:AC server=LAN
add address=172.16.50.214 mac-address=00:03:D6:01:69:06 server=LAN
add address=172.16.50.215 mac-address=00:1C:F0:78:A4:92 server=LAN
add address=172.16.50.217 mac-address=34:E8:94:20:AF:A5 server=LAN
add address=172.16.50.218 mac-address=0A:53:85:00:12:EC server=LAN
add address=172.16.50.219 mac-address=98:4B:E1:3B:13:B5 server=LAN
add address=172.16.50.220 mac-address=08:00:37:D2:FD:A8 server=LAN
add address=172.16.50.221 mac-address=9C:B6:54:50:CF:13 server=LAN
add address=172.16.50.222 mac-address=F4:CE:46:34:1A:39 server=LAN
add address=172.16.50.224 mac-address=68:B5:99:AB:C2:28 server=LAN
add address=172.16.50.225 mac-address=00:40:8C:97:8B:A2 server=LAN
add address=172.16.50.227 mac-address=00:0E:53:2F:EA:13 server=LAN
add address=172.16.50.228 mac-address=F8:0D:60:27:7C:BA server=LAN
add address=172.16.50.229 mac-address=00:0E:53:2F:D1:F0 server=LAN
add address=172.16.50.230 mac-address=00:40:8C:97:8B:9C server=LAN
add address=172.16.50.231 mac-address=00:40:8C:8A:DE:EA server=LAN
add address=172.16.50.232 mac-address=98:48:27:99:93:66 server=LAN
add address=172.16.50.234 mac-address=28:80:23:11:96:30 server=LAN
add address=172.16.50.235 mac-address=00:40:8C:97:90:6B server=LAN
add address=172.16.50.236 mac-address=1C:C1:DE:81:9E:69 server=LAN
add address=172.16.50.237 mac-address=00:40:8C:8E:2A:36 server=LAN
add address=172.16.50.238 mac-address=9C:8E:99:85:84:2D server=LAN
add address=172.16.50.239 mac-address=00:13:21:22:E4:32 server=LAN
add address=172.16.50.241 mac-address=68:B5:99:90:B8:09 server=LAN
add address=172.16.50.242 mac-address=00:23:7D:7D:C3:1E server=LAN
add address=172.16.50.243 mac-address=00:23:7D:7D:DD:EF server=LAN
add address=172.16.50.244 mac-address=00:40:8C:74:1E:D0 server=LAN
add address=172.16.50.245 mac-address=D0:C0:BF:9D:C4:6A server=LAN
add address=172.16.50.246 mac-address=FC:3F:DB:7A:DA:33 server=LAN
add address=172.16.50.247 mac-address=00:21:5A:E2:76:6C server=LAN
add address=172.16.50.248 mac-address=08:2E:5F:BC:9C:42 server=LAN
add address=172.16.50.249 mac-address=00:40:8C:7E:CA:93 server=LAN
add address=172.16.50.250 mac-address=00:40:8C:7E:C9:2D server=LAN
add address=172.16.50.251 mac-address=A0:D3:C1:CD:BC:09 server=LAN
add address=172.16.50.252 mac-address=38:63:BB:DA:E9:52 server=LAN
add address=172.16.50.253 mac-address=EC:8E:B5:24:46:04 server=LAN
add address=172.16.50.254 mac-address=AC:E2:D3:BE:27:98 server=LAN
add address=172.16.51.1 mac-address=00:16:CB:A7:2F:D0 server=LAN
add address=172.16.51.2 mac-address=C4:2C:03:1D:44:41 server=LAN
add address=172.16.51.3 mac-address=00:0A:E4:3F:E5:C1 server=LAN
add address=172.16.51.4 mac-address=00:17:F2:D0:29:0B server=LAN
add address=172.16.51.5 mac-address=00:0A:E4:3F:42:61 server=LAN
add address=172.16.51.6 mac-address=00:0A:E4:2E:F4:5C server=LAN
add address=172.16.51.7 mac-address=00:01:2E:BC:4F:AC server=LAN
add address=172.16.51.8 mac-address=00:0E:A6:C1:29:08 server=LAN
add address=172.16.51.9 mac-address=00:26:18:3F:D2:44 server=LAN
add address=172.16.51.10 mac-address=00:06:1B:DD:AB:49 server=LAN
add address=172.16.51.11 mac-address=00:EB:01:01:0C:C5 server=LAN
add address=172.16.51.12 mac-address=60:EB:69:53:13:ED server=LAN
add address=172.16.51.13 mac-address=20:1A:06:BA:10:D9 server=LAN
add address=172.16.51.15 mac-address=00:24:7E:E1:CF:41 server=LAN
add address=172.16.51.16 mac-address=00:08:0D:1C:BC:D2 server=LAN
add address=172.16.51.17 mac-address=00:16:CB:D0:26:57 server=LAN
add address=172.16.51.18 mac-address=00:1F:F3:CC:C5:8D server=LAN
add address=172.16.51.19 mac-address=00:01:2E:BC:72:94 server=LAN
add address=172.16.51.30 mac-address=00:24:1D:83:44:B2 server=LAN
add address=172.16.51.31 mac-address=00:21:97:3D:2E:75 server=LAN
add address=172.16.51.32 mac-address=C4:2C:03:22:98:FE server=LAN
add address=172.16.51.33 mac-address=00:0A:F7:2C:3F:48 server=LAN
add address=172.16.51.34 mac-address=00:19:66:FD:B0:11 server=LAN
add address=172.16.51.36 mac-address=00:24:E8:82:CF:8B server=LAN
add address=172.16.51.37 mac-address=00:24:E8:82:D7:AF server=LAN
add address=172.16.51.39 mac-address=00:01:2E:4F:01:F5 server=LAN
add address=172.16.51.40 mac-address=2A:89:D1:F5:88:11 server=LAN
add address=172.16.51.41 mac-address=00:24:E8:82:C4:51 server=LAN
add address=172.16.51.42 mac-address=6C:F0:49:51:EA:D9 server=LAN
add address=172.16.51.43 mac-address=00:01:03:C1:4A:39 server=LAN
add address=172.16.51.44 mac-address=00:23:24:E6:BA:F6 server=LAN
add address=172.16.51.46 mac-address=18:4F:32:C8:EB:E9 server=LAN
add address=172.16.51.47 mac-address=6C:F0:49:0A:A2:56 server=LAN
add address=172.16.51.48 mac-address=00:24:1D:70:13:17 server=LAN
add address=172.16.51.49 mac-address=08:9E:01:B7:A7:32 server=LAN
add address=172.16.51.52 mac-address=00:E0:18:71:E7:4A server=LAN
add address=172.16.51.53 mac-address=00:01:2E:2B:25:94 server=LAN
add address=172.16.51.54 mac-address=00:15:58:DA:47:0D server=LAN
add address=172.16.51.55 mac-address=7C:B2:7D:70:05:CB server=LAN
add address=172.16.51.56 mac-address=20:89:84:B5:27:27 server=LAN
add address=172.16.51.57 mac-address=08:9E:01:D1:B5:00 server=LAN
add address=172.16.51.58 mac-address=00:0F:B0:9E:96:E8 server=LAN
add address=172.16.51.59 mac-address=00:09:6B:95:9B:41 server=LAN
add address=172.16.51.60 mac-address=00:23:AE:71:45:E5 server=LAN
add address=172.16.51.61 mac-address=00:15:5D:37:AE:01 server=LAN
add address=172.16.51.62 mac-address=00:21:91:20:68:65 server=LAN
add address=172.16.51.64 mac-address=A4:BA:DB:BF:8F:F6 server=LAN
add address=172.16.51.65 mac-address=00:19:66:FF:A7:A0 server=LAN
add address=172.16.51.67 mac-address=08:00:27:76:A5:E9 server=LAN
add address=172.16.51.68 mac-address=18:03:73:DF:EB:97 server=LAN
add address=172.16.51.69 mac-address=90:8A:12:A1:11:0A server=LAN
add address=172.16.51.71 mac-address=EA:4E:DA:B1:DF:0F server=LAN
add address=172.16.51.72 mac-address=62:85:F4:60:6A:4C server=LAN
add address=172.16.51.73 mac-address=9A:DE:88:2C:66:CE server=LAN
add address=172.16.51.74 mac-address=EE:C1:C6:DA:F0:57 server=LAN
add address=172.16.51.75 mac-address=FA:A7:9A:FE:DA:20 server=LAN
add address=172.16.51.76 mac-address=B6:58:4B:C8:0A:27 server=LAN
add address=172.16.51.78 mac-address=A4:BA:DB:FB:6D:FB server=LAN
add address=172.16.51.79 mac-address=00:26:18:EE:F0:5B server=LAN
add address=172.16.51.81 mac-address=00:15:58:E7:1C:7E server=LAN
add address=172.16.51.82 mac-address=00:50:BA:84:70:E5 server=LAN
add address=172.16.51.84 mac-address=00:23:24:E6:B9:A0 server=LAN
add address=172.16.51.85 mac-address=90:E6:BA:BA:A7:CF server=LAN
add address=172.16.51.86 mac-address=18:03:73:DF:E4:4D server=LAN
add address=172.16.51.101 mac-address=18:C0:4D:60:A2:68 server=LAN
add address=172.16.51.102 mac-address=00:16:76:75:D4:05 server=LAN
add address=172.16.51.103 mac-address=00:16:76:69:28:B9 server=LAN
add address=172.16.51.104 mac-address=00:16:76:69:24:18 server=LAN
add address=172.16.51.111 mac-address=00:01:6C:92:64:12 server=LAN
add address=172.16.51.112 mac-address=00:01:6C:97:F8:0A server=LAN
add address=172.16.51.113 mac-address=00:01:6C:92:8D:42 server=LAN
add address=172.16.51.114 mac-address=BC:30:5B:C9:E7:15 server=LAN
add address=172.16.51.115 mac-address=00:01:6C:92:8E:B2 server=LAN
add address=172.16.51.117 mac-address=00:26:18:EE:F5:C4 server=LAN
add address=172.16.51.118 mac-address=00:26:18:EE:F5:B8 server=LAN
add address=172.16.51.120 mac-address=F4:8E:38:7A:93:3C server=LAN
add address=172.16.51.121 mac-address=00:26:18:EE:F5:CD server=LAN
add address=172.16.51.122 mac-address=00:26:18:E4:0F:8F server=LAN
add address=172.16.51.124 mac-address=00:26:18:EE:F5:BD server=LAN
add address=172.16.51.125 mac-address=00:26:18:E4:0F:6D server=LAN
add address=172.16.51.126 mac-address=14:DA:E9:F0:CC:72 server=LAN
add address=172.16.51.127 mac-address=C8:1F:66:40:97:0D server=LAN
add address=172.16.51.128 mac-address=00:09:6B:F3:5F:FD server=LAN
add address=172.16.51.129 mac-address=90:E6:BA:BA:A7:C1 server=LAN
add address=172.16.51.130 mac-address=00:01:6C:92:8F:71 server=LAN
add address=172.16.51.131 mac-address=00:11:85:78:56:65 server=LAN
add address=172.16.51.138 mac-address=18:1D:EA:A8:E6:2A server=LAN
add address=172.16.51.139 mac-address=90:E6:BA:BA:A1:3C server=LAN
add address=172.16.51.140 mac-address=18:03:73:DF:E4:0F server=LAN
add address=172.16.51.141 mac-address=00:26:18:E4:0F:90 server=LAN
add address=172.16.51.142 mac-address=18:03:73:DA:11:43 server=LAN
add address=172.16.51.143 mac-address=18:03:73:DF:E1:C2 server=LAN
add address=172.16.51.144 mac-address=18:4F:32:59:CB:EB server=LAN
add address=172.16.51.145 mac-address=C8:1F:66:40:99:64 server=LAN
add address=172.16.51.146 mac-address=C8:1F:66:40:97:00 server=LAN
add address=172.16.51.147 mac-address=A4:BA:DB:FB:75:00 server=LAN
add address=172.16.51.148 mac-address=C8:1F:66:40:96:FB server=LAN
add address=172.16.51.149 mac-address=18:03:73:DF:22:7E server=LAN
add address=172.16.51.150 mac-address=18:03:73:DF:E4:72 server=LAN
add address=172.16.51.151 mac-address=00:26:18:E4:0F:14 server=LAN
add address=172.16.51.152 mac-address=F0:DE:F1:1B:2C:55 server=LAN
add address=172.16.51.170 mac-address=A8:60:B6:0C:14:4F server=LAN
add address=172.16.51.182 mac-address=00:13:46:3A:9C:77 server=LAN
add address=172.16.51.183 mac-address=20:47:47:78:FC:94 server=LAN
add address=172.16.51.184 mac-address=F4:4D:30:17:E4:53 server=LAN
add address=172.16.51.235 mac-address=E8:50:8B:A2:D8:BE server=LAN
add address=172.16.51.236 mac-address=20:47:47:43:EB:C4 server=LAN
add address=172.16.52.1 mac-address=7C:B2:7D:6F:D2:72 server=LAN
add address=172.16.52.2 mac-address=08:9E:01:C6:9E:26 server=LAN
add address=172.16.52.9 mac-address=F4:8E:38:82:DC:70 server=LAN
add address=172.16.52.12 mac-address=00:01:02:B5:79:F7 server=LAN
add address=172.16.52.13 mac-address=00:01:03:06:EF:D4 server=LAN
add address=172.16.52.16 mac-address=C8:D9:D2:EC:7F:10 server=LAN
add address=172.16.52.17 mac-address=00:01:02:B5:79:36 server=LAN
add address=172.16.52.19 mac-address=00:01:02:B5:79:9D server=LAN
add address=172.16.52.22 mac-address=00:E0:18:65:9F:74 server=LAN
add address=172.16.52.23 mac-address=00:01:02:B5:79:35 server=LAN
add address=172.16.52.24 mac-address=00:01:02:B5:79:F1 server=LAN
add address=172.16.52.25 mac-address=00:01:02:B5:79:9E server=LAN
add address=172.16.52.26 mac-address=00:50:BA:85:5C:22 server=LAN
add address=172.16.52.28 mac-address=00:01:2E:2B:1A:27 server=LAN
add address=172.16.52.42 mac-address=00:01:2E:2B:20:27 server=LAN
add address=172.16.52.44 mac-address=74:29:AF:28:9C:A9 server=LAN
add address=172.16.52.50 mac-address=00:24:8C:B7:55:01 server=LAN
add address=172.16.52.51 mac-address=48:45:20:B1:6D:B3 server=LAN
add address=172.16.52.52 mac-address=00:01:2E:BC:66:4D server=LAN
add address=172.16.52.53 mac-address=00:50:8D:B5:C0:0F server=LAN
add address=172.16.52.54 mac-address=00:01:2E:47:97:4D server=LAN
add address=172.16.52.55 mac-address=00:01:2E:47:90:24 server=LAN
add address=172.16.52.56 mac-address=54:04:A6:4B:BA:D2 server=LAN
add address=172.16.52.58 mac-address=00:01:2E:2B:32:71 server=LAN
add address=172.16.52.59 mac-address=78:84:3C:34:D0:0A server=LAN
add address=172.16.52.62 mac-address=00:01:2E:4F:34:05 server=LAN
add address=172.16.52.63 mac-address=00:19:DB:BC:31:EC server=LAN
add address=172.16.52.64 mac-address=08:9E:01:A4:E9:DC server=LAN
add address=172.16.52.65 mac-address=F4:8E:38:7A:8D:D5 server=LAN
add address=172.16.52.66 mac-address=00:23:24:E6:BB:20 server=LAN
add address=172.16.52.67 mac-address=40:F0:2F:27:3C:C6 server=LAN
add address=172.16.52.69 mac-address=F4:8E:38:7A:93:2A server=LAN
add address=172.16.52.71 mac-address=00:23:5A:5B:FD:E9 server=LAN
add address=172.16.52.72 mac-address=B0:83:FE:59:F8:E2 server=LAN
add address=172.16.52.73 mac-address=78:2B:46:4F:B2:CB server=LAN
add address=172.16.52.74 mac-address=00:55:D0:6A:D4:1B server=LAN
add address=172.16.52.75 mac-address=00:E0:4C:70:1D:BB server=LAN
add address=172.16.52.76 mac-address=00:01:2E:34:F3:64 server=LAN
add address=172.16.52.77 mac-address=00:01:2E:47:E6:24 server=LAN
add address=172.16.52.78 mac-address=00:01:2E:47:CC:04 server=LAN
add address=172.16.52.79 mac-address=00:01:2E:34:F2:32 server=LAN
add address=172.16.52.80 mac-address=00:1F:C6:16:E6:64 server=LAN
add address=172.16.52.82 mac-address=0C:D2:92:AE:74:1E server=LAN
add address=172.16.52.83 mac-address=00:0E:A6:8A:9A:30 server=LAN
add address=172.16.52.84 mac-address=C8:0A:A9:85:69:65 server=LAN
add address=172.16.52.85 mac-address=E4:54:E8:4B:2A:A5 server=LAN
add address=172.16.52.86 mac-address=7C:B2:7D:70:0D:4B server=LAN
add address=172.16.52.87 mac-address=00:01:2E:48:5F:EF server=LAN
add address=172.16.52.88 mac-address=14:DA:E9:28:B5:E8 server=LAN
add address=172.16.52.89 mac-address=00:0E:7B:B6:86:98 server=LAN
add address=172.16.52.90 mac-address=00:01:2E:2B:25:37 server=LAN
add address=172.16.52.91 mac-address=00:01:2E:2B:1A:A8 server=LAN
add address=172.16.52.92 mac-address=00:01:2E:2B:18:26 server=LAN
add address=172.16.52.94 mac-address=28:D0:EA:7F:23:35 server=LAN
add address=172.16.52.95 mac-address=00:01:2E:2B:1A:DE server=LAN
add address=172.16.52.96 mac-address=00:01:2E:2B:1A:22 server=LAN
add address=172.16.52.97 mac-address=00:1C:C0:DA:85:9F server=LAN
add address=172.16.52.98 mac-address=00:01:2E:2B:1A:3C server=LAN
add address=172.16.52.99 mac-address=00:1C:C0:DA:91:40 server=LAN
add address=172.16.52.100 mac-address=00:01:2E:2B:46:55 server=LAN
add address=172.16.52.101 mac-address=C8:0A:A9:DC:29:F2 server=LAN
add address=172.16.52.102 mac-address=00:01:2E:34:F5:C0 server=LAN
add address=172.16.52.103 mac-address=00:1E:EC:95:39:BC server=LAN
add address=172.16.52.104 mac-address=00:01:2E:4F:01:5D server=LAN
add address=172.16.52.105 mac-address=00:01:2E:34:B3:37 server=LAN
add address=172.16.52.106 mac-address=00:0E:A6:8A:9A:81 server=LAN
add address=172.16.52.107 mac-address=00:23:54:0A:2A:F8 server=LAN
add address=172.16.52.108 mac-address=00:01:2E:4C:99:28 server=LAN
add address=172.16.52.109 mac-address=00:13:D4:CD:B8:28 server=LAN
add address=172.16.52.111 mac-address=00:23:24:E1:FF:63 server=LAN
add address=172.16.52.112 mac-address=00:01:2E:2B:1A:0B server=LAN
add address=172.16.52.113 mac-address=00:25:64:76:D7:31 server=LAN
add address=172.16.52.121 mac-address=00:01:2E:48:6C:26 server=LAN
add address=172.16.52.122 mac-address=00:11:2F:35:F3:97 server=LAN
add address=172.16.52.123 mac-address=00:01:02:B5:78:F7 server=LAN
add address=172.16.52.124 mac-address=00:E0:18:59:30:C5 server=LAN
add address=172.16.52.125 mac-address=00:01:6C:65:38:E7 server=LAN
add address=172.16.52.127 mac-address=F4:8E:38:82:B5:72 server=LAN
add address=172.16.52.141 mac-address=00:01:2E:BC:4F:C1 server=LAN
add address=172.16.52.142 mac-address=20:47:47:3F:C0:4A server=LAN
add address=172.16.52.143 mac-address=00:01:2E:4E:F6:51 server=LAN
add address=172.16.52.145 mac-address=7C:B2:7D:6E:F1:27 server=LAN
add address=172.16.52.146 mac-address=7C:B2:7D:6F:6D:8C server=LAN
add address=172.16.52.147 mac-address=00:1C:C0:E4:BD:62 server=LAN
add address=172.16.52.148 mac-address=00:01:2E:BC:54:68 server=LAN
add address=172.16.52.149 mac-address=00:E0:18:65:A1:FD server=LAN
add address=172.16.52.150 mac-address=00:22:15:B6:00:79 server=LAN
add address=172.16.52.151 mac-address=00:01:2E:48:B4:CB server=LAN
add address=172.16.52.152 mac-address=00:01:2E:3B:87:2A server=LAN
add address=172.16.52.161 mac-address=08:9E:01:B7:A3:59 server=LAN
add address=172.16.52.162 mac-address=00:16:D4:29:67:9A server=LAN
add address=172.16.52.163 mac-address=00:01:2E:BC:65:24 server=LAN
add address=172.16.52.164 mac-address=00:01:2E:BC:4D:B4 server=LAN
add address=172.16.52.166 mac-address=C8:0A:A9:DC:25:C8 server=LAN
add address=172.16.52.167 mac-address=00:23:AE:72:AE:32 server=LAN
add address=172.16.52.168 mac-address=00:26:6C:46:60:0C server=LAN
add address=172.16.52.169 mac-address=B8:EE:65:08:F6:51 server=LAN
add address=172.16.52.170 mac-address=3C:6A:A7:93:4E:46 server=LAN
add address=172.16.52.172 mac-address=1C:6F:65:88:4B:2F server=LAN
add address=172.16.52.173 mac-address=BC:30:5B:C9:E7:8C server=LAN
add address=172.16.52.174 mac-address=00:16:D4:8A:8C:25 server=LAN
add address=172.16.52.175 mac-address=00:01:2E:BC:64:65 server=LAN
add address=172.16.52.176 mac-address=00:01:2E:2D:8C:83 server=LAN
add address=172.16.52.179 mac-address=98:3B:8F:A5:B3:F1 server=LAN
add address=172.16.52.181 mac-address=00:01:2E:48:63:15 server=LAN
add address=172.16.52.182 mac-address=00:01:2E:4C:98:EA server=LAN
add address=172.16.52.183 mac-address=B0:83:FE:59:EB:50 server=LAN
add address=172.16.52.184 mac-address=20:47:47:3F:C7:42 server=LAN
add address=172.16.52.186 mac-address=20:47:47:3F:C3:66 server=LAN
add address=172.16.52.187 mac-address=20:47:47:3F:C0:41 server=LAN
add address=172.16.52.188 mac-address=20:47:47:3F:C9:EA server=LAN
add address=172.16.52.189 mac-address=20:47:47:3F:C3:6B server=LAN
add address=172.16.52.190 mac-address=20:47:47:3F:C1:7C server=LAN
add address=172.16.52.191 mac-address=00:23:54:E1:5C:D1 server=LAN
add address=172.16.52.193 mac-address=00:23:54:E1:5E:3A server=LAN
add address=172.16.52.194 mac-address=00:23:54:E1:5E:3D server=LAN
add address=172.16.52.195 mac-address=00:01:02:B5:79:9A server=LAN
add address=172.16.52.198 mac-address=00:01:2E:48:5F:FB server=LAN
add address=172.16.52.199 mac-address=F4:8E:38:82:B3:DF server=LAN
add address=172.16.52.200 mac-address=F4:8E:38:82:DC:65 server=LAN
add address=172.16.52.201 mac-address=20:47:47:3F:BF:AA server=LAN
add address=172.16.52.202 mac-address=20:47:47:3F:C7:58 server=LAN
add address=172.16.53.1 mac-address=00:10:C6:A2:73:BF server=LAN
add address=172.16.53.2 mac-address=00:50:BA:59:04:F4 server=LAN
add address=172.16.53.3 mac-address=00:13:46:39:D7:88 server=LAN
add address=172.16.53.5 mac-address=00:15:F2:80:9F:29 server=LAN
add address=172.16.53.6 mac-address=00:0E:A6:8A:99:E1 server=LAN
add address=172.16.53.7 mac-address=00:0C:6E:03:A2:56 server=LAN
add address=172.16.53.8 mac-address=00:0C:6E:24:72:3C server=LAN
add address=172.16.53.31 mac-address=C4:54:44:77:D2:82 server=LAN
add address=172.16.53.32 mac-address=48:45:20:AE:AE:A7 server=LAN
add address=172.16.53.33 mac-address=90:CD:B6:3A:13:7F server=LAN
add address=172.16.53.34 mac-address=98:40:BB:0D:A9:AD server=LAN
add address=172.16.53.35 mac-address=90:CD:B6:39:CF:59 server=LAN
add address=172.16.53.36 mac-address=98:40:BB:0D:A9:C0 server=LAN
add address=172.16.53.37 mac-address=08:71:90:C5:CC:5E server=LAN
add address=172.16.53.38 mac-address=98:40:BB:0D:AE:3F server=LAN
add address=172.16.53.39 mac-address=98:40:BB:0D:A9:E3 server=LAN
add address=172.16.53.40 mac-address=08:71:90:D4:BF:DE server=LAN
add address=172.16.53.41 mac-address=B0:83:FE:57:38:E9 server=LAN
add address=172.16.53.42 mac-address=B0:C0:90:16:E5:E9 server=LAN
add address=172.16.53.43 mac-address=B0:83:FE:59:F4:89 server=LAN
add address=172.16.53.44 mac-address=98:40:BB:0D:B4:7C server=LAN
add address=172.16.53.45 mac-address=7C:B2:7D:70:5A:C6 server=LAN
add address=172.16.53.46 mac-address=08:71:90:49:F8:81 server=LAN
add address=172.16.53.47 mac-address=00:0C:6E:0F:69:B4 server=LAN
add address=172.16.53.48 mac-address=7C:B2:7D:70:5A:D5 server=LAN
add address=172.16.53.49 mac-address=00:1D:60:8A:60:74 server=LAN
add address=172.16.53.50 mac-address=F4:8E:38:7A:8F:F6 server=LAN
add address=172.16.53.52 mac-address=08:71:90:C5:C6:CD server=LAN
add address=172.16.53.53 mac-address=08:71:90:D7:7F:A3 server=LAN
add address=172.16.53.54 mac-address=98:40:BB:0D:B0:A7 server=LAN
add address=172.16.53.55 mac-address=08:71:90:D5:44:4A server=LAN
add address=172.16.53.56 mac-address=7C:B2:7D:70:74:34 server=LAN
add address=172.16.53.57 mac-address=F4:8E:38:82:DB:AE server=LAN
add address=172.16.53.58 mac-address=00:C0:9F:FF:35:55 server=LAN
add address=172.16.53.59 mac-address=00:A0:D1:D7:7F:30 server=LAN
add address=172.16.53.60 mac-address=08:71:90:D5:44:36 server=LAN
add address=172.16.53.61 mac-address=00:A0:D1:D7:83:80 server=LAN
add address=172.16.53.62 mac-address=00:A0:D1:D9:9A:87 server=LAN
add address=172.16.53.64 mac-address=00:08:0D:6A:E1:00 server=LAN
add address=172.16.53.65 mac-address=00:1E:EC:97:D9:DF server=LAN
add address=172.16.53.66 mac-address=00:1C:C0:E9:F9:AD server=LAN
add address=172.16.53.67 mac-address=00:1C:C0:E9:F9:8E server=LAN
add address=172.16.53.68 mac-address=08:71:90:D4:BE:35 server=LAN
add address=172.16.53.69 mac-address=20:47:47:43:EB:59 server=LAN
add address=172.16.53.70 mac-address=08:71:90:DF:2C:44 server=LAN
add address=172.16.53.71 mac-address=08:71:90:D4:BF:84 server=LAN
add address=172.16.53.72 mac-address=00:01:2E:2B:26:6D server=LAN
add address=172.16.53.73 mac-address=00:01:2E:2B:2A:2A server=LAN
add address=172.16.53.74 mac-address=20:47:47:3F:C3:07 server=LAN
add address=172.16.53.75 mac-address=08:9E:01:A4:C4:D4 server=LAN
add address=172.16.53.76 mac-address=00:26:6C:46:60:6B server=LAN
add address=172.16.53.77 mac-address=00:26:6C:42:D8:F2 server=LAN
add address=172.16.53.78 mac-address=00:01:2E:40:45:CF server=LAN
add address=172.16.53.80 mac-address=C4:54:44:77:D1:70 server=LAN
add address=172.16.53.81 mac-address=06:7E:90:09:DA:AC server=LAN
add address=172.16.53.82 mac-address=00:0E:A6:8A:9A:26 server=LAN
add address=172.16.53.83 mac-address=C8:0A:A9:DC:28:11 server=LAN
add address=172.16.53.84 mac-address=00:04:79:66:C6:F4 server=LAN
add address=172.16.53.86 mac-address=00:01:2E:BC:18:1F server=LAN
add address=172.16.53.89 mac-address=7C:B2:7D:6F:D3:3A server=LAN
add address=172.16.53.90 mac-address=34:F6:4B:42:26:42 server=LAN
add address=172.16.53.91 mac-address=A8:1E:84:BC:B3:66 server=LAN
add address=172.16.53.93 mac-address=34:F6:4B:5D:C4:B0 server=LAN
add address=172.16.53.94 mac-address=00:01:2E:41:AC:33 server=LAN
add address=172.16.53.95 mac-address=A8:1E:84:BC:B3:08 server=LAN
add address=172.16.53.96 mac-address=08:9E:01:D5:26:26 server=LAN
add address=172.16.53.97 mac-address=C4:54:44:77:D1:5A server=LAN
add address=172.16.53.98 mac-address=B8:EE:65:02:C8:0E server=LAN
add address=172.16.53.99 mac-address=B0:83:FE:59:F4:E0 server=LAN
add address=172.16.53.100 mac-address=00:15:F2:63:03:7D server=LAN
add address=172.16.53.101 mac-address=6C:F0:49:0A:A2:49 server=LAN
add address=172.16.53.102 mac-address=C4:54:44:77:D0:6C server=LAN
add address=172.16.53.103 mac-address=B0:C0:90:16:D4:35 server=LAN
add address=172.16.53.104 mac-address=20:47:47:3F:C5:9F server=LAN
add address=172.16.53.106 mac-address=F4:8E:38:86:1B:9B server=LAN
add address=172.16.53.107 mac-address=B0:C0:90:1D:28:A7 server=LAN
add address=172.16.53.108 mac-address=20:47:47:45:15:7B server=LAN
add address=172.16.53.109 mac-address=20:47:47:45:14:65 server=LAN
add address=172.16.53.110 mac-address=90:CD:B6:39:B0:1D server=LAN
add address=172.16.53.114 mac-address=00:01:2E:BC:60:25 server=LAN
add address=172.16.53.115 mac-address=30:D0:42:30:A9:47 server=LAN
add address=172.16.53.116 mac-address=64:6C:80:1C:2D:FF server=LAN
add address=172.16.53.117 mac-address=64:6C:80:1C:4A:8B server=LAN
add address=172.16.53.118 mac-address=00:0D:88:36:FD:88 server=LAN
add address=172.16.53.119 mac-address=00:01:2E:34:F5:C2 server=LAN
add address=172.16.53.120 mac-address=E4:54:E8:BF:E0:2A server=LAN
add address=172.16.53.121 mac-address=00:E0:18:E4:4C:E5 server=LAN
add address=172.16.53.122 mac-address=00:01:2E:48:8A:37 server=LAN
add address=172.16.53.124 mac-address=10:A2:8F:CB:7D:9E server=LAN
add address=172.16.53.125 mac-address=00:1B:11:49:9E:A2 server=LAN
add address=172.16.53.126 mac-address=00:1D:60:1F:AE:57 server=LAN
add address=172.16.53.127 mac-address=00:10:22:FE:78:3D server=LAN
add address=172.16.53.128 mac-address=00:1D:92:B7:BA:5B server=LAN
add address=172.16.53.129 mac-address=54:BF:64:9C:EE:F9 server=LAN
add address=172.16.53.130 mac-address=00:11:85:77:6A:C6 server=LAN
add address=172.16.53.131 mac-address=00:50:BA:C3:66:79 server=LAN
add address=172.16.53.132 mac-address=F4:8E:38:82:B4:1D server=LAN
add address=172.16.53.133 mac-address=00:0E:A6:C3:E8:CA server=LAN
add address=172.16.53.134 mac-address=00:0D:88:36:FE:06 server=LAN
add address=172.16.53.135 mac-address=00:09:6B:23:78:59 server=LAN
add address=172.16.53.136 mac-address=00:0D:88:36:FE:1E server=LAN
add address=172.16.53.137 mac-address=00:15:F2:83:3E:03 server=LAN
add address=172.16.53.138 mac-address=00:01:2E:3B:DA:0E server=LAN
add address=172.16.53.139 mac-address=00:01:2E:34:F3:38 server=LAN
add address=172.16.53.140 mac-address=00:01:2E:40:46:07 server=LAN
add address=172.16.53.142 mac-address=00:09:6B:C4:52:5C server=LAN
add address=172.16.53.145 mac-address=00:01:2E:4C:99:01 server=LAN
add address=172.16.53.146 mac-address=00:01:2E:4C:99:5A server=LAN
add address=172.16.53.147 mac-address=00:01:2E:2B:17:48 server=LAN
add address=172.16.53.148 mac-address=00:E0:0C:77:42:8A server=LAN
add address=172.16.53.151 mac-address=00:01:2E:4C:98:C8 server=LAN
add address=172.16.53.152 mac-address=30:D0:42:30:9F:1B server=LAN
add address=172.16.53.153 mac-address=04:92:26:0F:F3:2F server=LAN
add address=172.16.53.154 mac-address=60:EB:69:52:B4:6E server=LAN
add address=172.16.53.155 mac-address=6C:2B:59:45:D5:8E server=LAN
add address=172.16.53.171 mac-address=00:11:2F:B0:F8:04 server=LAN
add address=172.16.53.172 mac-address=00:01:2E:48:62:A5 server=LAN
add address=172.16.54.1 mac-address=00:17:42:27:E0:B1 server=LAN
add address=172.16.54.2 mac-address=00:0F:1F:FE:01:1C server=LAN
add address=172.16.54.5 mac-address=00:14:22:F8:A5:ED server=LAN
add address=172.16.54.6 mac-address=00:0B:5D:CC:2D:D8 server=LAN
add address=172.16.54.7 mac-address=00:0D:60:FE:6A:5E server=LAN
add address=172.16.54.8 mac-address=02:80:C7:61:E6:73 server=LAN
add address=172.16.54.9 mac-address=00:16:D4:9E:6E:C7 server=LAN
add address=172.16.54.16 mac-address=00:21:70:CF:65:30 server=LAN
add address=172.16.54.17 mac-address=A0:A8:CD:32:E5:AB server=LAN
add address=172.16.54.18 mac-address=20:1A:06:3A:B6:3D server=LAN
add address=172.16.54.19 mac-address=E8:9A:8F:E4:F4:50 server=LAN
add address=172.16.54.22 mac-address=00:17:61:11:CB:B8 server=LAN
add address=172.16.54.23 mac-address=B8:70:F4:12:DA:A1 server=LAN
add address=172.16.54.24 mac-address=C8:FF:28:46:4E:FF server=LAN
add address=172.16.54.25 mac-address=80:86:F2:54:99:A8 server=LAN
add address=172.16.54.27 mac-address=40:2C:F4:EA:9E:E2 server=LAN
add address=172.16.54.28 mac-address=00:22:FB:4A:F1:EE server=LAN
add address=172.16.54.29 mac-address=B8:86:87:AE:17:FF server=LAN
add address=172.16.54.30 mac-address=C8:FF:28:C4:97:64 server=LAN
add address=172.16.54.31 mac-address=E0:06:E6:F3:FE:0F server=LAN
add address=172.16.54.33 mac-address=00:21:6A:6A:0A:CE server=LAN
add address=172.16.54.34 mac-address=08:00:27:74:50:3E server=LAN
add address=172.16.54.35 mac-address=2C:33:61:B6:24:30 server=LAN
add address=172.16.54.36 mac-address=34:02:86:C7:43:22 server=LAN
add address=172.16.54.37 mac-address=D8:1D:72:D5:C4:A9 server=LAN
add address=172.16.54.38 mac-address=34:02:86:C7:43:F9 server=LAN
add address=172.16.54.39 mac-address=00:25:64:90:71:66 server=LAN
add address=172.16.54.54 mac-address=00:1D:72:2F:41:4C server=LAN
add address=172.16.54.56 mac-address=00:08:0D:D7:E7:C6 server=LAN
add address=172.16.54.57 mac-address=00:0A:E4:D3:54:6E server=LAN
add address=172.16.54.59 mac-address=00:1D:72:C0:E5:B2 server=LAN
add address=172.16.54.60 mac-address=00:1E:EC:12:1E:98 server=LAN
add address=172.16.54.62 mac-address=00:A0:D1:83:7C:78 server=LAN
add address=172.16.54.63 mac-address=00:1B:24:78:FC:9F server=LAN
add address=172.16.54.64 mac-address=00:40:D0:A3:01:23 server=LAN
add address=172.16.54.65 mac-address=00:0E:7B:E9:41:DF server=LAN
add address=172.16.54.66 mac-address=00:0F:B0:D4:A9:DA server=LAN
add address=172.16.54.69 mac-address=00:26:18:E4:0F:88 server=LAN
add address=172.16.54.70 mac-address=00:1F:E2:5D:B7:98 server=LAN
add address=172.16.54.71 mac-address=8C:73:6E:78:00:B3 server=LAN
add address=172.16.54.72 mac-address=F4:8B:32:A5:8C:90 server=LAN
add address=172.16.54.73 mac-address=50:8F:4C:72:F8:50 server=LAN
add address=172.16.54.74 mac-address=18:67:B0:6B:A4:37 server=LAN
add address=172.16.54.75 mac-address=E0:06:E6:5A:0A:FD server=LAN
add address=172.16.54.76 mac-address=74:2F:68:A7:46:D3 server=LAN
add address=172.16.54.77 mac-address=00:EC:0A:BD:4D:CC server=LAN
add address=172.16.54.78 mac-address=C0:D9:62:76:41:D6 server=LAN
add address=172.16.54.79 mac-address=24:FD:52:3A:2B:D7 server=LAN
add address=172.16.54.80 mac-address=7C:B0:C2:75:E8:B5 server=LAN
add address=172.16.54.81 mac-address=08:11:96:51:57:14 server=LAN
add address=172.16.54.83 mac-address=D4:3B:04:97:56:5D server=LAN
add address=172.16.54.85 mac-address=34:F6:4B:CE:D5:1A server=LAN
add address=172.16.54.86 mac-address=98:EE:CB:78:EE:8D server=LAN
add address=172.16.54.87 mac-address=54:BF:64:9D:D8:9C server=LAN
add address=172.16.54.88 mac-address=54:BF:64:9C:53:F3 server=LAN
add address=172.16.54.90 mac-address=54:BF:64:9C:5E:55 server=LAN
add address=172.16.54.91 mac-address=98:EE:CB:77:D9:5D server=LAN
add address=172.16.54.92 mac-address=20:79:18:EA:8B:C0 server=LAN
add address=172.16.54.93 mac-address=20:79:AF:D8:2D:EA server=LAN
add address=172.16.54.94 mac-address=B4:82:FE:ED:BF:A0 server=LAN
add address=172.16.54.95 mac-address=C0:D9:62:F1:06:6C server=LAN
add address=172.16.54.96 mac-address=00:24:D6:D6:90:E8 server=LAN
add address=172.16.54.97 mac-address=00:23:24:E6:B8:98 server=LAN
add address=172.16.54.98 mac-address=0C:8B:FD:9C:F8:AB server=LAN
add address=172.16.54.99 mac-address=A0:C5:89:45:8E:EA server=LAN
add address=172.16.54.105 mac-address=80:2B:F9:38:E7:0D server=LAN
add address=172.16.54.106 mac-address=6C:6A:77:72:B1:18 server=LAN
add address=172.16.54.107 mac-address=70:B5:E8:BC:66:AE server=LAN
add address=172.16.54.108 mac-address=64:6C:80:1C:5B:01 server=LAN
add address=172.16.54.109 mac-address=28:D2:44:FD:42:3E server=LAN
add address=172.16.54.110 mac-address=34:02:86:7C:C3:C9 server=LAN
add address=172.16.54.130 mac-address=7C:7A:91:1A:49:6F server=LAN
add address=172.16.54.131 mac-address=28:3B:82:CB:24:D7 server=LAN
add address=172.16.54.132 mac-address=34:02:86:27:E5:C5 server=LAN
add address=172.16.54.134 mac-address=E8:B1:FC:8F:13:E4 server=LAN
add address=172.16.54.135 mac-address=28:B2:BD:48:68:3B server=LAN
add address=172.16.54.136 mac-address=74:DE:2B:5D:D2:57 server=LAN
add address=172.16.54.137 mac-address=6C:6A:77:72:B2:D0 server=LAN
add address=172.16.54.138 mac-address=44:85:00:20:70:CE server=LAN
add address=172.16.54.139 mac-address=3C:52:82:4A:BE:98 server=LAN
add address=172.16.54.140 mac-address=5C:C5:D4:B0:E8:93 server=LAN
add address=172.16.54.141 mac-address=6C:6A:77:74:EA:69 server=LAN
add address=172.16.54.142 mac-address=6C:6A:77:74:C1:C4 server=LAN
add address=172.16.54.144 mac-address=00:25:D3:DF:02:CC server=LAN
add address=172.16.54.145 mac-address=6C:6A:77:73:68:29 server=LAN
add address=172.16.54.147 mac-address=6C:6A:77:74:CC:96 server=LAN
add address=172.16.54.148 mac-address=6C:6A:77:74:E7:62 server=LAN
add address=172.16.54.149 mac-address=6C:6A:77:74:11:4D server=LAN
add address=172.16.54.150 mac-address=20:0D:B0:16:35:7B server=LAN
add address=172.16.54.151 mac-address=6C:6A:77:73:26:BB server=LAN
add address=172.16.54.152 mac-address=70:B5:E8:BC:66:C0 server=LAN
add address=172.16.54.153 mac-address=44:85:00:B3:9C:D2 server=LAN
add address=172.16.54.155 mac-address=E0:9D:31:61:6A:DC server=LAN
add address=172.16.54.156 mac-address=F8:16:54:23:E6:BE server=LAN
add address=172.16.54.157 mac-address=C0:D9:62:E8:9E:C2 server=LAN
add address=172.16.54.158 mac-address=34:02:86:27:DC:A6 server=LAN
add address=172.16.54.159 mac-address=6C:6A:77:72:B3:BB server=LAN
add address=172.16.54.160 mac-address=6C:6A:77:73:1F:90 server=LAN
add address=172.16.54.161 mac-address=E4:54:E8:BF:E1:8E server=LAN
add address=172.16.54.164 mac-address=8C:70:5A:D6:24:EC server=LAN
add address=172.16.54.165 mac-address=E8:2A:EA:4B:3B:CE server=LAN
add address=172.16.54.166 mac-address=F8:16:54:A8:0C:9B server=LAN
add address=172.16.54.167 mac-address=C0:D9:62:E8:91:E0 server=LAN
add address=172.16.54.168 mac-address=64:6C:80:1C:29:25 server=LAN
add address=172.16.54.169 mac-address=70:B5:E8:BC:66:F6 server=LAN
add address=172.16.54.170 mac-address=64:6C:80:1C:B0:25 server=LAN
add address=172.16.54.171 mac-address=66:6C:E6:1C:CF:1E server=LAN
add address=172.16.54.172 mac-address=F8:34:41:7A:29:9D server=LAN
add address=172.16.54.173 mac-address=14:85:7F:27:40:DE server=LAN
add address=172.16.54.174 mac-address=F4:46:37:4E:A9:C6 server=LAN
add address=172.16.54.175 mac-address=F8:34:41:9F:62:2B server=LAN
add address=172.16.54.176 mac-address=30:D0:42:30:A3:79 server=LAN
add address=172.16.54.177 mac-address=74:C6:3B:01:58:6E server=LAN
add address=172.16.54.178 mac-address=6C:88:14:55:34:70 server=LAN
add address=172.16.54.179 mac-address=B8:86:87:AE:18:04 server=LAN
add address=172.16.54.180 mac-address=40:83:DE:B2:5D:19 server=LAN
add address=172.16.54.181 mac-address=B0:35:9F:F7:72:3B server=LAN
add address=172.16.54.185 mac-address=40:83:DE:F0:6A:D0 server=LAN
add address=172.16.54.186 mac-address=40:83:DE:F4:64:6B server=LAN
add address=172.16.54.187 mac-address=40:83:DE:B1:FE:DE server=LAN
add address=172.16.54.188 mac-address=40:83:DE:F4:1A:61 server=LAN
add address=172.16.54.189 mac-address=40:83:DE:F4:63:4C server=LAN
add address=172.16.54.190 mac-address=40:83:DE:B1:FD:F4 server=LAN
add address=172.16.54.191 mac-address=40:83:DE:F4:5E:59 server=LAN
add address=172.16.54.192 mac-address=40:83:DE:B2:5A:2D server=LAN
add address=172.16.54.193 mac-address=40:83:DE:F0:BF:E5 server=LAN
add address=172.16.54.194 mac-address=40:83:DE:F0:69:9D server=LAN
add address=172.16.54.195 mac-address=40:83:DE:F0:64:18 server=LAN
add address=172.16.54.196 mac-address=40:83:DE:F0:C3:98 server=LAN
add address=172.16.54.197 mac-address=40:83:DE:F0:5A:AC server=LAN
add address=172.16.54.198 mac-address=40:83:DE:F0:C9:70 server=LAN
add address=172.16.54.200 mac-address=40:83:DE:F0:53:1C server=LAN
add address=172.16.54.201 mac-address=40:83:DE:B1:FE:DC server=LAN
add address=172.16.54.202 mac-address=40:83:DE:B2:00:DA server=LAN
add address=172.16.54.203 mac-address=40:83:DE:F4:60:AC server=LAN
add address=172.16.54.204 mac-address=40:83:DE:F4:38:99 server=LAN
add address=172.16.54.205 mac-address=40:83:DE:B2:75:09 server=LAN
add address=172.16.54.206 mac-address=40:83:DE:F0:55:18 server=LAN
add address=172.16.54.207 mac-address=40:83:DE:F0:6C:4F server=LAN
add address=172.16.54.208 mac-address=40:83:DE:F0:5A:88 server=LAN
add address=172.16.54.209 mac-address=40:83:DE:F0:5F:85 server=LAN
add address=172.16.54.210 mac-address=40:83:DE:F0:5C:35 server=LAN
add address=172.16.54.211 mac-address=40:83:DE:F0:63:09 server=LAN
add address=172.16.54.212 mac-address=40:83:DE:F0:C8:CB server=LAN
add address=172.16.54.213 mac-address=40:83:DE:F0:C0:78 server=LAN
add address=172.16.54.214 mac-address=40:83:DE:F0:66:F9 server=LAN
add address=172.16.54.215 mac-address=40:83:DE:F0:91:38 server=LAN
add address=172.16.54.216 mac-address=40:83:DE:F0:5C:54 server=LAN
add address=172.16.54.217 mac-address=40:83:DE:F0:64:FF server=LAN
add address=172.16.54.218 mac-address=40:83:DE:F0:60:CA server=LAN
add address=172.16.54.219 mac-address=40:83:DE:F0:56:0D server=LAN
add address=172.16.54.220 mac-address=40:83:DE:F0:67:68 server=LAN
add address=172.16.54.221 mac-address=40:83:DE:F0:66:F2 server=LAN
add address=172.16.54.222 mac-address=6C:88:14:07:48:6C server=LAN
add address=172.16.54.223 mac-address=AC:E0:10:51:41:D3 server=LAN
add address=172.16.54.224 mac-address=F8:94:C2:A2:45:86 server=LAN
add address=172.16.54.226 mac-address=BA:86:87:AE:16:DE server=LAN
add address=172.16.54.227 mac-address=80:86:F2:54:B5:6E server=LAN
add address=172.16.54.228 mac-address=40:83:DE:2E:D2:59 server=LAN
add address=172.16.54.229 mac-address=C8:FF:28:C4:97:9B server=LAN
add address=172.16.54.230 mac-address=AC:E0:10:51:E5:17 server=LAN
add address=172.16.54.231 mac-address=C8:FF:28:C4:97:6A server=LAN
add address=172.16.54.232 mac-address=F4:D1:08:E2:F1:8A server=LAN
add address=172.16.54.233 mac-address=F4:8C:50:D9:EF:31 server=LAN
add address=172.16.54.234 mac-address=74:27:EA:EA:5F:82 server=LAN
add address=172.16.54.235 mac-address=98:2C:BC:B8:5D:E9 server=LAN
add address=172.16.55.53 mac-address=00:0F:EA:58:81:1A server=LAN
add address=172.16.55.152 mac-address=98:5A:EB:DB:C5:3C server=LAN
add address=172.16.55.154 mac-address=00:50:BA:BC:FF:86 server=LAN
add address=172.16.55.176 mac-address=C8:60:00:B5:9A:BA server=LAN
add address=172.16.55.184 mac-address=20:89:84:BD:C4:8D server=LAN
add address=172.16.55.195 mac-address=C4:85:08:1A:1A:1C server=LAN
add address=172.16.55.196 mac-address=00:08:CA:46:34:E5 server=LAN
add address=172.16.55.235 mac-address=F8:BC:12:44:50:6E server=LAN
add address=172.16.56.131 mac-address=00:13:E8:D0:B5:DD server=LAN
add address=172.16.56.132 mac-address=00:21:6A:6A:2D:8C server=LAN
add address=172.16.56.133 mac-address=00:25:D3:DF:22:04 server=LAN
add address=172.16.56.135 mac-address=00:26:5E:70:BC:FE server=LAN
add address=172.16.56.136 mac-address=00:26:82:7D:C6:51 server=LAN
add address=172.16.56.139 mac-address=1C:4B:D6:69:72:86 server=LAN
add address=172.16.56.141 mac-address=24:FD:52:9B:0D:36 server=LAN
add address=172.16.56.142 mac-address=24:FD:52:A2:F7:35 server=LAN
add address=172.16.56.143 mac-address=2C:D0:5A:5A:A9:48 server=LAN
add address=172.16.56.144 mac-address=34:51:C9:2E:34:8A server=LAN
add address=172.16.56.145 mac-address=48:5D:60:52:D5:4C server=LAN
add address=172.16.56.146 mac-address=48:5D:60:7C:D6:E5 server=LAN
add address=172.16.56.147 mac-address=48:5D:60:92:67:11 server=LAN
add address=172.16.56.148 mac-address=48:F8:B3:7B:DE:FB server=LAN
add address=172.16.56.149 mac-address=4C:8D:79:22:40:AB server=LAN
add address=172.16.56.150 mac-address=4C:ED:DE:00:DA:39 server=LAN
add address=172.16.56.151 mac-address=4C:ED:DE:4E:AD:5C server=LAN
add address=172.16.56.152 mac-address=68:96:7B:14:92:17 server=LAN
add address=172.16.56.153 mac-address=68:A3:C4:3E:04:4F server=LAN
add address=172.16.56.154 mac-address=6C:71:D9:7A:9B:56 server=LAN
add address=172.16.56.155 mac-address=70:1A:04:E1:82:C5 server=LAN
add address=172.16.56.156 mac-address=74:2F:68:00:22:3B server=LAN
add address=172.16.56.157 mac-address=74:2F:68:93:B4:1A server=LAN
add address=172.16.56.158 mac-address=74:2F:68:93:B6:4D server=LAN
add address=172.16.56.159 mac-address=74:2F:68:E0:B6:0F server=LAN
add address=172.16.56.160 mac-address=74:2F:68:EA:EF:A0 server=LAN
add address=172.16.56.161 mac-address=74:F0:6D:2A:C8:41 server=LAN
add address=172.16.56.162 mac-address=74:F0:6D:2A:FF:5E server=LAN
add address=172.16.56.163 mac-address=74:F0:6D:91:0C:64 server=LAN
add address=172.16.56.164 mac-address=78:E4:00:F9:CE:C7 server=LAN
add address=172.16.56.165 mac-address=7C:C5:37:9A:1F:AA server=LAN
add address=172.16.56.166 mac-address=80:19:34:C1:FB:2E server=LAN
add address=172.16.56.167 mac-address=80:BE:05:22:07:B8 server=LAN
add address=172.16.56.168 mac-address=80:EA:96:E0:A5:8A server=LAN
add address=172.16.56.169 mac-address=90:48:9A:F3:FB:1F server=LAN
add address=172.16.56.170 mac-address=98:B8:E3:4D:E9:C2 server=LAN
add address=172.16.56.171 mac-address=98:B8:E3:F0:2D:F0 server=LAN
add address=172.16.56.172 mac-address=A0:88:69:26:69:89 server=LAN
add address=172.16.56.173 mac-address=A4:B8:05:6D:AD:7A server=LAN
add address=172.16.56.174 mac-address=AC:B5:7D:70:75:83 server=LAN
add address=172.16.56.175 mac-address=AC:FD:EC:9A:70:B8 server=LAN
add address=172.16.56.176 mac-address=AC:FD:EC:9F:AC:CA server=LAN
add address=172.16.56.177 mac-address=B8:03:05:B1:CA:B0 server=LAN
add address=172.16.56.178 mac-address=B8:EE:65:08:F5:BB server=LAN
add address=172.16.56.179 mac-address=B8:EE:65:09:0D:73 server=LAN
add address=172.16.56.180 mac-address=B8:EE:65:0B:69:77 server=LAN
add address=172.16.56.181 mac-address=B8:EE:65:0B:81:0A server=LAN
add address=172.16.56.182 mac-address=C0:CB:38:8C:4F:BF server=LAN
add address=172.16.56.183 mac-address=D0:DF:9A:F5:FF:BB server=LAN
add address=172.16.56.184 mac-address=D8:BB:2C:4E:0F:B4 server=LAN
add address=172.16.56.185 mac-address=E0:06:E6:80:D0:2B server=LAN
add address=172.16.56.186 mac-address=E0:06:E6:F4:67:2F server=LAN
add address=172.16.56.187 mac-address=E4:D5:3D:A1:D5:07 server=LAN
add address=172.16.56.189 mac-address=E8:39:DF:32:A2:3F server=LAN
add address=172.16.56.190 mac-address=70:1A:04:E1:83:5A server=LAN
add address=172.16.56.191 mac-address=FC:F8:AE:A3:F5:AC server=LAN
add address=172.16.56.192 mac-address=C0:BD:D1:1C:CA:98 server=LAN
add address=172.16.56.193 mac-address=70:56:81:C2:DD:55 server=LAN
add address=172.16.56.194 mac-address=E0:06:E6:F4:65:EB server=LAN
add address=172.16.56.195 mac-address=54:9F:13:CD:9A:48 server=LAN
add address=172.16.56.196 mac-address=9C:2A:70:C2:34:E7 server=LAN
add address=172.16.56.197 mac-address=5C:8D:4E:56:A2:45 server=LAN
add address=172.16.56.198 mac-address=20:47:47:66:26:93 server=LAN
add address=172.16.56.199 mac-address=20:47:47:66:28:AF server=LAN
add address=172.16.56.200 mac-address=60:57:18:64:80:C5 server=LAN
add address=172.16.56.201 mac-address=54:EE:75:51:73:4D server=LAN
add address=172.16.56.202 mac-address=28:D2:44:EC:53:15 server=LAN
add address=172.16.56.203 mac-address=20:6A:8A:6A:8A:82 server=LAN
add address=172.16.56.205 mac-address=6C:8D:C1:BB:FF:93 server=LAN
add address=172.16.56.206 mac-address=CC:44:63:D2:81:3C server=LAN
add address=172.16.56.207 mac-address=2C:20:0B:BB:35:0E server=LAN
add address=172.16.56.208 mac-address=7C:7A:91:64:DA:CF server=LAN
add address=172.16.56.209 mac-address=60:67:20:30:5F:5C server=LAN
add address=172.16.56.210 mac-address=14:AB:C5:7C:C5:DB server=LAN
add address=172.16.56.211 mac-address=44:85:00:0C:86:09 server=LAN
add address=172.16.56.212 mac-address=60:A4:4C:7A:FB:EB server=LAN
add address=172.16.56.213 mac-address=30:F7:72:40:D3:13 server=LAN
add address=172.16.56.214 mac-address=74:E5:0B:19:6D:B4 server=LAN
add address=172.16.56.215 mac-address=94:B8:6D:D7:78:41 server=LAN
add address=172.16.56.216 mac-address=F4:D1:08:59:0F:6A server=LAN
add address=172.16.56.217 mac-address=50:76:AF:D8:2D:EA server=LAN
add address=172.16.56.218 mac-address=28:D2:44:7F:D7:2A server=LAN
add address=172.16.56.219 mac-address=2C:D4:44:BB:D4:D5 server=LAN
add address=172.16.56.220 mac-address=3C:95:09:A1:63:E1 server=LAN
add address=172.16.56.221 mac-address=34:02:86:37:DB:B5 server=LAN
add address=172.16.56.222 mac-address=20:0D:B0:16:56:D4 server=LAN
add address=172.16.56.226 mac-address=A4:D9:90:09:F6:29 server=LAN
add address=172.16.57.100 mac-address=00:23:24:B8:91:D5 server=LAN
add address=172.16.60.1 mac-address=00:23:24:B8:92:63 server=LAN
add address=172.16.60.2 mac-address=00:23:24:B8:8C:78 server=LAN
add address=172.16.60.3 mac-address=00:23:24:B8:92:9E server=LAN
add address=172.16.60.4 mac-address=00:23:24:BC:0C:24 server=LAN
add address=172.16.60.5 mac-address=00:23:24:B5:14:DB server=LAN
add address=172.16.60.6 mac-address=00:23:24:B7:3D:8B server=LAN
add address=172.16.60.7 mac-address=00:23:24:B8:8D:E6 server=LAN
add address=172.16.60.8 mac-address=00:23:24:BC:0C:D2 server=LAN
add address=172.16.60.9 mac-address=00:23:24:B8:8F:56 server=LAN
add address=172.16.60.10 mac-address=00:23:24:BC:0B:E5 server=LAN
add address=172.16.60.11 mac-address=00:23:24:B8:90:95 server=LAN
add address=172.16.60.12 mac-address=00:23:24:BC:0C:BD server=LAN
add address=172.16.60.13 mac-address=00:23:24:B8:91:25 server=LAN
add address=172.16.60.14 mac-address=00:23:24:B8:8E:E4 server=LAN
add address=172.16.60.15 mac-address=00:23:24:B8:8E:1D server=LAN
add address=172.16.60.16 mac-address=00:23:24:BC:0C:D1 server=LAN
add address=172.16.60.17 mac-address=00:23:24:B8:8E:55 server=LAN
add address=172.16.60.18 mac-address=00:23:24:BC:0E:0C server=LAN
add address=172.16.60.19 mac-address=00:23:24:B8:8E:98 server=LAN
add address=172.16.60.21 mac-address=00:23:24:E6:B8:E6 server=LAN
add address=172.16.60.22 mac-address=00:23:24:E6:B8:A6 server=LAN
add address=172.16.60.23 mac-address=00:23:24:E6:B9:17 server=LAN
add address=172.16.60.24 mac-address=00:23:24:E1:FB:0F server=LAN
add address=172.16.60.25 mac-address=00:23:24:E6:B7:AD server=LAN
add address=172.16.60.26 mac-address=00:23:24:E6:B8:D9 server=LAN
add address=172.16.60.27 mac-address=00:23:24:E6:B5:AE server=LAN
add address=172.16.60.28 mac-address=00:23:24:E6:B9:9C server=LAN
add address=172.16.60.29 mac-address=00:23:24:E6:B5:C5 server=LAN
add address=172.16.60.30 mac-address=00:23:24:E6:B8:5F server=LAN
add address=172.16.60.31 mac-address=00:23:24:E6:BA:CE server=LAN
add address=172.16.60.32 mac-address=00:23:24:B8:92:37 server=LAN
add address=172.16.60.34 mac-address=00:23:24:E6:B7:01 server=LAN
add address=172.16.60.35 mac-address=00:23:24:E4:8D:14 server=LAN
add address=172.16.60.36 mac-address=00:23:24:E6:B9:2B server=LAN
add address=172.16.60.37 mac-address=00:23:24:E6:B8:A8 server=LAN
add address=172.16.60.38 mac-address=00:23:24:E3:BD:1F server=LAN
add address=172.16.60.39 mac-address=00:23:24:E9:70:ED server=LAN
add address=172.16.60.40 mac-address=00:23:24:E3:BD:9E server=LAN
add address=172.16.60.41 mac-address=00:23:24:E6:B8:D2 server=LAN
add address=172.16.60.42 mac-address=00:23:24:E3:BE:0E server=LAN
add address=172.16.60.43 mac-address=00:23:24:E6:B7:5C server=LAN
add address=172.16.60.44 mac-address=00:23:24:E6:B9:D1 server=LAN
add address=172.16.60.45 mac-address=00:23:24:E6:BA:77 server=LAN
add address=172.16.60.46 mac-address=00:23:24:E6:B6:1E server=LAN
add address=172.16.60.47 mac-address=00:23:24:E6:B6:BE server=LAN
add address=172.16.60.48 mac-address=00:23:24:E6:B8:5C server=LAN
add address=172.16.60.49 mac-address=00:23:24:E6:BA:35 server=LAN
add address=172.16.60.50 mac-address=00:23:24:E6:B5:9C server=LAN
add address=172.16.60.51 mac-address=00:23:24:E6:BA:DC server=LAN
add address=172.16.60.52 mac-address=00:23:24:E1:FF:61 server=LAN
add address=172.16.60.53 mac-address=00:23:24:E6:B9:B1 server=LAN
add address=172.16.60.54 mac-address=00:23:24:E4:8B:2A server=LAN
add address=172.16.60.55 mac-address=00:23:24:E6:BA:7C server=LAN
add address=172.16.60.56 mac-address=00:23:24:E6:B9:B2 server=LAN
add address=172.16.60.57 mac-address=00:23:24:E6:B8:8F server=LAN
add address=172.16.60.58 mac-address=00:23:24:E6:B9:4A server=LAN
add address=172.16.60.59 mac-address=00:23:24:E2:03:DB server=LAN
add address=172.16.60.60 mac-address=00:23:24:E6:B6:03 server=LAN
add address=172.16.60.61 mac-address=00:23:24:E1:FC:6C server=LAN
add address=172.16.60.62 mac-address=00:23:24:E5:99:F7 server=LAN
add address=172.16.60.63 mac-address=00:23:24:E6:B6:19 server=LAN
add address=172.16.60.64 mac-address=00:23:24:E6:BA:53 server=LAN
add address=172.16.60.65 mac-address=00:23:24:E3:BE:1E server=LAN
add address=172.16.60.66 mac-address=00:23:24:E6:B5:CA server=LAN
add address=172.16.60.67 mac-address=00:23:24:E6:B8:AB server=LAN
add address=172.16.60.68 mac-address=00:23:24:E6:BA:85 server=LAN
add address=172.16.60.69 mac-address=00:23:24:E6:B6:73 server=LAN
add address=172.16.60.70 mac-address=00:23:24:BC:0C:21 server=LAN
add address=172.16.60.71 mac-address=00:23:24:E3:BD:00 server=LAN
add address=172.16.60.72 mac-address=00:23:24:B8:8E:11 server=LAN
add address=172.16.60.73 mac-address=00:23:24:E1:FF:55 server=LAN
add address=172.16.60.74 mac-address=00:23:24:E6:BB:17 server=LAN
add address=172.16.60.75 mac-address=00:23:24:E2:03:43 server=LAN
add address=172.16.60.76 mac-address=00:23:24:BC:0D:14 server=LAN
add address=172.16.60.77 mac-address=00:23:24:E6:B6:00 server=LAN
add address=172.16.60.78 mac-address=00:23:24:E6:BA:51 server=LAN
add address=172.16.60.79 mac-address=00:23:24:E6:B5:43 server=LAN
add address=172.16.60.80 mac-address=00:23:24:BC:0A:E4 server=LAN
add address=172.16.60.81 mac-address=00:23:24:B7:3A:5C server=LAN
add address=172.16.60.82 mac-address=00:23:24:B8:8D:FE server=LAN
add address=172.16.60.83 mac-address=00:23:24:E6:B6:61 server=LAN
add address=172.16.60.84 mac-address=00:23:24:BC:0D:05 server=LAN
add address=172.16.60.85 mac-address=00:23:24:E7:34:56 server=LAN
add address=172.16.60.86 mac-address=00:23:24:E6:B7:67 server=LAN
add address=172.16.60.87 mac-address=00:23:24:E6:B5:7F server=LAN
add address=172.16.60.88 mac-address=00:23:24:BC:0A:D9 server=LAN
add address=172.16.60.89 mac-address=00:23:24:E6:B9:AC server=LAN
add address=172.16.60.91 mac-address=00:23:24:E6:B9:06 server=LAN
add address=172.16.60.92 mac-address=00:23:24:E6:BA:40 server=LAN
add address=172.16.60.93 mac-address=00:23:24:E6:B9:60 server=LAN
add address=172.16.60.94 mac-address=00:23:24:E6:B8:E7 server=LAN
add address=172.16.60.95 mac-address=D0:57:7B:64:6E:1E server=LAN
add address=172.16.60.96 mac-address=00:23:24:BC:0D:23 server=LAN
add address=172.16.60.98 mac-address=00:23:24:E6:B9:5A server=LAN
add address=172.16.60.99 mac-address=00:23:24:B8:8D:6C server=LAN
add address=172.16.60.101 mac-address=00:23:24:BC:0B:95 server=LAN
add address=172.16.60.102 mac-address=00:23:24:E6:BB:5C server=LAN
add address=172.16.60.103 mac-address=00:23:24:B8:8E:6F server=LAN
add address=172.16.60.104 mac-address=C8:21:58:4B:85:34 server=LAN
add address=172.16.60.105 mac-address=00:23:24:E6:B7:AF server=LAN
add address=172.16.60.106 mac-address=00:23:24:BC:0C:F8 server=LAN
add address=172.16.60.107 mac-address=00:23:24:B8:92:0C server=LAN
add address=172.16.60.108 mac-address=00:23:24:E6:B9:16 server=LAN
add address=172.16.60.109 mac-address=00:23:24:E4:8C:D6 server=LAN
add address=172.16.60.110 mac-address=00:23:24:B8:8C:E4 server=LAN
add address=172.16.60.111 mac-address=00:23:24:B8:8E:34 server=LAN
add address=172.16.60.112 mac-address=00:23:24:BC:0D:7F server=LAN
add address=172.16.60.114 mac-address=00:23:24:E3:BD:04 server=LAN
add address=172.16.60.115 mac-address=00:23:24:E6:B5:BE server=LAN
add address=172.16.60.116 mac-address=00:23:24:B8:8E:A5 server=LAN
add address=172.16.60.117 mac-address=00:23:24:E6:B5:B3 server=LAN
add address=172.16.60.118 mac-address=00:23:24:BC:0B:C4 server=LAN
add address=172.16.60.119 mac-address=00:23:24:BC:0C:29 server=LAN
add address=172.16.60.120 mac-address=00:23:24:BC:0B:6F server=LAN
add address=172.16.60.121 mac-address=00:23:24:E6:B9:D5 server=LAN
add address=172.16.60.122 mac-address=00:23:24:E3:BC:EC server=LAN
add address=172.16.60.123 mac-address=00:23:24:B5:0F:1C server=LAN
add address=172.16.60.124 mac-address=00:23:24:BC:0D:7D server=LAN
add address=172.16.60.125 mac-address=00:23:24:E3:BC:F4 server=LAN
add address=172.16.60.126 mac-address=00:23:24:B8:8D:ED server=LAN
add address=172.16.60.127 mac-address=00:23:24:E6:B9:83 server=LAN
add address=172.16.60.128 mac-address=00:23:24:BC:0C:E2 server=LAN
add address=172.16.60.129 mac-address=00:23:24:BC:52:D3 server=LAN
add address=172.16.60.130 mac-address=00:23:24:BC:0B:77 server=LAN
add address=172.16.60.131 mac-address=00:23:24:E6:B6:54 server=LAN
add address=172.16.60.132 mac-address=00:23:24:E2:00:55 server=LAN
add address=172.16.60.133 mac-address=00:23:24:B8:8F:3E server=LAN
add address=172.16.60.134 mac-address=00:23:24:B8:90:10 server=LAN
add address=172.16.60.135 mac-address=00:23:24:E6:B8:C9 server=LAN
add address=172.16.60.136 mac-address=00:23:24:E1:FB:31 server=LAN
add address=172.16.60.139 mac-address=00:23:24:E6:BA:36 server=LAN
add address=172.16.60.140 mac-address=00:23:24:BC:0C:C2 server=LAN
add address=172.16.60.141 mac-address=00:23:24:B8:91:BE server=LAN
add address=172.16.60.142 mac-address=00:23:24:E3:BD:0C server=LAN
add address=172.16.60.143 mac-address=00:23:24:BC:0C:C7 server=LAN
add address=172.16.60.144 mac-address=00:23:24:E2:01:63 server=LAN
add address=172.16.60.145 mac-address=00:23:24:E6:B9:43 server=LAN
add address=172.16.60.146 mac-address=00:23:24:B8:8F:1C server=LAN
add address=172.16.60.147 mac-address=00:23:24:E5:99:8B server=LAN
add address=172.16.60.148 mac-address=00:23:24:E6:B9:AB server=LAN
add address=172.16.60.149 mac-address=00:23:24:E4:8D:16 server=LAN
add address=172.16.60.150 mac-address=00:23:24:E6:B9:35 server=LAN
add address=172.16.60.151 mac-address=00:23:24:E6:B5:B0 server=LAN
add address=172.16.60.152 mac-address=00:23:24:BC:0A:FA server=LAN
add address=172.16.60.153 mac-address=00:23:24:E3:BD:C3 server=LAN
add address=172.16.60.154 mac-address=00:23:24:E6:B5:62 server=LAN
add address=172.16.60.156 mac-address=00:23:24:E1:FB:9F server=LAN
add address=172.16.60.157 mac-address=00:23:24:E6:B5:7C server=LAN
add address=172.16.60.158 mac-address=00:23:24:E6:B8:F6 server=LAN
add address=172.16.60.159 mac-address=00:23:24:E6:BA:97 server=LAN
add address=172.16.60.160 mac-address=00:23:24:E6:BB:1E server=LAN
add address=172.16.60.161 mac-address=00:23:24:E2:04:30 server=LAN
add address=172.16.60.162 mac-address=00:23:24:E2:02:C6 server=LAN
add address=172.16.60.163 mac-address=00:23:24:E6:B8:93 server=LAN
add address=172.16.60.164 mac-address=00:23:24:BC:0D:DE server=LAN
add address=172.16.60.165 mac-address=00:23:24:B8:8D:3B server=LAN
add address=172.16.60.166 mac-address=00:23:24:E7:32:35 server=LAN
add address=172.16.60.167 mac-address=00:23:24:E6:B9:66 server=LAN
add address=172.16.60.168 mac-address=00:23:24:E6:B7:29 server=LAN
add address=172.16.60.169 mac-address=00:23:24:BC:0A:DA server=LAN
add address=172.16.60.170 mac-address=00:23:24:B8:8E:52 server=LAN
add address=172.16.60.171 mac-address=00:23:24:E6:BB:26 server=LAN
add address=172.16.60.172 mac-address=00:23:24:E1:FF:51 server=LAN
add address=172.16.60.174 mac-address=00:23:24:E6:B5:AC server=LAN
add address=172.16.60.176 mac-address=00:23:24:E6:BA:E4 server=LAN
add address=172.16.60.177 mac-address=00:23:24:E6:BA:25 server=LAN
add address=172.16.60.179 mac-address=00:23:24:DB:C5:54 server=LAN
add address=172.16.60.180 mac-address=00:23:24:B8:91:22 server=LAN
add address=172.16.60.181 mac-address=00:23:24:E5:99:56 server=LAN
add address=172.16.60.182 mac-address=00:23:24:B8:8F:E5 server=LAN
add address=172.16.60.183 mac-address=00:23:24:B8:8C:7A server=LAN
add address=172.16.60.184 mac-address=00:23:24:D5:D5:F7 server=LAN
add address=172.16.60.185 mac-address=00:23:24:E1:FF:41 server=LAN
add address=172.16.60.186 mac-address=00:23:24:E6:BA:C5 server=LAN
add address=172.16.60.187 mac-address=00:23:24:BC:0B:5B server=LAN
add address=172.16.60.188 mac-address=00:23:24:E4:8D:09 server=LAN
add address=172.16.60.190 mac-address=00:23:24:B8:8E:FF server=LAN
add address=172.16.60.194 mac-address=00:23:24:E6:BA:8E server=LAN
add address=172.16.60.195 mac-address=00:23:24:E1:FB:EF server=LAN
add address=172.16.60.196 mac-address=00:23:24:E6:BA:87 server=LAN
add address=172.16.60.197 mac-address=00:23:24:E6:BB:04 server=LAN
add address=172.16.60.199 mac-address=00:23:24:E3:BD:DA server=LAN
add address=172.16.60.200 mac-address=00:23:24:E6:B8:D6 server=LAN
add address=172.16.60.201 mac-address=00:23:24:E6:B5:7D server=LAN
add address=172.16.60.202 mac-address=00:23:24:E1:FF:3A server=LAN
add address=172.16.60.203 mac-address=00:23:24:E6:B7:7A server=LAN
add address=172.16.60.204 mac-address=00:23:24:E6:B9:1E server=LAN
add address=172.16.60.205 mac-address=00:23:24:E6:B9:84 server=LAN
add address=172.16.60.206 mac-address=00:23:24:E6:B9:30 server=LAN
add address=172.16.60.207 mac-address=00:23:24:E7:33:F4 server=LAN
add address=172.16.60.208 mac-address=00:23:24:BC:0D:F0 server=LAN
add address=172.16.60.209 mac-address=00:23:24:E6:B8:E8 server=LAN
add address=172.16.60.210 mac-address=00:23:24:E3:BE:18 server=LAN
add address=172.16.60.211 mac-address=18:4F:32:59:70:CD server=LAN
add address=172.16.60.212 mac-address=00:23:24:E5:9A:10 server=LAN
add address=172.16.60.213 mac-address=00:23:24:E7:31:8E server=LAN
add address=172.16.60.214 mac-address=A8:1E:84:D7:B6:70 server=LAN
add address=172.16.60.215 mac-address=A8:1E:84:D7:B6:80 server=LAN
add address=172.16.60.216 mac-address=A8:1E:84:D7:B6:4A server=LAN
add address=172.16.60.217 mac-address=A8:1E:84:D7:B6:63 server=LAN
add address=172.16.60.218 mac-address=A8:1E:84:D7:B6:72 server=LAN
add address=172.16.60.219 mac-address=F8:34:41:79:0D:6F server=LAN
add address=172.16.60.220 mac-address=A8:1E:84:D7:B6:5D server=LAN
add address=172.16.60.221 mac-address=A8:1E:84:D7:B6:44 server=LAN
add address=172.16.60.222 mac-address=F8:34:41:79:30:83 server=LAN
add address=172.16.60.223 mac-address=A8:1E:84:D7:B6:62 server=LAN
add address=172.16.60.224 mac-address=F8:34:41:79:43:48 server=LAN
add address=172.16.60.225 mac-address=A8:1E:84:BC:B3:71 server=LAN
add address=172.16.60.226 mac-address=00:23:24:E6:B7:12 server=LAN
add address=172.16.60.227 mac-address=FC:45:96:9D:4F:A9 server=LAN
add address=172.16.60.228 mac-address=A8:1E:84:D7:B7:54 server=LAN
add address=172.16.60.229 mac-address=A8:1E:84:D7:B7:38 server=LAN
add address=172.16.60.231 mac-address=A8:1E:84:D7:B7:39 server=LAN
add address=172.16.60.232 mac-address=C8:21:58:5E:D9:9A server=LAN
add address=172.16.60.233 mac-address=34:F6:4B:5D:C6:D1 server=LAN
add address=172.16.60.234 mac-address=00:23:24:E6:B5:37 server=LAN
add address=172.16.60.235 mac-address=A8:1E:84:D7:B6:81 server=LAN
add address=172.16.60.237 mac-address=00:40:FF:0C:75:C4 server=LAN
add address=172.16.60.238 mac-address=D8:C4:97:45:92:58 server=LAN
add address=172.16.60.239 mac-address=D8:C4:97:45:92:6E server=LAN
add address=172.16.60.240 mac-address=D8:C4:97:45:92:73 server=LAN
add address=172.16.60.241 mac-address=00:24:D6:D6:AF:24 server=LAN
add address=172.16.60.242 mac-address=A8:1E:84:D7:B7:52 server=LAN
add address=172.16.60.243 mac-address=D8:C4:97:45:92:64 server=LAN
add address=172.16.60.244 mac-address=D8:C4:97:45:92:82 server=LAN
add address=172.16.60.245 mac-address=B0:C0:90:16:D6:E7 server=LAN
add address=172.16.60.246 mac-address=D8:C4:97:45:92:B7 server=LAN
add address=172.16.60.247 mac-address=48:E2:44:BB:BA:E1 server=LAN
add address=172.16.60.248 mac-address=24:FD:52:A0:37:B7 server=LAN
add address=172.16.60.249 mac-address=D8:C4:97:45:92:A0 server=LAN
add address=172.16.60.250 mac-address=B0:C0:90:15:2A:0B server=LAN
add address=172.16.60.251 mac-address=00:23:24:E1:FB:DE server=LAN
add address=172.16.60.252 mac-address=00:23:24:E6:B8:82 server=LAN
add address=172.16.60.253 mac-address=00:01:2E:48:8A:D2 server=LAN
add address=172.16.60.254 mac-address=50:7B:9D:37:EF:77 server=LAN
add address=172.16.60.255 mac-address=00:23:24:E6:BA:0A server=LAN
add address=172.16.63.114 mac-address=40:F0:2F:22:F2:76 server=LAN
/ip dhcp-server network
add address=172.16.48.0/20 dhcp-option=nirwana dns-server=\
    172.16.50.38,172.16.50.40,172.16.50.81 gateway=172.16.48.2
/ip dns
set allow-remote-requests=yes servers=172.16.1.30,202.152.5.36
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
add address=172.16.100.11 name=www.nirwanalestari.com
add address=172.18.16.213 name=saps4sbxdb.sap.delfilimited.com
add address=172.18.16.195 name=saps4sbxapp1.sap.delfilimited.com
add address=172.16.133.60 disabled=yes name=myhr.sap.delfilimited.com
add address=172.16.134.65 disabled=yes name=myhr.sin.sap.delfilimited.com
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
add address=172.17.249.0/24 list=nl-guest-vip
add address=172.17.251.0/24 list=nl-delfi-vip
add address=172.17.250.0/24 list=nl-delfi-vvip
add address=182.23.104.112/29 list=nl-orion
add address=172.16.51.35 list=nl-delfi-vvip
/ip firewall filter
add action=accept chain=output comment="ALLOW TO CERES" dst-address=\
    172.16.1.30 src-address=172.16.48.2
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.16.48.2
add action=accept chain=forward dst-address=172.16.1.126 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.3 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.2.9 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.2.11 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.2.12 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.9 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.7 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.0.19 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.22 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.3.101 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.3.101 src-address=\
    172.16.248.0/21
add action=accept chain=forward dst-address=172.16.1.5 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.5 src-address=\
    172.16.248.0/21
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.16.50.81
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.16.50.40
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.16.50.38
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.16.48.0/20
add action=accept chain=forward dst-address=172.16.1.30 src-address=\
    172.17.240.0/20
add action=accept chain=forward dst-address=172.16.0.0/22 src-address=\
    172.16.52.141
add action=accept chain=forward dst-address=172.16.0.0/22 src-address=\
    172.16.60.208
add action=accept chain=forward dst-address=172.16.240.0/20 src-address=\
    172.16.52.141
add action=accept chain=forward dst-address=172.16.240.0/20 src-address=\
    172.16.60.208
add action=accept chain=forward dst-address=172.16.2.183 src-address=\
    172.16.60.172
add action=drop chain=forward comment="BLOK KE CERES" dst-address=\
    172.16.0.0/22 src-address=172.16.48.0/20
add action=drop chain=output dst-address=172.16.0.0/22 src-address=\
    172.16.48.0/20
/ip firewall mangle
add action=mark-connection chain=prerouting comment="CONN JATILUHUR" \
    dst-address=172.16.100.0/22 new-connection-mark=conn-jah passthrough=yes \
    src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.120.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.200.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.220.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.73 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.74 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.75 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.76 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.77 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.78 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address=172.16.100.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.120.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.200.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.220.0/22 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.73 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.74 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.75 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.76 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.77 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-connection chain=prerouting dst-address=172.16.50.78 \
    new-connection-mark=conn-jah passthrough=yes src-address=172.17.240.0/20
add action=mark-packet chain=prerouting connection-mark=conn-jah \
    new-packet-mark=mark-jah passthrough=no
add action=mark-connection chain=prerouting comment=CONN-INTERNET \
    dst-address-list=!private new-connection-mark=conn-internet passthrough=\
    yes src-address=172.16.48.0/20
add action=mark-connection chain=prerouting dst-address-list=!private \
    new-connection-mark=conn-internet passthrough=yes src-address=\
    172.17.240.0/20
add action=mark-packet chain=prerouting connection-mark=conn-internet \
    new-packet-mark=mark-internet passthrough=no
add action=mark-connection chain=forward comment=NL-VIP dst-address-list=\
    !private new-connection-mark=conn-nl-vip passthrough=yes \
    src-address-list=nl-guest-vip
add action=mark-connection chain=forward dst-address-list=!private \
    new-connection-mark=conn-nl-vip passthrough=yes src-address-list=\
    nl-delfi-vip
add action=mark-packet chain=forward connection-mark=conn-nl-vip \
    new-packet-mark=mark-nl-vip passthrough=no
add action=mark-connection chain=forward comment=NL-VVIP dst-address-list=\
    !private new-connection-mark=conn-nl-vvip passthrough=yes \
    src-address-list=nl-delfi-vvip
add action=mark-packet chain=forward connection-mark=conn-nl-vvip \
    new-packet-mark=mark-nl-vvip passthrough=no
add action=mark-connection chain=forward comment=NL-ORION dst-address-list=\
    !private new-connection-mark=conn-nl-orion passthrough=yes \
    src-address-list=nl-orion
add action=mark-packet chain=forward connection-mark=conn-nl-orion \
    new-packet-mark=mark-nl-orion passthrough=no
/ip firewall nat
add action=masquerade chain=srcnat dst-address=172.16.50.89 out-interface=\
    ether2-TO_LAN src-address=10.29.1.0/24
/ip route
add distance=1 gateway=172.16.48.4 routing-mark=TES
add disabled=yes distance=1 dst-address=172.16.220.0/22 gateway=10.100.2.9
add distance=1 dst-address=172.17.240.0/20 gateway=172.16.48.100
add distance=1 dst-address=172.31.0.0/22 gateway=172.16.48.18
/ip route rule
add src-address=172.17.248.0/24 table=TES
add src-address=172.17.240.0/24 table=TES
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=212
set api disabled=yes
set api-ssl disabled=yes
/routing bgp network
add network=172.16.48.0/20 synchronize=no
add network=172.17.240.0/20 synchronize=no
add network=182.23.98.152/29 synchronize=no
add network=182.23.104.112/29 synchronize=no
add network=182.23.37.200/29 synchronize=no
add network=202.152.28.64/28 synchronize=no
add network=202.152.59.160/29 synchronize=no
add network=10.1.1.2/32 synchronize=no
add network=172.31.0.0/22 synchronize=no
/routing bgp peer
add in-filter=JAH name=JAH remote-address=10.100.2.9 remote-as=64514
add in-filter=JAH-BACKUP name=JAH-BACKUP remote-address=10.100.3.9 remote-as=\
    64514
/routing filter
add action=accept chain=JAH prefix=0.0.0.0/0
add action=accept chain=JAH prefix=172.16.100.0/22
add action=accept chain=JAH prefix=172.16.128.0/22
add action=accept chain=JAH prefix=172.16.200.0/22
add action=accept chain=JAH prefix=172.18.1.0/24
add action=accept chain=JAH prefix=172.16.50.73
add action=accept chain=JAH prefix=172.16.50.74
add action=accept chain=JAH prefix=172.16.50.75
add action=accept chain=JAH prefix=172.16.50.76
add action=accept chain=JAH prefix=172.16.50.77
add action=accept chain=JAH prefix=172.16.50.78
add action=discard chain=JAH
add action=accept chain=JAH-BACKUP prefix=0.0.0.0/0 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.100.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.128.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.200.0/22 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.18.1.0/24 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.73 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.74 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.75 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.76 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.77 set-bgp-prepend=5
add action=accept chain=JAH-BACKUP prefix=172.16.50.78 set-bgp-prepend=5
add action=discard chain=JAH-BACKUP
/snmp
set enabled=yes trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=2022333132-NL_BEKASI
/system ntp client
set enabled=yes primary-ntp=103.123.108.224 secondary-ntp=103.87.68.2
