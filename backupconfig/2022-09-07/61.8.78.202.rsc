# sep/07/2022 10:59:39 by RouterOS 6.40.8
# software id = 05EL-3SS7
#
# model = 1100AHx2
# serial number = 47B804E814C7
/interface bridge
add fast-forward=no mtu=1500 name=bridge-A protocol-mode=none
add fast-forward=no mtu=1500 name=loopback protocol-mode=none
/interface ethernet
set [ find default-name=ether1 ] mtu=1598 speed=1Gbps
set [ find default-name=ether2 ] l2mtu=1600 name="ether2 - CCTV" speed=1Gbps
set [ find default-name=ether3 ] mtu=1598 name=\
    "ether3 - METRO BACKUP 2017007461"
set [ find default-name=ether4 ] name="ether4 - INTERNET BACKUP 2015007102"
set [ find default-name=ether5 ] name="ether5 - A"
set [ find default-name=ether6 ] name="ether6 -  INTERNET 2015007101" speed=\
    1Gbps
set [ find default-name=ether7 ] name="ether7 - B"
set [ find default-name=ether8 ] name="ether8 - A"
set [ find default-name=ether9 ] name="ether9 - METRO  MAIN 2016008162"
set [ find default-name=ether12 ] name="ether12 - F"
set [ find default-name=ether13 ] name="ether13 - A"
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CERES
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=3des
/queue tree
add comment=INTERNET-DOWNLOAD max-limit=100M name=Download-A parent=bridge-A \
    queue=default
add comment=INTERNET-UPLOAD max-limit=100M name=Upload-A parent=\
    "ether6 -  INTERNET 2015007101" queue=default
add limit-at=30M max-limit=50M name=internet packet-mark=internet parent=\
    Download-A queue=default
add limit-at=5M max-limit=11M name=vip packet-mark=vip parent=Download-A \
    priority=1 queue=default
add limit-at=45M max-limit=45M name=remote_sites packet-mark=remote_sites \
    parent=Download-A queue=default
add limit-at=3M max-limit=15M name="internet\"" packet-mark=internet parent=\
    Upload-A queue=default
add limit-at=4M max-limit=11M name="vip\"" packet-mark=vip parent=Upload-A \
    priority=1 queue=default
add limit-at=50M max-limit=50M name="remote_sites\"" packet-mark=remote_sites \
    parent=Upload-A queue=default
add max-limit=6M name=Download-B parent="ether7 - B" queue=default
add max-limit=6M name=Upload-B parent="ether6 -  INTERNET 2015007101" queue=\
    default
add max-limit=75M name="Upload-A\"" parent=\
    "ether4 - INTERNET BACKUP 2015007102" queue=default
add max-limit=6M name="Upload-B\"" parent=\
    "ether4 - INTERNET BACKUP 2015007102" queue=default
add limit-at=3M max-limit=11M name="internet\"'" packet-mark=internet parent=\
    "Upload-A\"" queue=default
add limit-at=50M max-limit=50M name="remote_sites\"\"" packet-mark=\
    remote_sites parent="Upload-A\"" queue=default
add limit-at=4M max-limit=11M name="vip\"\"" packet-mark=vip parent=\
    "Upload-A\"" queue=default
add limit-at=6M max-limit=6M name="voip\"'" packet-mark=voip parent=\
    "Upload-B\"" queue=default
add max-limit=5M name=Download-C parent=bridge-A queue=default
add limit-at=5M max-limit=5M name=m2m packet-mark=m2m parent=Download-C \
    queue=default
add max-limit=5M name=Upload-C parent="ether6 -  INTERNET 2015007101" queue=\
    default
add max-limit=5M name="Upload-C\"" parent=\
    "ether4 - INTERNET BACKUP 2015007102" queue=default
add limit-at=5M max-limit=5M name="m2m\"" packet-mark=m2m parent=Upload-C \
    queue=default
add limit-at=5M max-limit=5M name="m2m\"'" packet-mark=m2m parent=\
    "Upload-C\"" queue=default
add comment=JAH-DOWNLOAD max-limit=50M name="Download JAH" parent=\
    "ether12 - F" queue=default
add limit-at=20M max-limit=50M name=oracle_ebs_jah packet-mark=oracle_ebs_jah \
    parent="Download JAH" queue=default
add limit-at=20M max-limit=50M name=discoverer_jah packet-mark=discoverer_jah \
    parent="Download JAH" queue=default
add limit-at=8M max-limit=50M name=orange_hr_jah packet-mark=orange_hr_jah \
    parent="Download JAH" queue=default
add limit-at=2M max-limit=50M name=mail_jah packet-mark=mail_jah parent=\
    "Download JAH" queue=default
add comment=JAH-UPLOAD max-limit=50M name="Upload JAH" parent=\
    "ether9 - METRO  MAIN 2016008162" queue=default
add limit-at=20M max-limit=50M name="discoverer_jah'" packet-mark=\
    discoverer_jah parent="Upload JAH" queue=default
add limit-at=2M max-limit=50M name="mail_jah'" packet-mark=mail_jah parent=\
    "Upload JAH" queue=default
add limit-at=20M max-limit=50M name="oracle_ebs_jah'" packet-mark=\
    oracle_ebs_jah parent="Upload JAH" queue=default
add limit-at=8M max-limit=50M name="orange_hr_jah'" packet-mark=orange_hr_jah \
    parent="Upload JAH" queue=default
add max-limit=15M name=Download-D parent=bridge-A queue=default
add limit-at=15M max-limit=15M name=mail packet-mark=mail parent=Download-D \
    queue=default
add max-limit=15M name=Upload-D parent="ether6 -  INTERNET 2015007101" queue=\
    default
add limit-at=20M max-limit=20M name="mail\"" packet-mark=mail parent=Upload-D \
    queue=default
add limit-at=40M max-limit=40M name=cctv packet-mark=cctv parent=Download-A \
    priority=1 queue=default
add limit-at=40M max-limit=40M name="cctv'" packet-mark=cctv parent=Upload-A \
    priority=1 queue=default
add limit-at=40M max-limit=40M name="cctv\"\"" packet-mark=cctv parent=\
    "Upload-A\"" queue=default
add max-limit=15M name="Upload-D\"" parent=\
    "ether4 - INTERNET BACKUP 2015007102" queue=default
add limit-at=6M max-limit=6M name=voip packet-mark=voip parent=Download-B \
    queue=default
add limit-at=6M max-limit=6M name="voip\"" packet-mark=voip parent=Upload-B \
    queue=default
add limit-at=20M max-limit=20M name="mail\"'" packet-mark=mail parent=\
    "Upload-D\"" queue=default
/routing bgp instance
set default as=64512 router-id=10.1.1.1
add as=64589 client-to-client-reflection=no name=internet
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0 name=lapublic
add addresses=::/0 name=cpepublic
/system logging action
set 0 memory-lines=100
set 1 disk-lines-per-file=100
add name=action1 remote=202.152.63.117 target=remote
/interface bridge port
add bridge=bridge-A interface="ether5 - A"
add bridge=bridge-A interface="ether8 - A"
add bridge=bridge-A interface="ether13 - A"
add bridge=bridge-A interface="ether2 - CCTV"
/ip address
add address=61.8.78.202/30 interface="ether6 -  INTERNET 2015007101" network=\
    61.8.78.200
add address=182.23.28.241/29 interface=bridge-A network=182.23.28.240
add address=182.23.28.249/29 interface=bridge-A network=182.23.28.248
add address=202.152.36.169/29 interface="ether7 - B" network=202.152.36.168
add address=202.152.63.121/29 interface=bridge-A network=202.152.63.120
add address=123.231.246.233/29 interface=bridge-A network=123.231.246.232
add address=182.23.31.82/28 interface="ether4 - INTERNET BACKUP 2015007102" \
    network=182.23.31.80
add address=10.1.1.1 interface=loopback network=10.1.1.1
add address=182.23.32.1/29 disabled=yes interface=bridge-A network=\
    182.23.32.0
add address=10.12.12.9/29 interface="ether9 - METRO  MAIN 2016008162" \
    network=10.12.12.8
add address=172.20.0.41/29 interface="ether12 - F" network=172.20.0.40
add address=172.20.0.49/29 interface="ether12 - F" network=172.20.0.48
add address=172.20.0.57/29 interface="ether12 - F" network=172.20.0.56
add address=202.152.61.49/29 interface="ether7 - B" network=202.152.61.48
add address=182.23.9.209/28 interface=bridge-A network=182.23.9.208
add address=10.121.121.9/29 interface="ether3 - METRO BACKUP 2017007461" \
    network=10.121.121.8
add address=172.20.0.33/29 interface="ether12 - F" network=172.20.0.32
add address=172.20.0.1/28 interface=ether11 network=172.20.0.0
add address=123.231.189.193/29 interface=bridge-A network=123.231.189.192
/ip dns
set allow-remote-requests=yes servers=202.152.0.2,202.152.5.36
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/16 list=private
/ip firewall filter
add action=drop chain=forward comment="dns brute forces" dst-port=53 \
    in-interface="ether6 -  INTERNET 2015007101" protocol=udp
add action=drop chain=forward dst-port=53 in-interface=\
    "ether6 -  INTERNET 2015007101" protocol=tcp
add action=drop chain=input dst-port=53 in-interface=\
    "ether6 -  INTERNET 2015007101" protocol=udp
add action=drop chain=input dst-port=53 in-interface=\
    "ether6 -  INTERNET 2015007101" protocol=tcp
add action=drop chain=forward comment="ip private" dst-address-list=!private \
    src-address-list=private
add action=drop chain=input dst-address-list=!private src-address-list=\
    private
add action=drop chain=input comment="drop ssh brute forcers" dst-port=22 \
    protocol=tcp src-address-list=ssh_blacklist
add action=add-src-to-address-list address-list=ssh_blacklist \
    address-list-timeout=1w3d chain=input connection-state=new dst-port=22 \
    protocol=tcp src-address-list=ssh_stage3
add action=add-src-to-address-list address-list=ssh_stage3 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22 \
    protocol=tcp src-address-list=ssh_stage2
add action=add-src-to-address-list address-list=ssh_stage2 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22 \
    protocol=tcp src-address-list=ssh_stage1
add action=add-src-to-address-list address-list=ssh_stage1 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22 \
    protocol=tcp
/ip firewall mangle
add action=mark-connection chain=prerouting new-connection-mark=internet \
    passthrough=yes src-address=182.23.28.240/29
add action=mark-packet chain=prerouting connection-mark=internet \
    new-packet-mark=internet passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=cctv \
    passthrough=yes src-address=123.231.189.192/29
add action=mark-packet chain=prerouting new-packet-mark=cctv packet-mark=cctv \
    passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=vip \
    passthrough=yes src-address=182.23.28.248/29
add action=mark-packet chain=prerouting connection-mark=vip new-packet-mark=\
    vip passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=voip \
    passthrough=yes src-address=202.152.36.168/29
add action=mark-connection chain=prerouting new-connection-mark=voip \
    passthrough=yes src-address=202.152.61.48/29
add action=mark-packet chain=prerouting connection-mark=voip new-packet-mark=\
    voip passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail \
    passthrough=yes src-address=202.152.63.120/29
add action=mark-connection chain=prerouting new-connection-mark=mail \
    passthrough=yes src-address=182.23.9.208/28
add action=mark-packet chain=prerouting connection-mark=mail new-packet-mark=\
    mail passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=remote_sites \
    passthrough=yes src-address=123.231.246.232/29
add action=mark-packet chain=prerouting connection-mark=remote_sites \
    new-packet-mark=remote_sites passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=m2m \
    passthrough=yes src-address=182.23.32.0/29
add action=mark-packet chain=prerouting connection-mark=m2m new-packet-mark=\
    m2m passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=oracle_log \
    passthrough=yes src-address=172.20.0.0/29
add action=mark-packet chain=prerouting connection-mark=oracle_log \
    new-packet-mark=oracle_log passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=oracle_ebs \
    passthrough=yes src-address=172.20.0.8/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs \
    new-packet-mark=oracle_ebs passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=discoverer \
    passthrough=yes src-address=172.20.0.16/29
add action=mark-packet chain=prerouting connection-mark=discoverer \
    new-packet-mark=discoverer passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=orange_hr \
    passthrough=yes src-address=172.20.0.24/29
add action=mark-packet chain=prerouting connection-mark=orange_hr \
    new-packet-mark=orange_hr passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    oracle_ebs_jah passthrough=yes src-address=172.20.0.32/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_jah \
    new-packet-mark=oracle_ebs_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    discoverer_jah passthrough=yes src-address=172.20.0.40/29
add action=mark-packet chain=prerouting connection-mark=discoverer_jah \
    new-packet-mark=discoverer_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=orange_hr_jah \
    passthrough=yes src-address=172.20.0.48/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_jah \
    new-packet-mark=orange_hr_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail_jah \
    passthrough=yes src-address=172.20.0.56/29
add action=mark-packet chain=prerouting connection-mark=mail_jah \
    new-packet-mark=mail_jah passthrough=no
/ip firewall nat
add action=dst-nat chain=dstnat disabled=yes dst-address=202.152.36.170 \
    to-addresses=172.20.0.2
add action=src-nat chain=srcnat disabled=yes src-address=172.20.0.2 \
    to-addresses=202.152.36.170
/ip firewall service-port
set h323 disabled=yes
set sip disabled=yes
/ip proxy
set cache-path=web-proxy1 parent-proxy=0.0.0.0
/ip route
add distance=1 dst-address=172.16.93.0/24 gateway=172.20.0.4
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=1234
set ssh port=212
set api disabled=yes
set winbox port=8188
/routing bgp network
add network=172.20.0.32/29 synchronize=no
add network=172.20.0.40/29 synchronize=no
add network=172.20.0.48/29 synchronize=no
add network=172.20.0.56/29 synchronize=no
add network=123.231.246.232/29 synchronize=no
add network=182.23.9.208/28 synchronize=no
add network=182.23.28.240/29 synchronize=no
add network=182.23.28.248/29 synchronize=no
add network=202.152.63.120/29 synchronize=no
add network=202.152.36.168/29 synchronize=no
add network=202.152.61.48/29 synchronize=no
add network=123.231.189.192/29 synchronize=no
/routing bgp peer
add in-filter=DC-IN name=DC-JAH remote-address=10.12.12.10 remote-as=64514 \
    ttl=default
add in-filter=DC-BACKUP name=DC-BACKUP remote-address=10.121.121.10 \
    remote-as=64514 ttl=default update-source=\
    "ether3 - METRO BACKUP 2017007461"
add in-filter=NET-IN instance=internet name=INET out-filter=NET-OUT \
    remote-address=61.8.78.201 remote-as=4800 ttl=default
add in-filter=NET-IN-BACKUP instance=internet name=INET-BACKUP out-filter=\
    NET-OUT-BACKUP remote-address=182.23.31.81 remote-as=4800 ttl=default
/routing filter
add action=accept chain=DC-IN prefix=172.20.1.40/29
add action=accept chain=DC-IN prefix=172.20.1.48/29
add action=accept chain=DC-IN prefix=172.20.1.56/29
add action=accept chain=DC-IN prefix=172.20.1.64/29
add action=discard chain=DC-IN
add action=accept chain=DC-BACKUP prefix=172.20.1.40/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.48/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.56/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.64/29 set-bgp-prepend=5
add action=discard chain=DC-BACKUP
add action=accept chain=NET-OUT prefix=123.231.246.232/29
add action=accept chain=NET-OUT-BACKUP prefix=123.231.246.232/29 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=202.152.36.168/29
add action=accept chain=NET-OUT-BACKUP prefix=202.152.36.168/29 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=202.152.63.120/29
add action=accept chain=NET-OUT-BACKUP prefix=202.152.63.120/29 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=182.23.28.248/29
add action=accept chain=NET-OUT-BACKUP prefix=182.23.28.248/29 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=202.152.61.48/29
add action=accept chain=NET-OUT-BACKUP prefix=202.152.61.48/29
add action=accept chain=NET-OUT prefix=182.23.28.240/29
add action=accept chain=NET-OUT-BACKUP prefix=182.23.28.240/29 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=182.23.9.208/28
add action=accept chain=NET-OUT-BACKUP prefix=182.23.9.208/28 \
    set-bgp-prepend=5
add action=accept chain=NET-OUT prefix=182.23.32.0/29
add action=accept chain=NET-OUT-BACKUP prefix=182.23.32.0/29 set-bgp-prepend=\
    5
add action=accept chain=NET-OUT prefix=123.231.189.192/29
add action=accept chain=NET-OUT-BACKUP prefix=123.231.189.192/29 \
    set-bgp-prepend=5
add action=discard chain=NET-OUT
add action=discard chain=NET-OUT-BACKUP
add action=accept chain=NET-IN prefix=0.0.0.0/0
add action=discard chain=NET-IN
add action=accept chain=NET-IN-BACKUP prefix=0.0.0.0/0 set-bgp-prepend=5
add action=discard chain=NET-IN-BACKUP
/snmp
set enabled=yes trap-version=2
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=CERES
/system logging
add action=action1 topics=info
add action=action1 topics=error
add action=action1 topics=warning
/system ntp client
set enabled=yes primary-ntp=103.28.56.14 secondary-ntp=162.159.200.123
/tool graphing interface
add interface="ether3 - METRO BACKUP 2017007461"
add interface="ether9 - METRO  MAIN 2016008162"
/tool graphing resource
add allow-address=123.231.246.233/32
