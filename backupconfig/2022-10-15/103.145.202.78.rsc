# oct/15/2022 05:00:11 by RouterOS 6.48.4
# software id = 60W2-H6YQ
#
# model = CCR1036-8G-2S+
# serial number = D83B0CAF867B
/interface vlan
add interface=sfp-sfpplus1 name=LANET vlan-id=208
add interface=sfp-sfpplus1 name=PRTG vlan-id=107
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/snmp community
add addresses=::/0 name=lapublic
/dude
set enabled=yes
/interface l2tp-server server
set authentication=mschap2 default-profile=default enabled=yes max-mru=2000 \
    max-mtu=2000 mrru=2000
/interface pptp-server server
set enabled=yes
/ip address
add address=103.145.202.78/30 interface=LANET network=103.145.202.76
add address=172.20.0.210/30 interface=PRTG network=172.20.0.208
/ip dns
set servers=202.152.0.2,202.152.5.36
/ip firewall nat
add action=masquerade chain=srcnat out-interface=LANET
add action=dst-nat chain=dstnat comment="2021251540-UPT PENGUJIAN KIR" \
    dst-address=103.145.202.78 dst-port=8002 protocol=tcp to-addresses=\
    172.168.1.48 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.48 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251542-ALUN ALUN LEMBANG" \
    dst-address=103.145.202.78 dst-port=8004 protocol=tcp to-addresses=\
    172.168.1.144 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.144 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251543-ALUN ALUN CILILIN" \
    dst-address=103.145.202.78 dst-port=8005 protocol=tcp to-addresses=\
    172.168.1.5 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.5 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2021251544-PASAR UMKM KEBUN RAYA CIBODAS" dst-address=103.145.202.78 \
    dst-port=8006 protocol=tcp to-addresses=172.168.1.6 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.6 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251548-TERMINAL PASIR HAYAM" \
    dst-address=103.145.202.78 dst-port=8009 protocol=tcp to-addresses=\
    172.168.1.9 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.9 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251547-RSPD CIANJUR" \
    dst-address=103.145.202.78 dst-port=8010 protocol=tcp to-addresses=\
    172.168.1.10 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.10 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251554-AREA PUSKESMAS CIMALAKA" \
    dst-address=103.145.202.78 dst-port=8015 protocol=tcp to-addresses=\
    172.168.1.15 to-ports=8291
add action=dst-nat chain=dstnat comment=\
    "2021251557-AREA PUSKESMAS TANJUNGMEDAR" dst-address=103.145.202.78 \
    dst-port=8018 protocol=tcp to-addresses=172.168.1.18 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.15 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=src-nat chain=srcnat dst-address=172.168.1.18 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=src-nat chain=srcnat dst-address=172.168.1.19 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021247204-KECAMATAN TIRTAJAYA" \
    dst-address=103.145.202.78 dst-port=8020 protocol=tcp to-addresses=\
    172.168.1.20 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.20 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021257859-MAKAM SYEHQURO" \
    dst-address=103.145.202.78 dst-port=8022 protocol=tcp to-addresses=\
    172.168.1.22 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.22 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021247207-CANDI JIWA" dst-address=\
    103.145.202.78 dst-port=8023 protocol=tcp to-addresses=172.168.1.23 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.23 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021257860-GREEN CANYON KARAWANG" \
    dst-address=103.145.202.78 dst-port=8024 protocol=tcp to-addresses=\
    172.168.1.24 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.24 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251561-KOLAM CIHEULEUT" \
    dst-address=103.145.202.78 dst-port=8025 protocol=tcp to-addresses=\
    172.168.1.25 to-ports=8291
add action=dst-nat chain=dstnat comment="2021251558-TAMAN ALUN ALUN SUMEDANG" \
    dst-address=103.145.202.78 dst-port=8019 protocol=tcp to-addresses=\
    172.168.1.19 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.25 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021251562-GOR PBSI SUBANG" \
    dst-address=103.145.202.78 dst-port=8026 protocol=tcp to-addresses=\
    172.168.1.26 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.26 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2021251563-TAMAN TERITORIAL KODIM 0605 SUBANG" dst-address=\
    103.145.202.78 dst-port=8027 protocol=tcp to-addresses=172.168.1.27 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.27 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="SITU Cangkuang" dst-address=\
    103.145.202.78 dst-port=8029 protocol=tcp to-addresses=172.168.1.29 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.29 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2021251560-TUGU BENTENG PANCASILA ALUN \96 ALUN SUBANG" dst-address=\
    103.145.202.78 dst-port=8092 protocol=tcp to-addresses=172.168.1.92 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.92 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2021251559-RUMAH SAKIT UMUM DAERAH KABUPATEN SUBANG" dst-address=\
    103.145.202.78 dst-port=8099 protocol=tcp to-addresses=172.168.1.99 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.99 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=BKS3 dst-address=103.145.202.78 \
    dst-port=8144 protocol=tcp to-addresses=172.168.1.144 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.144 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299184 - BALE KAHURIPAN SITU WANAYASA" dst-address=103.145.202.78 \
    dst-port=8146 protocol=tcp to-addresses=172.168.1.146 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.146 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299193 - KAWASAN PENDIDIKAN SUMEDANG" dst-address=103.145.202.78 \
    dst-port=8147 protocol=tcp to-addresses=172.168.1.147 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.147 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299196 - GEDUNG KESENIAN PACUAN KUDA" dst-address=103.145.202.78 \
    dst-port=8148 protocol=tcp to-addresses=172.168.1.148 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.148 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299199 - BALAI WARGA DESA PASIRBIRU" dst-address=103.145.202.78 \
    dst-port=8149 protocol=tcp to-addresses=172.168.1.149 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.149 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299202 - PUSKESMAS SITU" \
    dst-address=103.145.202.78 dst-port=8150 protocol=tcp to-addresses=\
    172.168.1.150 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.150 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="CCTV Ledeng" dst-address=\
    103.145.202.78 dst-port=8011 protocol=tcp to-addresses=172.168.1.111 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.145.202.78 dst-port=8811 \
    protocol=tcp to-addresses=172.168.1.111 to-ports=8811
add action=dst-nat chain=dstnat comment="CCTV Cikole" dst-address=\
    103.145.202.78 dst-port=8012 protocol=tcp to-addresses=172.168.1.112 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.145.202.78 dst-port=8812 \
    protocol=tcp to-addresses=172.168.1.112 to-ports=8812
add action=src-nat chain=srcnat dst-address=172.168.1.112 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="CCTV Farmhouse" dst-address=\
    103.145.202.78 dst-port=8013 protocol=tcp to-addresses=172.168.1.113 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.145.202.78 dst-port=8813 \
    protocol=tcp to-addresses=172.168.1.113 to-ports=8813
add action=src-nat chain=srcnat dst-address=172.168.1.113 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="CCTV Emen" dst-address=\
    103.145.202.78 dst-port=8014 protocol=tcp to-addresses=172.168.1.114 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.145.202.78 dst-port=8814 \
    protocol=tcp to-addresses=172.168.1.114 to-ports=8814
add action=src-nat chain=srcnat dst-address=172.168.1.114 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=src-nat chain=srcnat dst-address=172.168.1.111 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="CCTV Emen" dst-address=\
    103.145.202.78 dst-port=8888 protocol=tcp to-addresses=172.168.1.114 \
    to-ports=80
add action=src-nat chain=srcnat dst-address=172.168.1.114 dst-port=80 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Puncak Darma" dst-address=\
    103.145.202.78 dst-port=8076 protocol=tcp to-addresses=172.168.1.76 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.76 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Taman Air Mancur" dst-address=\
    103.145.202.78 dst-port=8045 protocol=tcp to-addresses=172.168.1.45 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.45 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=Parigi dst-address=103.145.202.78 \
    dst-port=8042 protocol=tcp to-addresses=172.168.1.42 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.42 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Taman Aspirasi" dst-address=\
    103.145.202.78 dst-port=8047 protocol=tcp to-addresses=172.168.1.47 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.47 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Ujung Genteng" dst-address=\
    103.145.202.78 dst-port=8075 protocol=tcp to-addresses=172.168.1.75 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.75 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Curug Sodong" dst-address=\
    103.145.202.78 dst-port=8074 protocol=tcp to-addresses=172.168.1.74 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.74 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Curug Cimarinjung" dst-address=\
    103.145.202.78 dst-port=8073 protocol=tcp to-addresses=172.168.1.73 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.73 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Gedung Kesenian Dadaha" dst-address=\
    103.145.202.78 dst-port=8087 protocol=tcp to-addresses=172.168.1.87 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.87 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Terminal " dst-address=\
    103.145.202.78 dst-port=8058 protocol=tcp to-addresses=172.168.1.58 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.58 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=Rottan dst-address=103.145.202.78 \
    dst-port=8059 protocol=tcp to-addresses=172.168.1.59 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.59 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Pasar Batik Trusmi" dst-address=\
    103.145.202.78 dst-port=8054 protocol=tcp to-addresses=172.168.1.54 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.54 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="RS SMC" dst-address=103.145.202.78 \
    dst-port=8036 protocol=tcp to-addresses=172.168.1.36 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.36 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Situ Lengkong" dst-address=\
    103.145.202.78 dst-port=8037 protocol=tcp to-addresses=172.168.1.37 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.37 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=MJL3 dst-address=103.145.202.78 \
    dst-port=8062 protocol=tcp to-addresses=172.168.1.62 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.62 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=KNG1 dst-address=103.145.202.78 \
    dst-port=8063 protocol=tcp to-addresses=172.168.1.63 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.63 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=KNG1 dst-address=103.145.202.78 \
    dst-port=8064 protocol=tcp to-addresses=172.168.1.64 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.64 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=MJL3 dst-address=103.145.202.78 \
    dst-port=8066 protocol=tcp to-addresses=172.168.1.66 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.66 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=MJL2 dst-address=103.145.202.78 \
    dst-port=8065 protocol=tcp to-addresses=172.168.1.65 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.65 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299175-Plut UMKM" dst-address=\
    103.145.202.78 dst-port=8143 protocol=tcp to-addresses=172.168.1.143 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.143 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299154-Alun Alun Cijeruk" \
    dst-address=103.145.202.78 dst-port=8136 protocol=tcp to-addresses=\
    172.168.1.136 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.136 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299226-Lapang Bintang" \
    dst-address=103.145.202.78 dst-port=8155 protocol=tcp to-addresses=\
    172.168.1.155 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.155 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299211-Saung Bali" dst-address=\
    103.145.202.78 dst-port=8152 protocol=tcp to-addresses=172.168.1.152 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.152 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299214 - BENDUNGAN WALAHAR" \
    dst-address=103.145.202.78 dst-port=8153 protocol=tcp to-addresses=\
    172.168.1.153 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.153 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299217 - TPI TIPARAGEJAYA" \
    dst-address=103.145.202.78 dst-port=8154 protocol=tcp to-addresses=\
    172.168.1.154 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.154 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299181-Taman Kreatif Joglo" \
    dst-address=103.145.202.78 dst-port=8145 protocol=tcp to-addresses=\
    172.168.1.145 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.145 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=KBB2 dst-address=103.145.202.78 \
    dst-port=8100 protocol=tcp to-addresses=1.6.208.54 to-ports=8291
add action=src-nat chain=srcnat dst-address=1.6.208.54 dst-port=8291 \
    protocol=tcp to-addresses=1.6.208.1
add action=dst-nat chain=dstnat comment=KBB2 dst-address=103.145.202.78 \
    dst-port=8200 protocol=tcp to-addresses=1.6.208.6 to-ports=8291
add action=src-nat chain=srcnat dst-address=1.6.208.6 dst-port=8291 protocol=\
    tcp to-addresses=1.6.208.2
add action=dst-nat chain=dstnat comment=BJR1 dst-address=103.145.202.78 \
    dst-port=8055 protocol=tcp to-addresses=172.168.1.55 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.55 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=BLKK dst-address=103.145.202.78 \
    dst-port=8121 protocol=tcp to-addresses=172.168.1.121 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.121 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat dst-address=103.145.202.78 dst-port=1500 \
    protocol=tcp to-addresses=1.6.0.29 to-ports=8291
add action=dst-nat chain=dstnat comment="2022299256 - TPI PAMAYANGSARI" \
    dst-address=103.145.202.78 dst-port=8162 protocol=tcp to-addresses=\
    172.168.1.162 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.162 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299260 - OBJEK WISATA CIUNG WANARA" dst-address=103.145.202.78 \
    dst-port=8163 protocol=tcp to-addresses=172.168.1.163 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.163 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299263 - ALUN-ALUN CISAGA" \
    dst-address=103.145.202.78 dst-port=8164 protocol=tcp to-addresses=\
    172.168.1.164 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.164 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299266 - TAMAN SURAWISESA KAWALI" dst-address=103.145.202.78 \
    dst-port=8165 protocol=tcp to-addresses=172.168.1.165 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.165 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021253734-Batu Karas" dst-address=\
    103.145.202.78 dst-port=8167 protocol=tcp to-addresses=172.168.1.167 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.167 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299272-Batu Hiu" dst-address=\
    103.145.202.78 dst-port=8168 protocol=tcp to-addresses=172.168.1.168 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.168 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2021253730-Alun Alun Parigi" \
    dst-address=103.145.202.78 dst-port=8169 protocol=tcp to-addresses=\
    172.168.1.169 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.169 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299275-Pasar Pangandaran" \
    dst-address=103.145.202.78 dst-port=8170 protocol=tcp to-addresses=\
    172.168.1.170 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.170 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299278-Islamic Center Parigi" \
    dst-address=103.145.202.78 dst-port=8171 protocol=tcp to-addresses=\
    172.168.1.171 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.171 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299281-Pasar Parigi" \
    dst-address=103.145.202.78 dst-port=8172 protocol=tcp to-addresses=\
    172.168.1.172 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.172 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299284-Pasar Cijulang" \
    dst-address=103.145.202.78 dst-port=8173 protocol=tcp to-addresses=\
    172.168.1.173 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.173 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299287-TPI Batukaras" \
    dst-address=103.145.202.78 dst-port=8174 protocol=tcp to-addresses=\
    172.168.1.174 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.174 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299290-TPI Bojongsalawe" \
    dst-address=103.145.202.78 dst-port=8175 protocol=tcp to-addresses=\
    172.168.1.175 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.175 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299293 - STADION WIBAWA MUKTI PINTU BARAT" dst-address=\
    103.145.202.78 dst-port=8176 protocol=tcp to-addresses=172.168.1.176 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.176 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299296 - STADION WIBAWA MUKTI PINTU TIMUR" dst-address=\
    103.145.202.78 dst-port=8177 protocol=tcp to-addresses=172.168.1.177 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.177 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299299 - TAMAN SEHATI" \
    dst-address=103.145.202.78 dst-port=8178 protocol=tcp to-addresses=\
    172.168.1.178 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.178 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299302 - GELANGGANG RENANG" \
    dst-address=103.145.202.78 dst-port=8179 protocol=tcp to-addresses=\
    172.168.1.179 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.179 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299311 - ALUN-ALUN KECAMATAN HAURGEULIS" dst-address=103.145.202.78 \
    dst-port=8182 protocol=tcp to-addresses=172.168.1.182 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.182 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=2021251561-Persikas dst-address=\
    103.145.202.78 dst-port=8156 protocol=tcp to-addresses=172.168.1.156 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.156 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299229 - TPI BLANAKAN" \
    dst-address=103.145.202.78 dst-port=8157 protocol=tcp to-addresses=\
    172.168.1.157 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.157 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299172-Alun Alun Cikalongkulon" \
    dst-address=103.145.202.78 dst-port=8142 protocol=tcp to-addresses=\
    172.168.1.142 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.142 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299133 - PASAR BATUJAJAR" \
    dst-address=103.145.202.78 dst-port=8131 protocol=tcp to-addresses=\
    172.168.1.131 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.131 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299136 - TERMINAL PARONGPONG" \
    dst-address=103.145.202.78 dst-port=8132 protocol=tcp to-addresses=\
    172.168.1.132 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.132 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299142 - TERMINAL SINDANGKERTA" \
    dst-address=103.145.202.78 dst-port=8133 protocol=tcp to-addresses=\
    172.168.1.133 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.133 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299148 - ALUN-ALUN JONGGOL" \
    dst-address=103.145.202.78 dst-port=8134 protocol=tcp to-addresses=\
    172.168.1.134 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.134 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299151 - BALAI BACA LEGOK BANTENG" dst-address=103.145.202.78 \
    dst-port=8135 protocol=tcp to-addresses=172.168.1.135 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.135 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299157-Alun Alun Tajurhalang" \
    dst-address=103.145.202.78 dst-port=8137 protocol=tcp to-addresses=\
    172.168.1.137 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.137 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299160-Alun Alun Gunung Sindur" \
    dst-address=103.145.202.78 dst-port=8138 protocol=tcp to-addresses=\
    172.168.1.138 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.138 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299163-Balai Pertemuan Rembug Warga" dst-address=103.145.202.78 \
    dst-port=8139 protocol=tcp to-addresses=172.168.1.139 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.139 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299166-Giwangkara River Tubing" \
    dst-address=103.145.202.78 dst-port=8140 protocol=tcp to-addresses=\
    172.168.1.140 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.140 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299169 - PASAR CISARUA" \
    dst-address=103.145.202.78 dst-port=8141 protocol=tcp to-addresses=\
    172.168.1.141 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.141 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299247-PEMANDIAN AIR PANAS GUNUNG GALUNGGUNG" dst-address=\
    103.145.202.78 dst-port=8159 protocol=tcp to-addresses=172.168.1.159 \
    to-ports=80
add action=src-nat chain=srcnat dst-address=172.168.1.159 dst-port=80 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299250 - ALUN-ALUN MANONJAYA" \
    dst-address=103.145.202.78 dst-port=8160 protocol=tcp to-addresses=\
    172.168.1.160 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.160 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299253 - HALAMAN PARKIR WISATA BUDAYA KAMPUNG NAGA" dst-address=\
    103.145.202.78 dst-port=8161 protocol=tcp to-addresses=172.168.1.161 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.161 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299269 - REST AREA SINGUGU" \
    dst-address=103.145.202.78 dst-port=8166 protocol=tcp to-addresses=\
    172.168.1.166 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.166 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299314 - ALUN ALUN ANJATAN" \
    dst-address=103.145.202.78 dst-port=8183 protocol=tcp to-addresses=\
    172.168.1.183 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.183 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299305 - PANTAI KARANGSONG" \
    dst-address=103.145.202.78 dst-port=8180 protocol=tcp to-addresses=\
    172.168.1.180 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.180 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299308 - PANTAI TIRTAMAYA" \
    dst-address=103.145.202.78 dst-port=8181 protocol=tcp to-addresses=\
    172.168.1.181 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.181 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299311 - ALUN-ALUN KECAMATAN HAURGEULIS" dst-address=103.145.202.78 \
    dst-port=8182 protocol=tcp to-addresses=172.168.1.182 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.182 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299317 - TPI KARANGSONG" \
    dst-address=103.145.202.78 dst-port=8184 protocol=tcp to-addresses=\
    172.168.1.184 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.184 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299320 - TPI ERETAN WETAN" \
    dst-address=103.145.202.78 dst-port=8185 protocol=tcp to-addresses=\
    172.168.1.185 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.185 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299320 - TPI ERETAN WETAN" \
    dst-address=103.145.202.78 dst-port=8195 protocol=tcp to-addresses=\
    172.168.1.195 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.195 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299323 - TPI ERETAN KULON" \
    dst-address=103.145.202.78 dst-port=8186 protocol=tcp to-addresses=\
    172.168.1.186 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.186 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299326 - TPI DADAP" dst-address=\
    103.145.202.78 dst-port=8187 protocol=tcp to-addresses=172.168.1.187 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.187 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299329 - TPI CANTIGI" \
    dst-address=103.145.202.78 dst-port=8188 protocol=tcp to-addresses=\
    172.168.1.188 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.188 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299332 - ALUN ALUN DESA PEGAGAN KIDUL" dst-address=103.145.202.78 \
    dst-port=8189 protocol=tcp to-addresses=172.168.1.189 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.189 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299335 - PELELANGAN IKAN SAMBUNG JAYA MULYA" dst-address=\
    103.145.202.78 dst-port=8190 protocol=tcp to-addresses=172.168.1.190 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.190 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299341 - TAMAN EKS POLRES" \
    dst-address=103.145.202.78 dst-port=8192 protocol=tcp to-addresses=\
    172.168.1.192 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.192 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299344 - ALUN ALUN TALAGA" \
    dst-address=103.145.202.78 dst-port=8193 protocol=tcp to-addresses=\
    172.168.1.193 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.193 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="2022299347 - SITU CIPANTEN" \
    dst-address=103.145.202.78 dst-port=8194 protocol=tcp to-addresses=\
    172.168.1.194 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.194 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299455 - AREA DEPAN PASAR LANGENSARI" dst-address=103.145.202.78 \
    dst-port=8199 protocol=tcp to-addresses=172.168.1.199 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.199 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022312227 - AREA DEPAN GRAHA BANJAR IDAMAN" dst-address=103.145.202.78 \
    dst-port=8200 protocol=tcp to-addresses=172.168.1.200 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.200 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299220 - SUBANG CREATIVE CENTER/EKRAF SUBANG" dst-address=\
    103.145.202.78 dst-port=8202 protocol=tcp to-addresses=172.168.1.202 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.202 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=\
    "2022299223 - ASRAMA HAJI/SUBANG ISLAMIC CENTER" dst-address=\
    103.145.202.78 dst-port=8203 protocol=tcp to-addresses=172.168.1.203 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.203 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=Balong dst-address=103.145.202.78 \
    dst-port=8181 protocol=tcp to-addresses=172.168.1.181 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.181 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment=Elang dst-address=103.145.202.78 \
    dst-port=8158 protocol=tcp to-addresses=172.168.1.158 to-ports=8291
add action=dst-nat chain=dstnat comment="Waduk Darma" dst-address=\
    103.145.202.78 dst-port=8204 protocol=tcp to-addresses=172.168.1.67 \
    to-ports=8291
add action=src-nat chain=srcnat comment=Elang dst-address=172.168.1.158 \
    dst-port=8291 protocol=tcp to-addresses=172.168.1.1
add action=src-nat chain=srcnat comment="Waduk Darma" dst-address=\
    172.168.1.67 dst-port=8291 protocol=tcp to-addresses=172.168.1.1
add action=dst-nat chain=dstnat comment="Graha Pariwisata" dst-address=\
    103.145.202.78 dst-port=8159 protocol=tcp to-addresses=172.168.1.49 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.168.1.49 dst-port=8291 \
    protocol=tcp to-addresses=172.168.1.1
/ip route
add distance=1 gateway=103.145.202.77
add distance=1 dst-address=1.6.0.0/16 gateway=172.20.0.209
add distance=1 dst-address=1.6.208.0/24 gateway=172.20.0.209
add distance=1 dst-address=172.20.0.96/29 gateway=172.20.0.209
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=8222
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add local-address=172.168.1.1 name=kbb1 password=passwordkbb1 remote-address=\
    172.168.1.2
add local-address=172.168.1.1 name=kbb3 password=passwordkbb3 remote-address=\
    172.168.1.4
add local-address=172.168.1.1 name=kbb4 password=passwordkbb4 remote-address=\
    172.168.1.5
add local-address=172.168.1.1 name=cianjur1 password=passwordcianjur1 \
    remote-address=172.168.1.6
add disabled=yes local-address=172.168.1.1 name=cianjur2 password=\
    passwordcianjur2 remote-address=172.168.1.7
add disabled=yes local-address=172.168.1.1 name=cianjur3 password=\
    passwordcianjur3 remote-address=172.168.1.8
add local-address=172.168.1.1 name=cianjur4 password=passwordcianjur4 \
    remote-address=172.168.1.9
add local-address=172.168.1.1 name=cianjur5 password=passwordcianjur5 \
    remote-address=172.168.1.10
add local-address=172.168.1.1 name=smd1 password=P4sswordwifi remote-address=\
    172.168.1.15
add local-address=172.168.1.1 name=smd2 password=passwordsmd2 remote-address=\
    172.168.1.16
add local-address=172.168.1.1 name=smd3 password=passwordsmd3 remote-address=\
    172.168.1.17
add local-address=172.168.1.1 name=smd4 password=passwordsmd4 remote-address=\
    172.168.1.18
add local-address=172.168.1.1 name=smd5 password=passwordsmd5 remote-address=\
    172.168.1.19
add local-address=172.168.1.1 name=krw1 password=passwordkrw1 remote-address=\
    172.168.1.20
add local-address=172.168.1.1 name=krw2 password=passwordkrw2 remote-address=\
    172.168.1.21
add local-address=172.168.1.1 name=krw3 password=passwordkrw3 remote-address=\
    172.168.1.22
add local-address=172.168.1.1 name=krw4 password=passwordkrw4 remote-address=\
    172.168.1.23
add local-address=172.168.1.1 name=krw5 password=passwordkrw5 remote-address=\
    172.168.1.24
add local-address=172.168.1.1 name=subang1 password=passwordsubang1 \
    remote-address=172.168.1.25
add local-address=172.168.1.1 name=subang2 password=passwordsubang2 \
    remote-address=172.168.1.26
add local-address=172.168.1.1 name=subang3 password=passwordsubang3 \
    remote-address=172.168.1.27
add local-address=172.168.1.1 name=subang4 password=passwordsubang4 \
    remote-address=172.168.1.98
add local-address=172.168.1.1 name=subang5 password=passwordsubang5 \
    remote-address=172.168.1.99
add local-address=172.168.1.1 name=garut1 password=passwordgarut1 \
    remote-address=172.168.1.28
add local-address=172.168.1.1 name=garut3 password=passwordgarut3 \
    remote-address=172.168.1.30
add local-address=172.168.1.1 name=garut2 password=passwordgarut2 \
    remote-address=172.168.1.29
add local-address=172.168.1.1 name=tsk1 password=passwordtsk1 remote-address=\
    172.168.1.87
add local-address=172.168.1.1 name=tsk2 password=passwordtsk2 remote-address=\
    172.168.1.88
add local-address=172.168.1.1 name=tsk3 password=passwordtsk3 remote-address=\
    172.168.1.89
add local-address=172.168.1.1 name=kng1 password=passwordkng1 remote-address=\
    172.168.1.63
add local-address=172.168.1.1 name=kng2 password=passwordkng2 remote-address=\
    172.168.1.64
add local-address=172.168.1.1 name=kng3 password=passwordkng3 remote-address=\
    172.168.1.65
add local-address=172.168.1.1 name=kng4 password=passwordkng4 remote-address=\
    172.168.1.66
add local-address=172.168.1.1 name=kng5 password=passwordkng5 remote-address=\
    172.168.1.67
add local-address=172.168.1.1 name=kng6 password=passwordkng6 remote-address=\
    172.168.1.68
add local-address=172.168.1.1 name=katsk1 password=passwordkatsk1 \
    remote-address=172.168.1.32
add local-address=172.168.1.1 name=katsk2 password=passwordkatsk2 \
    remote-address=172.168.1.33
add local-address=172.168.1.1 name=katsk3 password=passwordkatsk3 \
    remote-address=172.168.1.34
add local-address=172.168.1.1 name=katsk4 password=passwordkatsk4 \
    remote-address=172.168.1.35
add local-address=172.168.1.1 name=pgd1 password=passwordpgd1 remote-address=\
    172.168.1.40
add local-address=172.168.1.1 name=pgd2 password=passwordpgd2 remote-address=\
    172.168.1.41
add local-address=172.168.1.1 name=pgd3 password=passwordpgd3 remote-address=\
    172.168.1.42
add local-address=172.168.1.1 name=pgd4 password=passwordpgd4 remote-address=\
    172.168.1.43
add local-address=172.168.1.1 name=pgd5 password=passwordpgd5 remote-address=\
    172.168.1.44
add local-address=172.168.1.1 name=pgd6 password=passwordpgd6 remote-address=\
    172.168.1.45
add local-address=172.168.1.1 name=pgd7 password=passwordpgd7 remote-address=\
    172.168.1.46
add local-address=172.168.1.1 name=idr1 password=passwordidr1 remote-address=\
    172.168.1.50
add local-address=172.168.1.1 name=idr2 password=passwordidr2 remote-address=\
    172.168.1.51
add local-address=172.168.1.1 name=idr3 password=passwordidr3 remote-address=\
    172.168.1.52
add local-address=172.168.1.1 name=idr4 password=passwordidr4 remote-address=\
    172.168.1.106
add local-address=172.168.1.1 name=idr5 password=passwordidr5 remote-address=\
    172.168.1.107
add local-address=172.168.1.1 name=cms1 password=passwordcms1 remote-address=\
    172.168.1.37
add local-address=172.168.1.1 name=cms2 password=passwordcms2 remote-address=\
    172.168.1.38
add local-address=172.168.1.1 name=cms3 password=passwordcms3 remote-address=\
    172.168.1.39
add local-address=172.168.1.1 name=kcrb1 password=passwordkcrb1 \
    remote-address=172.168.1.53
add local-address=172.168.1.1 name=cctvcikole password=passwordcikole \
    remote-address=172.168.1.112
add local-address=172.168.1.1 name=cmh1 password=passwordcmh1 remote-address=\
    172.168.1.77
add local-address=172.168.1.1 name=crb2 password=passwordcrb2 remote-address=\
    172.168.1.80
add local-address=172.168.1.1 name=crb3 password=passwordcrb3 remote-address=\
    172.168.1.81
add local-address=172.168.1.1 name=cctvledeng password=passwordledeng \
    remote-address=172.168.1.111
add local-address=172.168.1.1 name=cctvfarmhouse password=passwordfarmhouse \
    remote-address=172.168.1.113
add local-address=172.168.1.1 name=cctvemen password=passwordemen \
    remote-address=172.168.1.114
add local-address=172.168.1.1 name=blkk2 password=passwordblkk2 \
    remote-address=172.168.1.115
add local-address=172.168.1.1 name=blkk1 password=passwordblkk1 \
    remote-address=172.168.1.116
add local-address=172.168.1.1 name=blkk3 password=passwordblkk3 \
    remote-address=172.168.1.117
add local-address=1.6.0.29 name=KBB_1 password=123 remote-address=1.6.0.61
add local-address=1.6.0.29 name=KBB_3 password=123 remote-address=1.6.0.63
add local-address=1.6.0.29 name=KBB_4 password=123 remote-address=1.6.0.64
add local-address=1.6.0.29 name=CJR_1 password=123 remote-address=1.6.0.65
add local-address=1.6.0.29 name=CJR_5 password=123 remote-address=1.6.0.69
add local-address=1.6.0.29 name=SMD_1 password=123 remote-address=1.6.0.70
add local-address=1.6.0.29 name=SMD_4 password=123 remote-address=1.6.0.73
add local-address=1.6.0.29 name=SMD_5 password=123 remote-address=1.6.0.74
add local-address=172.168.1.1 name=mjl1 password=passwordmjl1 remote-address=\
    172.168.1.60
add local-address=172.168.1.1 name=mjl2 password=passwordmjl2 remote-address=\
    172.168.1.61
add local-address=172.168.1.1 name=mjl3 password=passwordmjl3 remote-address=\
    172.168.1.62
add local-address=172.168.1.1 name=mjl4 password=passwordmjl4 remote-address=\
    172.168.1.118
add local-address=172.168.1.1 name=mjl5 password=passwordmjl5 remote-address=\
    172.168.1.119
add local-address=1.6.0.29 name=KRW_1 password=123 remote-address=1.6.0.75
add local-address=1.6.0.29 name=SBG_1 password=123 remote-address=1.6.0.80
add local-address=1.6.0.29 name=SBG_2 password=123 remote-address=1.6.0.81
add local-address=1.6.0.29 name=SBG_3 password=123 remote-address=1.6.0.82
add local-address=1.6.0.29 name=SBG_4 password=123 remote-address=1.6.0.83
add local-address=1.6.208.2 name=SBG_5 password=123 remote-address=1.6.208.3
add local-address=1.6.208.2 name=GRT_2 password=123 remote-address=1.6.208.5
add local-address=172.168.1.1 name=katsk5 password=passwordkatsk5 \
    remote-address=172.168.1.36
add local-address=1.6.208.2 name=CMS_1 password=123 remote-address=1.6.208.12
add local-address=1.6.208.2 name=CMS_2 password=123 remote-address=1.6.208.13
add local-address=1.6.208.2 name=CMS_3 password=123 remote-address=1.6.208.14
add local-address=1.6.208.2 name=PGD_1 password=123 remote-address=1.6.208.11
add local-address=1.6.208.2 name=PGD_2 password=123 remote-address=1.6.208.15
add local-address=1.6.208.2 name=PGD_3 password=123 remote-address=1.6.208.16
add local-address=1.6.208.2 name=PGD_4 password=123 remote-address=1.6.208.17
add local-address=1.6.208.2 name=PGD_6 password=123 remote-address=1.6.208.19
add local-address=1.6.208.2 name=PGD_7 password=123 remote-address=1.6.208.20
add local-address=1.6.208.2 name=IDR_1 password=123 remote-address=1.6.208.21
add local-address=1.6.208.2 name=IDR_2 password=123 remote-address=1.6.208.22
add local-address=1.6.208.2 name=IDR_3 password=123 remote-address=1.6.208.23
add local-address=1.6.208.2 name=IDR_4 password=123 remote-address=1.6.208.24
add local-address=1.6.208.2 name=IDR_5 password=123 remote-address=1.6.208.25
add local-address=1.6.208.2 name=KCRB_1 password=123 remote-address=\
    1.6.208.26
add local-address=1.6.208.2 name=MJL_2 password=123 remote-address=1.6.208.37
add local-address=1.6.208.2 name=MJL_3 password=123 remote-address=1.6.208.39
add local-address=1.6.0.29 name=CIERENG1 password=123 remote-address=1.6.0.31
add local-address=1.6.0.29 name=GUNUNGMENYAN password=123 profile=\
    default-encryption remote-address=1.6.0.39
add local-address=1.6.0.29 name=SUKAMAJU password=123 profile=\
    default-encryption remote-address=1.6.0.34
add local-address=1.6.0.29 name=CANGKINGAN password=123 profile=\
    default-encryption remote-address=1.6.0.40
add local-address=1.6.208.2 name=KNG_1 password=123 remote-address=1.6.208.41
add local-address=1.6.208.2 name=KNG_2 password=123 remote-address=1.6.208.42
add local-address=1.6.0.29 name=INDRAMAYU password=123 profile=\
    default-encryption remote-address=1.6.0.33
add local-address=1.6.0.29 name=ANJATAN password=123 profile=\
    default-encryption remote-address=1.6.0.43
add local-address=1.6.208.2 name=KNG_3 password=123 remote-address=1.6.208.43
add local-address=1.6.0.29 name=DAWUAN1 password=123 profile=\
    default-encryption remote-address=1.6.0.54
add local-address=1.6.208.2 name=KNG_4 password=123 remote-address=1.6.208.44
add local-address=1.6.208.2 name=KNG_5 password=123 remote-address=1.6.208.45
add local-address=1.6.208.2 name=KNG_6 password=123 remote-address=1.6.208.46
add local-address=1.6.208.2 name=TSK_3 password=123 remote-address=1.6.208.63
add local-address=1.6.208.2 name=TSK_1 password=123 remote-address=1.6.208.61
add local-address=172.168.1.1 name=bjr1 password=passwordbjr1 remote-address=\
    172.168.1.92
add local-address=172.168.1.1 name=bjr2 password=passwordbjr2 remote-address=\
    172.168.1.93
add local-address=172.168.1.1 name=bjr3 password=passwordbjr3 remote-address=\
    172.168.1.94
add local-address=172.168.1.1 name=bjr4 password=passwordbjr4 remote-address=\
    172.168.1.95
add local-address=172.168.1.1 name=bjr5 password=passwordbjr5 remote-address=\
    172.168.1.96
add local-address=1.6.0.29 name=BJR_1 password=123 remote-address=1.6.0.56
add local-address=1.6.0.29 name=BJR_2 password=123 remote-address=1.6.0.57
add local-address=1.6.0.29 name=BJR_3 password=123 remote-address=1.6.0.58
add local-address=1.6.0.29 name=BJR_4 password=123 remote-address=1.6.0.59
add local-address=1.6.0.29 name=BJR_5 password=123 remote-address=1.6.0.60
add local-address=172.168.1.1 name=skb1 password=passwordskb1 remote-address=\
    172.168.1.69
add local-address=172.168.1.1 name=skb2 password=passwordskb2 remote-address=\
    172.168.1.70
add comment="dan ternyata icon+" local-address=172.168.1.1 name=kng5-1 \
    password=passwordkng5-1 remote-address=172.168.1.71
add local-address=172.168.1.1 name=skb4 password=passwordskb4 remote-address=\
    172.168.1.72
add local-address=172.168.1.1 name=skb5 password=passwordskb5 remote-address=\
    172.168.1.73
add local-address=172.168.1.1 name=skb6 password=passwordskb6 remote-address=\
    172.168.1.74
add local-address=172.168.1.1 name=skb7 password=passwordskb7 remote-address=\
    172.168.1.75
add local-address=172.168.1.1 name=skb8 password=passwordskb8 remote-address=\
    172.168.1.76
add local-address=1.6.208.2 name=SKB_1 password=123 remote-address=1.6.208.47
add local-address=1.6.208.2 name=SKB_2 password=123 remote-address=1.6.208.48
add local-address=1.6.208.2 name=SKB_4 password=123 remote-address=1.6.208.50
add local-address=1.6.208.2 name=SKB_5 password=123 remote-address=1.6.208.51
add local-address=1.6.208.2 name=SKB_7 password=123 remote-address=1.6.208.53
add local-address=1.6.0.29 name=KRW_4 password=123 remote-address=1.6.0.78
add local-address=172.168.1.1 name=bks2 password=passwordbks2 remote-address=\
    172.168.1.48
add local-address=1.6.208.2 name=BKS_2 password=123 remote-address=1.6.208.34
add local-address=172.168.1.1 name=bks3 password=passwordbks3 remote-address=\
    172.168.1.49
add local-address=1.6.208.2 name=BKS_3 password=123 remote-address=1.6.208.35
add local-address=1.6.208.2 name=SKB_6 password=123 remote-address=1.6.208.52
add local-address=172.168.1.1 name=dpk2 password=passworddpk2 remote-address=\
    172.168.1.86
add local-address=172.168.1.1 name=dpk1 password=passworddpk1 remote-address=\
    172.168.1.85
add local-address=172.168.1.1 name=crb1 password=passwordcrb1 remote-address=\
    172.168.1.79
add local-address=1.6.208.2 name=DPK_1 password=123 remote-address=1.6.208.59
add local-address=1.6.0.29 name=CRB_1 password=123 remote-address=1.6.0.71
add local-address=1.6.0.29 name=CRB_2 password=123 remote-address=1.6.0.72
add local-address=1.6.208.2 name=MJL_5 password=123 remote-address=1.6.208.40
add local-address=1.6.208.2 name=MJL_4 password=123 remote-address=1.6.208.38
add local-address=1.6.0.29 name=CRB_3 password=123 remote-address=1.6.0.67
add local-address=172.168.1.1 name=crb5 password=passwordcrb5 remote-address=\
    172.168.1.120
add local-address=1.6.0.29 name=CRB_5 password=123 remote-address=1.6.0.66
add local-address=172.168.1.1 name=kcrb2 password=passwordkcrb2 \
    remote-address=172.168.1.54
add local-address=172.168.1.1 name=kcrb3 password=passwordkcrb3 \
    remote-address=172.168.1.55
add local-address=172.168.1.1 name=kcrb6 password=passwordkcrb6 \
    remote-address=172.168.1.58
add local-address=172.168.1.1 name=kcrb7 password=passwordkcrb7 \
    remote-address=172.168.1.59
add local-address=1.6.208.2 name=KCRB_2 password=123 remote-address=\
    1.6.208.27
add local-address=1.6.208.2 name=CMH_1 password=123 remote-address=1.6.208.55
add local-address=1.6.208.2 name=KCRB_6 password=123 remote-address=\
    1.6.208.31
add local-address=1.6.208.2 name=KCRB_7 password=123 remote-address=\
    1.6.208.32
add local-address=1.6.208.2 name=KCRB_3 password=123 remote-address=\
    1.6.208.28
add local-address=1.6.208.2 name=KATSK_1 password=123 remote-address=\
    1.6.208.8
add local-address=1.6.208.2 name=PGD_5 password=123 remote-address=1.6.208.18
add local-address=172.168.1.1 name=bks1 password=passwordbks1 remote-address=\
    172.168.1.47
add local-address=1.6.0.29 name=CCTV_LEDENG password=123 remote-address=\
    1.6.0.62
add local-address=1.6.208.2 name=CCTV_CIKOLE password=123 remote-address=\
    1.6.208.4
add local-address=1.6.208.2 name=CCTV_FARMHOUSE password=123 remote-address=\
    1.6.208.6
add local-address=1.6.208.2 name=CCTV_EMEN password=123 remote-address=\
    1.6.208.7
add local-address=1.6.0.29 name=CICURUG password=123 profile=\
    default-encryption remote-address=1.6.0.30
add local-address=1.6.208.2 name=CIPICUNG password=123 remote-address=\
    1.6.208.67
add local-address=1.6.0.29 name=SUKADANA password=123 profile=\
    default-encryption remote-address=1.6.0.36
add local-address=1.6.0.29 name=CJR_4 password=123 remote-address=1.6.0.68
add local-address=172.168.1.1 name=kng7 password=passwordkng7 remote-address=\
    172.168.1.121
add local-address=1.6.208.2 name=KNG_7 password=123 remote-address=1.6.208.36
add local-address=1.6.0.29 name=MAJALENGKA password=123 profile=\
    default-encryption remote-address=1.6.0.32
add local-address=172.168.1.1 name=bgr1 password=passwordbgr1 remote-address=\
    172.168.1.83
add local-address=172.168.1.1 name=bgr2 password=passwordbgr2 remote-address=\
    172.168.1.84
add local-address=1.6.208.2 name=BGR_1 password=123 remote-address=1.6.208.56
add local-address=1.6.0.29 name=JATIBARANG password=123 profile=\
    default-encryption remote-address=1.6.0.42
add local-address=1.6.208.2 name=KATSK_3 password=123 remote-address=\
    1.6.208.10
add local-address=1.6.208.2 name=BLKK3 password=123 remote-address=1.6.208.65
add local-address=172.168.1.1 name=tsk5 password=passwordtsk5 remote-address=\
    172.168.1.91
add local-address=1.6.208.2 name=KATSK_2 password=123 remote-address=\
    1.6.208.9
add local-address=1.6.0.29 name=KARANGHARJA password=123 profile=\
    default-encryption remote-address=1.6.0.41
add local-address=1.6.0.29 name=CIKADU password=123 profile=\
    default-encryption remote-address=1.6.0.77
add local-address=1.6.0.29 name=GINANJAR password=123 profile=\
    default-encryption remote-address=1.6.0.52
add local-address=1.6.208.2 name=BKS_1 password=123 remote-address=1.6.208.33
add local-address=1.6.0.29 name=MEKARMANAH password=123 profile=\
    default-encryption remote-address=1.6.0.55
add local-address=1.6.0.29 name=SARIMEKAR password=123 profile=\
    default-encryption remote-address=1.6.0.53
add local-address=1.6.208.2 name=TANJUNGMULYA password=123 profile=\
    default-encryption remote-address=1.6.208.66
add local-address=1.6.208.2 name=CIPANCUH password=123 remote-address=\
    1.6.208.64
add local-address=1.6.208.2 name=BENDUNGAN password=123 remote-address=\
    1.6.208.58
add local-address=1.6.208.2 name=KATSK_5 password=123 remote-address=\
    1.6.208.49
add local-address=1.6.208.2 name=CIBODAS password=123 remote-address=\
    1.6.208.54
add local-address=1.6.208.2 name=PUNCAKBARU password=123 remote-address=\
    1.6.208.57
add local-address=1.6.208.2 name=BLKK1 password=123 remote-address=1.6.208.29
add local-address=1.6.208.2 name=BLKK2 password=123 remote-address=1.6.208.30
add local-address=172.168.1.1 name=test password=test123 remote-address=\
    172.168.1.123
add local-address=172.168.1.1 name=kbb21 password=P4sswordwifi \
    remote-address=172.168.1.131
add local-address=172.168.1.1 name=kbb22 password=P4sswordwifi \
    remote-address=172.168.1.132
add local-address=172.168.1.1 name=kbb23 password=P4sswordwifi \
    remote-address=172.168.1.133
add local-address=172.168.1.1 name=kabgr21 password=P4sswordwifi \
    remote-address=172.168.1.134
add local-address=172.168.1.1 name=kabgr22 password=P4sswordwifi \
    remote-address=172.168.1.135
add local-address=172.168.1.1 name=kabgr23 password=P4sswordwifi \
    remote-address=172.168.1.136
add local-address=172.168.1.1 name=kabgr24 password=P4sswordwifi \
    remote-address=172.168.1.137
add local-address=172.168.1.1 name=kabgr25 password=P4sswordwifi \
    remote-address=172.168.1.138
add local-address=172.168.1.1 name=kabgr26 password=P4sswordwifi \
    remote-address=172.168.1.139
add local-address=172.168.1.1 name=kabgr27 password=P4sswordwifi \
    remote-address=172.168.1.140
add local-address=172.168.1.1 name=kabgr28 password=P4sswordwifi \
    remote-address=172.168.1.141
add local-address=172.168.1.1 name=cianjur21 password=P4sswordwifi \
    remote-address=172.168.1.142
add local-address=172.168.1.1 name=cianjur22 password=P4sswordwifi \
    remote-address=172.168.1.143
add local-address=172.168.1.1 name=pkt21 password=P4sswordwifi \
    remote-address=172.168.1.146
add local-address=172.168.1.1 name=smd21 password=P4sswordwifi \
    remote-address=172.168.1.147
add local-address=172.168.1.1 name=smd22 password=P4sswordwifi \
    remote-address=172.168.1.148
add local-address=172.168.1.1 name=smd23 password=P4sswordwifi \
    remote-address=172.168.1.149
add local-address=172.168.1.1 name=smd24 password=P4sswordwifi \
    remote-address=172.168.1.150
add local-address=172.168.1.1 name=krw21 password=P4sswordwifi \
    remote-address=172.168.1.151
add local-address=172.168.1.1 name=krw22 password=P4sswordwifi \
    remote-address=172.168.1.152
add local-address=172.168.1.1 name=krw23 password=P4sswordwifi \
    remote-address=172.168.1.153
add local-address=172.168.1.1 name=krw24 password=P4sswordwifi \
    remote-address=172.168.1.154
add local-address=172.168.1.1 name=subang21 password=P4sswordwifi \
    remote-address=172.168.1.155
add local-address=172.168.1.1 name=subang22 password=P4sswordwifi \
    remote-address=172.168.1.156
add local-address=172.168.1.1 name=subang23 password=P4sswordwifi \
    remote-address=172.168.1.157
add local-address=172.168.1.1 name=garut21 password=P4sswordwifi \
    remote-address=172.168.1.158
add local-address=172.168.1.1 name=katsk21 password=P4sswordwifi \
    remote-address=172.168.1.159
add local-address=172.168.1.1 name=katsk22 password=P4sswordwifi \
    remote-address=172.168.1.160
add local-address=172.168.1.1 name=katsk23 password=P4sswordwifi \
    remote-address=172.168.1.161
add local-address=172.168.1.1 name=katsk24 password=P4sswordwifi \
    remote-address=172.168.1.162
add local-address=172.168.1.1 name=cms21 password=P4sswordwifi \
    remote-address=172.168.1.163
add local-address=172.168.1.1 name=cms22 password=P4sswordwifi \
    remote-address=172.168.1.164
add local-address=172.168.1.1 name=cms23 password=P4sswordwifi \
    remote-address=172.168.1.165
add local-address=172.168.1.1 name=cms24 password=P4sswordwifi \
    remote-address=172.168.1.166
add local-address=172.168.1.1 name=pgd21 password=P4sswordwifi \
    remote-address=172.168.1.167
add local-address=172.168.1.1 name=pgd22 password=P4sswordwifi \
    remote-address=172.168.1.168
add local-address=172.168.1.1 name=pgd23 password=P4sswordwifi \
    remote-address=172.168.1.169
add local-address=172.168.1.1 name=pgd24 password=P4sswordwifi \
    remote-address=172.168.1.170
add local-address=172.168.1.1 name=pgd25 password=P4sswordwifi \
    remote-address=172.168.1.171
add local-address=172.168.1.1 name=pgd26 password=P4sswordwifi \
    remote-address=172.168.1.172
add local-address=172.168.1.1 name=pgd27 password=P4sswordwifi \
    remote-address=172.168.1.173
add local-address=172.168.1.1 name=pgd28 password=P4sswordwifi \
    remote-address=172.168.1.174
add local-address=172.168.1.1 name=pgd29 password=P4sswordwifi \
    remote-address=172.168.1.175
add local-address=172.168.1.1 name=kabks21 password=P4sswordwifi \
    remote-address=172.168.1.176
add local-address=172.168.1.1 name=kabks23 password=P4sswordwifi \
    remote-address=172.168.1.178
add local-address=172.168.1.1 name=idrm21 password=P4sswordwifi \
    remote-address=172.168.1.180
add local-address=172.168.1.1 name=idrm22 password=P4sswordwifi \
    remote-address=172.168.1.181
add local-address=172.168.1.1 name=idrm23 password=P4sswordwifi \
    remote-address=172.168.1.182
add local-address=172.168.1.1 name=idrm24 password=P4sswordwifi \
    remote-address=172.168.1.183
add local-address=172.168.1.1 name=idrm25 password=P4sswordwifi \
    remote-address=172.168.1.184
add local-address=172.168.1.1 name=idrm26 password=P4sswordwifi \
    remote-address=172.168.1.185
add local-address=172.168.1.1 name=idrm27 password=P4sswordwifi \
    remote-address=172.168.1.186
add local-address=172.168.1.1 name=idrm28 password=P4sswordwifi \
    remote-address=172.168.1.187
add local-address=172.168.1.1 name=idrm29 password=P4sswordwifi \
    remote-address=172.168.1.188
add local-address=172.168.1.1 name=kacrb21 password=P4sswordwifi \
    remote-address=172.168.1.189
add local-address=172.168.1.1 name=kacrb22 password=P4sswordwifi \
    remote-address=172.168.1.190
add local-address=172.168.1.1 name=mjl21 password=P4sswordwifi \
    remote-address=172.168.1.192
add local-address=172.168.1.1 name=mjl22 password=P4sswordwifi \
    remote-address=172.168.1.193
add local-address=172.168.1.1 name=mjl23 password=P4sswordwifi \
    remote-address=172.168.1.194
add local-address=172.168.1.1 name=cmh21 password=P4sswordwifi \
    remote-address=172.168.1.196
add local-address=172.168.1.1 name=bjr21 password=P4sswordwifi \
    remote-address=172.168.1.197
add local-address=172.168.1.1 name=bjr22 password=P4sswordwifi \
    remote-address=172.168.1.198
add local-address=172.168.1.1 name=bjr23 password=P4sswordwifi \
    remote-address=172.168.1.199
add local-address=172.168.1.1 name=bjr24 password=P4sswordwifi \
    remote-address=172.168.1.200
add local-address=172.168.1.1 name=kacrb23 password=P4sswordwifi \
    remote-address=172.168.1.191
add local-address=172.168.1.1 name=cianjur24 password=P4sswordwifi \
    remote-address=172.168.1.145
add local-address=172.168.1.1 name=cianjur23 password=P4sswordwifi \
    remote-address=172.168.1.144
add local-address=172.168.1.1 name=kacrb24 password=P4sswordwifi \
    remote-address=172.168.1.201
add local-address=1.6.0.29 name=SBG_21 password=123 profile=\
    default-encryption remote-address=1.6.208.117
add local-address=1.6.0.29 name=KABGR_23 password=123 profile=\
    default-encryption remote-address=1.6.208.99
add local-address=1.6.0.29 name=KRW_22 password=123 profile=\
    default-encryption remote-address=1.6.208.114
add local-address=1.6.0.29 name=CJR_24 password=123 profile=\
    default-encryption remote-address=1.6.208.108
add local-address=1.6.0.29 name=SUMEDANG1 password=123 profile=\
    default-encryption remote-address=1.6.208.73
add local-address=1.6.0.29 name=GEGERBENTENG password=123 profile=\
    default-encryption remote-address=1.6.208.74
add local-address=1.6.0.29 name=KALIBUNDER password=123 profile=\
    default-encryption remote-address=1.6.0.76
add local-address=1.6.208.2 name=PGD_26 password=123 remote-address=\
    1.6.208.134
add local-address=1.6.208.2 name=KBB_21 password=123 remote-address=\
    1.6.208.94
add local-address=1.6.208.2 name=KBB_22 password=123 remote-address=\
    1.6.208.95
add local-address=1.6.208.2 name=KBB_23 password=123 remote-address=\
    1.6.208.96
add local-address=1.6.208.2 name=KABGR_21 password=123 remote-address=\
    1.6.208.97
add local-address=1.6.208.2 name=KABGR_22 password=123 remote-address=\
    1.6.208.98
add local-address=1.6.208.2 name=KABGR_24 password=123 remote-address=\
    1.6.208.100
add local-address=1.6.208.2 name=KABGR_25 password=123 remote-address=\
    1.6.208.101
add local-address=1.6.208.2 name=KABGR_26 password=123 remote-address=\
    1.6.208.102
add local-address=1.6.208.2 name=KABGR_27 password=123 remote-address=\
    1.6.208.103
add local-address=1.6.208.2 name=KABGR_28 password=123 remote-address=\
    1.6.208.104
add local-address=1.6.208.2 name=CJR_21 password=123 remote-address=\
    1.6.208.105
add local-address=1.6.208.2 name=CJR_22 password=123 profile=\
    default-encryption remote-address=1.6.208.106
add local-address=1.6.208.2 name=CJR_23 password=123 remote-address=\
    1.6.208.107
add local-address=1.6.208.2 name=PKT_21 password=123 remote-address=\
    1.6.208.109
add local-address=1.6.208.2 name=SMD_21 password=123 remote-address=\
    1.6.208.110
add local-address=1.6.208.2 name=SMD_22 password=123 remote-address=\
    1.6.208.111
add local-address=1.6.208.2 name=SMD_23 password=123 remote-address=\
    1.6.208.112
add local-address=1.6.208.2 name=SMD_24 password=123 remote-address=\
    1.6.208.113
add local-address=1.6.208.2 name=KRW_23 password=123 remote-address=\
    1.6.208.115
add local-address=1.6.208.2 name=KRW_24 password=123 remote-address=\
    1.6.208.116
add local-address=1.6.208.2 name=SBG_22 password=123 remote-address=\
    1.6.208.118
add local-address=1.6.208.2 name=SBG_23 password=123 remote-address=\
    1.6.208.119
add local-address=1.6.208.2 name=GRT_21 password=123 remote-address=\
    1.6.208.120
add local-address=1.6.208.2 name=KATSK_21 password=123 remote-address=\
    1.6.208.121
add local-address=1.6.208.2 name=KATSK_22 password=123 remote-address=\
    1.6.208.122
add local-address=1.6.208.2 name=KATSK_23 password=123 remote-address=\
    1.6.208.123
add local-address=1.6.208.2 name=KATSK_24 password=123 remote-address=\
    1.6.208.124
add local-address=1.6.208.2 name=CMS_21 password=123 remote-address=\
    1.6.208.125
add local-address=1.6.208.2 name=CMS_22 password=123 remote-address=\
    1.6.208.126
add local-address=1.6.208.2 name=CMS_23 password=123 remote-address=\
    1.6.208.127
add local-address=1.6.208.2 name=CMS_24 password=123 remote-address=\
    1.6.208.128
add local-address=1.6.208.2 name=PGD_21 password=123 remote-address=\
    1.6.208.129
add local-address=1.6.208.2 name=PGD_22 password=123 remote-address=\
    1.6.208.130
add local-address=1.6.208.2 name=PGD_23 password=123 remote-address=\
    1.6.208.131
add local-address=1.6.208.2 name=PGD_24 password=123 remote-address=\
    1.6.208.132
add local-address=1.6.208.2 name=PGD_25 password=123 remote-address=\
    1.6.208.133
add local-address=1.6.208.2 name=PGD_27 password=123 remote-address=\
    1.6.208.135
add local-address=1.6.208.2 name=PGD_28 password=123 remote-address=\
    1.6.208.136
add local-address=1.6.208.2 name=PGD_29 password=123 remote-address=\
    1.6.208.137
add local-address=1.6.208.2 name=KABKS_21 password=123 remote-address=\
    1.6.208.138
add local-address=1.6.208.2 name=KABKS_22 password=123 remote-address=\
    1.6.208.139
add local-address=1.6.208.2 name=KABKS_23 password=123 remote-address=\
    1.6.208.140
add local-address=1.6.208.2 name=KABKS_24 password=123 remote-address=\
    1.6.208.141
add local-address=1.6.208.2 name=IDRM_21 password=123 remote-address=\
    1.6.208.142
add local-address=1.6.208.2 name=IDRM_22 password=123 remote-address=\
    1.6.208.143
add local-address=1.6.208.2 name=IDRM_23 password=123 remote-address=\
    1.6.208.144
add local-address=1.6.208.2 name=IDRM_24 password=123 remote-address=\
    1.6.208.145
add local-address=1.6.208.2 name=IDRM_25 password=123 remote-address=\
    1.6.208.146
add local-address=1.6.208.2 name=IDRM_26 password=123 remote-address=\
    1.6.208.147
add local-address=1.6.208.2 name=IDRM_27 password=123 remote-address=\
    1.6.208.148
add local-address=1.6.208.2 name=IDRM_28 password=123 remote-address=\
    1.6.208.149
add local-address=1.6.208.2 name=IDRM_29 password=123 remote-address=\
    1.6.208.150
add local-address=1.6.208.2 name=KACRB_21 password=123 remote-address=\
    1.6.208.151
add local-address=1.6.208.2 name=KACRB_22 password=123 remote-address=\
    1.6.208.152
add local-address=1.6.208.2 name=MJL_21 password=123 remote-address=\
    1.6.208.153
add local-address=1.6.208.2 name=MJL_22 password=123 remote-address=\
    1.6.208.154
add local-address=1.6.208.2 name=MJL_23 password=123 remote-address=\
    1.6.208.155
add local-address=1.6.208.2 name=KNG_21 password=123 remote-address=\
    1.6.208.156
add local-address=1.6.208.2 name=CMH_21 password=123 remote-address=\
    1.6.208.157
add local-address=1.6.208.2 name=BJR_21 password=123 remote-address=\
    1.6.208.158
add local-address=1.6.208.2 name=BJR_22 password=123 remote-address=\
    1.6.208.159
add local-address=1.6.208.2 name=BJR_23 password=123 remote-address=\
    1.6.208.160
add local-address=1.6.208.2 name=BJR_24 password=123 remote-address=\
    1.6.208.161
add local-address=1.6.208.2 name=INDRAMAYU3 password=123 remote-address=\
    1.6.208.68
add local-address=1.6.208.2 name=INDRAMAYU1 password=123 remote-address=\
    1.6.208.69
add local-address=1.6.208.2 name=KUNINGAN14 password=123 remote-address=\
    1.6.208.70
add local-address=1.6.208.2 name=MITRARAHARJA1 password=123 remote-address=\
    1.6.208.71
add local-address=1.6.208.2 name=MITRARAHARJA2 password=123 remote-address=\
    1.6.208.72
add local-address=1.6.208.2 name=CIHAPITAN password=123 remote-address=\
    1.6.208.75
add local-address=1.6.208.2 name=GARUT2 password=123 remote-address=\
    1.6.208.76
add local-address=1.6.208.2 name=GARUT1 password=123 remote-address=\
    1.6.208.77
add local-address=1.6.208.2 name=MOTEKAR1 password=123 remote-address=\
    1.6.208.78
add local-address=1.6.208.2 name=MOTEKAR2 password=123 remote-address=\
    1.6.208.79
add local-address=1.6.208.2 name=SUBANG2 password=123 remote-address=\
    1.6.208.81
add local-address=1.6.208.2 name=SUBANG1 password=123 remote-address=\
    1.6.208.80
add local-address=1.6.208.2 name=KBB5 password=123 remote-address=1.6.208.82
add local-address=1.6.208.2 name=KBB6 password=123 remote-address=1.6.208.83
add local-address=1.6.208.2 name=BOGOR21 password=123 remote-address=\
    1.6.208.84
add local-address=1.6.208.2 name=BOGOR17 password=123 remote-address=\
    1.6.208.85
add local-address=1.6.208.2 name=BOGOR23 password=123 remote-address=\
    1.6.208.86
add local-address=1.6.208.2 name=CIANJUR1 password=123 remote-address=\
    1.6.208.87
add local-address=1.6.208.2 name=CIANJUR11A password=123 remote-address=\
    1.6.208.88
add local-address=1.6.208.2 name=CIANJUR11B password=123 remote-address=\
    1.6.208.89
add local-address=1.6.208.2 name=CILETUHMANDIRI password=123 remote-address=\
    1.6.208.90
add local-address=1.6.208.2 name=CISOLOKNANELOK password=123 remote-address=\
    1.6.208.91
add local-address=1.6.208.2 name=RANCABALI1 password=123 remote-address=\
    1.6.208.92
add local-address=1.6.208.2 name=RANCABALI2 password=123 remote-address=\
    1.6.208.93
add local-address=1.6.0.29 name=PAGELARAN password=123 remote-address=\
    1.6.0.79
add local-address=1.6.0.29 name=AWILEGA password=123 profile=\
    default-encryption remote-address=1.6.0.51
add local-address=172.168.1.1 name=SUB1 password=P4sswordwifi remote-address=\
    172.168.1.202
add local-address=172.168.1.1 name=SUB2 password=P4sswordwifi remote-address=\
    172.168.1.203
add local-address=1.6.208.2 name=SUB_2 password=123 remote-address=1.6.208.62
add local-address=1.6.208.2 name=SUB_1 password=123 remote-address=1.6.208.60
add local-address=1.6.0.29 name=GIRIJAYA password=123 profile=\
    default-encryption remote-address=1.6.0.50
add local-address=172.168.1.1 name=kabks24 password=P4sswordwifi \
    remote-address=172.168.1.179
add local-address=1.6.0.29 name=KARANGMULYA password=123 profile=\
    default-encryption remote-address=1.6.0.49
add local-address=172.168.1.1 name=kng21 password=P4sswordwifi \
    remote-address=172.168.1.195
add local-address=1.6.0.29 name=CIBENDA password=123 profile=\
    default-encryption remote-address=1.6.0.48
add local-address=1.6.0.29 name=CIPALI password=123 profile=\
    default-encryption remote-address=1.6.0.44
add local-address=1.6.0.29 name=CIPALI-A password=123 profile=\
    default-encryption remote-address=1.6.0.45
add local-address=1.6.0.29 name=CIPALI-B password=123 profile=\
    default-encryption remote-address=1.6.0.46
add local-address=1.6.0.29 name=BEKASI1 password=123 profile=\
    default-encryption remote-address=1.6.0.35
add local-address=1.6.0.29 name=BEKASI2 password=123 profile=\
    default-encryption remote-address=1.6.0.37
add local-address=1.6.0.29 name=BATUJAYA password=123 profile=\
    default-encryption remote-address=1.6.0.38
add local-address=172.168.1.1 name=cipali130a password=P4sswordcipali \
    remote-address=172.168.1.204
add local-address=172.168.1.1 name=cipali130b password=P4sswordcipali \
    remote-address=172.168.1.205
add local-address=172.168.1.1 name=kabks22 password=P4sswordwifi \
    remote-address=172.168.1.177
/snmp
set enabled=yes trap-community=lapublic
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name="B/H Tunneling"
