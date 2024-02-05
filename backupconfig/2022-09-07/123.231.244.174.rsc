# sep/01/2022 09:13:09 by RouterOS 6.42.10
# software id = 9V65-WU2N
#
# model = 1100AHx2
# serial number = 47B804EA9BF4
/interface bridge
add fast-forward=no mtu=1500 name=bridge-A protocol-mode=none
add fast-forward=no mtu=1500 name=loopback protocol-mode=none
/interface ethernet
set [ find default-name=ether1 ] mtu=1598
set [ find default-name=ether2 ] name="ether2 "
set [ find default-name=ether3 ] mtu=1598 name=\
    "ether3 - METRO BACKUP 2017007463"
set [ find default-name=ether4 ] name="ether4 - INTERNET BACKUP 2015007107"
set [ find default-name=ether5 ] name="ether5 - INTERNET 2015007106"
set [ find default-name=ether6 ] name="ether6 - A"
set [ find default-name=ether7 ] name="ether7 - METRO 2016008165"
set [ find default-name=ether8 ] name="ether8 - A"
set [ find default-name=ether9 ] name="ether9 - B - VOIP"
set [ find default-name=ether10 ] name="ether10 - A"
set [ find default-name=ether11 ] name="ether11 - D"
set [ find default-name=ether12 ] name="ether12 - LAN ORION"
/interface list
add exclude=dynamic name=discover
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=NIRWANA
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=3des
/queue tree
add max-limit=12M name=Download-C parent=bridge-A
add limit-at=1M max-limit=12M name=mail packet-mark=mail parent=Download-C
add max-limit=12M name=Upload-C parent="ether5 - INTERNET 2015007106"
add limit-at=1M max-limit=12M name="mail'" packet-mark=mail parent=Upload-C
add max-limit=12M name="Upload-C'" parent=\
    "ether4 - INTERNET BACKUP 2015007107"
add limit-at=1M max-limit=12M name="mail\"" packet-mark=mail parent=\
    "Upload-C'"
add max-limit=5M name=Upload-D parent="ether5 - INTERNET 2015007106"
add max-limit=5M name="Upload-D'" parent=\
    "ether4 - INTERNET BACKUP 2015007107"
add max-limit=5M name=Download-E parent="ether12 - LAN ORION"
add limit-at=1M max-limit=5M name=orion packet-mark=orion parent=Download-E \
    priority=1
add max-limit=5M name=Upload-E parent="ether5 - INTERNET 2015007106"
add limit-at=1M max-limit=5M name="orion'" packet-mark=orion parent=Upload-E
add max-limit=5M name="Upload-E'" parent=\
    "ether4 - INTERNET BACKUP 2015007107"
add limit-at=1M max-limit=5M name="orion''" packet-mark=orion parent=\
    "Upload-E'" priority=1
add comment=INTERNET-DOWNLOAD max-limit=105M name=Download-A parent=bridge-A \
    queue=default
add comment=INTERNET-UPLOAD max-limit=105M name=Upload-A parent=\
    "ether5 - INTERNET 2015007106" queue=default
add limit-at=1M max-limit=43M name=internet packet-mark=internet parent=\
    Download-A queue=default
add limit-at=50M max-limit=50M name=remote_sites packet-mark=remote_sites \
    parent=Download-A priority=1 queue=default
add limit-at=1M max-limit=43M name="internet\"" packet-mark=internet parent=\
    Upload-A queue=default
add limit-at=50M max-limit=50M name="remote_sites\"" packet-mark=remote_sites \
    parent=Upload-A queue=default
add limit-at=2M max-limit=5M name="vvip\"" packet-mark=vip parent=Upload-D \
    priority=1 queue=default
add limit-at=1M max-limit=10M name=vip packet-mark=top_mgt parent=Download-A \
    priority=2 queue=default
add limit-at=1M max-limit=2M name=b2b packet-mark=b2b parent=Download-A \
    priority=3 queue=default
add limit-at=1M max-limit=2M name="b2b\"" packet-mark=b2b parent=Upload-A \
    priority=3 queue=default
add limit-at=1M max-limit=10M name="vip\"\"\"" packet-mark=top_mgt parent=\
    Upload-A priority=2 queue=default
add max-limit=4M name=Download-B parent="ether9 - B - VOIP" queue=default
add max-limit=4M name=Upload-B parent="ether5 - INTERNET 2015007106" queue=\
    default
add max-limit=105M name="Upload-A\"" parent=\
    "ether4 - INTERNET BACKUP 2015007107" queue=default
add max-limit=4M name="Upload-B'" parent=\
    "ether4 - INTERNET BACKUP 2015007107" queue=default
add limit-at=1M max-limit=43M name="internet\"'" packet-mark=internet parent=\
    "Upload-A\"" queue=default
add limit-at=50M max-limit=50M name="remote_sites\"'" packet-mark=\
    remote_sites parent="Upload-A\"" queue=default
add limit-at=1M max-limit=10M name="vip\"'" packet-mark=top_mgt parent=\
    "Upload-A\"" priority=2 queue=default
add limit-at=2M max-limit=5M name="vvip\"'" packet-mark=vip parent=\
    "Upload-D'" priority=1 queue=default
add limit-at=4M max-limit=4M name="voip\"'" packet-mark=voip parent=\
    "Upload-B'" queue=default
add limit-at=1M max-limit=2M name="b2b\"'" packet-mark=b2b parent=\
    "Upload-A\"" priority=3 queue=default
add comment="JAH DOWNLOAD" max-limit=20M name="Dowload JAH" parent=\
    "ether11 - D" queue=default
add comment="JAH UPLOAD" max-limit=20M name="Upload JAH" parent=\
    "ether7 - METRO 2016008165" queue=default
add limit-at=8M max-limit=20M name=oracle_ebs_jah packet-mark=oracle_ebs_jah \
    parent="Dowload JAH" queue=default
add limit-at=8M max-limit=20M name=discoverer_jah packet-mark=discoverer_jah \
    parent="Dowload JAH" queue=default
add limit-at=3M max-limit=20M name=orange_hr_jah packet-mark=orange_hr_jah \
    parent="Dowload JAH" queue=default
add limit-at=1M max-limit=20M name=mail_jah packet-mark=mail_jah parent=\
    "Dowload JAH" queue=default
add limit-at=8M max-limit=20M name="discoverer_jah'" packet-mark=\
    discoverer_jah parent="Upload JAH" queue=default
add limit-at=1M max-limit=20M name="mail_jah'" packet-mark=mail_jah parent=\
    "Upload JAH" queue=default
add limit-at=8M max-limit=20M name="oracle_ebs_jah'" packet-mark=\
    oracle_ebs_jah parent="Upload JAH" queue=default
add limit-at=3M max-limit=20M name="orange_hr_jah'" packet-mark=orange_hr_jah \
    parent="Upload JAH" queue=default
add max-limit=5M name=Download-D parent=bridge-A queue=default
add limit-at=4M max-limit=4M name=voip packet-mark=voip parent=Download-B \
    queue=default
add limit-at=4M max-limit=4M name="voip\"" packet-mark=voip parent=Upload-B \
    queue=default
add limit-at=2M max-limit=5M name=vvip packet-mark=vip parent=Download-D \
    priority=1 queue=default
/routing bgp instance
set default as=64513 router-id=10.1.1.2
add as=64577 client-to-client-reflection=no name=Internet
/snmp community
set [ find default=yes ] name=lapublic
add addresses=::/0 name=cpepublic
/system logging action
set 0 memory-lines=100
set 1 disk-lines-per-file=100
add name=action1 remote=202.152.63.117 target=remote
/interface bridge port
add bridge=bridge-A hw=no interface="ether6 - A"
add bridge=bridge-A hw=no interface="ether10 - A"
add bridge=bridge-A hw=no interface="ether8 - A"
/ip neighbor discovery-settings
set discover-interface-list=discover
/interface list member
add interface="ether12 - LAN ORION" list=discover
add interface=ether13 list=discover
add interface=ether1 list=discover
add interface="ether2 " list=discover
add interface="ether3 - METRO BACKUP 2017007463" list=discover
add interface="ether4 - INTERNET BACKUP 2015007107" list=discover
add interface="ether5 - INTERNET 2015007106" list=discover
add interface="ether6 - A" list=discover
add interface="ether7 - METRO 2016008165" list=discover
add interface="ether8 - A" list=discover
add interface="ether9 - B - VOIP" list=discover
add interface="ether10 - A" list=discover
add interface="ether11 - D" list=discover
add interface=bridge-A list=discover
add interface=loopback list=discover
/ip address
add address=182.23.29.18/30 interface="ether4 - INTERNET BACKUP 2015007107" \
    network=182.23.29.16
add address=10.121.121.17/29 interface="ether3 - METRO BACKUP 2017007463" \
    network=10.121.121.16
add address=202.152.6.9/29 interface=bridge-A network=202.152.6.8
add address=182.23.33.193/29 interface=bridge-A network=182.23.33.192
add address=202.152.28.65/28 interface="ether9 - B - VOIP" network=\
    202.152.28.64
add address=182.23.37.201/29 interface=bridge-A network=182.23.37.200
add address=182.23.98.153/29 interface=bridge-A network=182.23.98.152
add address=182.23.21.177/29 interface=bridge-A network=182.23.21.176
add address=61.8.75.81/29 interface=bridge-A network=61.8.75.80
add address=10.1.1.2 interface=loopback network=10.1.1.2
add address=172.20.0.161/29 interface="ether11 - D" network=172.20.0.160
add address=172.20.0.169/29 interface="ether11 - D" network=172.20.0.168
add address=172.20.0.177/29 interface="ether11 - D" network=172.20.0.176
add address=172.20.0.185/29 interface="ether11 - D" network=172.20.0.184
add address=10.12.12.17/29 interface="ether7 - METRO 2016008165" network=\
    10.12.12.16
add address=123.231.244.174/30 interface="ether5 - INTERNET 2015007106" \
    network=123.231.244.172
add address=202.152.59.161/29 interface="ether9 - B - VOIP" network=\
    202.152.59.160
add address=182.23.109.241/28 interface=bridge-A network=182.23.109.240
add address=182.23.104.113/28 interface="ether12 - LAN ORION" network=\
    182.23.104.112
/ip dns
set servers=202.152.5.36,202.152.0.2
/ip firewall address-list
add address=10.0.0.0/8 list=private
add address=172.16.0.0/12 list=private
add address=192.168.0.0/24 list=private
add address=61.8.75.80/29 list=publik
add address=182.23.21.176/29 list=publik
add address=182.23.33.192/29 list=publik
add address=182.23.37.200/29 list=publik
add address=182.23.98.152/29 list=publik
add address=202.152.6.8/29 list=publik
/ip firewall filter
add action=drop chain=forward dst-address-list=!private src-address-list=\
    private
add action=drop chain=input dst-address-list=!private src-address-list=\
    private
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
/ip firewall mangle
add action=mark-connection chain=prerouting new-connection-mark=internet \
    passthrough=yes src-address=202.152.6.8/29
add action=mark-packet chain=prerouting connection-mark=internet \
    new-packet-mark=internet passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=orion \
    passthrough=yes src-address=182.23.104.112/28
add action=mark-packet chain=prerouting connection-mark=orion \
    new-packet-mark=orion passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=vip \
    passthrough=yes src-address=182.23.33.192/29
add action=mark-packet chain=prerouting connection-mark=vip new-packet-mark=\
    vip passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=voip \
    passthrough=yes src-address=202.152.28.64/28
add action=mark-connection chain=prerouting new-connection-mark=voip \
    passthrough=yes src-address=202.152.59.160/29
add action=mark-packet chain=prerouting connection-mark=voip new-packet-mark=\
    voip passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail \
    passthrough=yes src-address=182.23.37.200/29
add action=mark-connection chain=prerouting new-connection-mark=mail \
    passthrough=yes src-address=182.23.109.240/28
add action=mark-packet chain=prerouting connection-mark=mail new-packet-mark=\
    mail passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=remote_sites \
    passthrough=yes src-address=182.23.98.152/29
add action=mark-packet chain=prerouting connection-mark=remote_sites \
    new-packet-mark=remote_sites passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=top_mgt \
    passthrough=yes src-address=61.8.75.80/29
add action=mark-packet chain=prerouting connection-mark=top_mgt \
    new-packet-mark=top_mgt passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=b2b \
    passthrough=yes src-address=182.23.21.176/29
add action=mark-packet chain=prerouting connection-mark=b2b new-packet-mark=\
    b2b passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    oracle_ebs_jah passthrough=yes src-address=172.20.0.160/29
add action=mark-packet chain=prerouting connection-mark=oracle_ebs_jah \
    new-packet-mark=oracle_ebs_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=\
    discoverer_jah passthrough=yes src-address=172.20.0.168/29
add action=mark-packet chain=prerouting connection-mark=discoverer_jah \
    new-packet-mark=discoverer_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=orange_hr_jah \
    passthrough=yes src-address=172.20.0.176/29
add action=mark-packet chain=prerouting connection-mark=orange_hr_jah \
    new-packet-mark=orange_hr_jah passthrough=no
add action=mark-connection chain=prerouting new-connection-mark=mail_jah \
    passthrough=yes src-address=172.20.0.184/29
add action=mark-packet chain=prerouting connection-mark=mail_jah \
    new-packet-mark=mail_jah passthrough=no
add action=set-priority chain=forward new-priority=7 passthrough=no protocol=\
    icmp src-address-list=publik
/ip firewall nat
# in/out-interface matcher not possible when interface (ether6 - A) is slave - use master instead (bridge-A)
add action=masquerade chain=srcnat dst-port=80 out-interface="ether6 - A" \
    protocol=tcp src-address=192.168.0.0/24
/ip proxy
set cache-path=web-proxy1 parent-proxy=0.0.0.0
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=1234
set ssh port=212
set api disabled=yes
set winbox port=8188
/routing bgp network
add network=172.20.0.160/29 synchronize=no
add network=172.20.0.168/29 synchronize=no
add network=172.20.0.176/29 synchronize=no
add network=172.20.0.184/29 synchronize=no
add network=61.8.75.80/29 synchronize=no
add network=182.23.21.176/29 synchronize=no
add network=182.23.33.192/29 synchronize=no
add network=182.23.37.200/29 synchronize=no
add network=182.23.98.152/29 synchronize=no
add network=182.23.109.240/28 synchronize=no
add network=202.152.6.8/29 synchronize=no
add network=202.152.28.64/28 synchronize=no
add network=202.152.59.160/29 synchronize=no
add network=182.23.104.112/28 synchronize=no
/routing bgp peer
add in-filter=DC-IN name=DC-JAH remote-address=10.12.12.18 remote-as=64514 \
    ttl=default
add in-filter=DC-BACKUP name=DC-BACKUP remote-address=10.121.121.18 \
    remote-as=64514 ttl=default update-source=\
    "ether3 - METRO BACKUP 2017007463"
add in-filter=INET-IN instance=Internet name=INET-MAIN out-filter=INET-OUT \
    remote-address=123.231.244.173 remote-as=4800 ttl=default
add in-filter=INET-IN-BACKUP instance=Internet name=INET-BACKUP out-filter=\
    INET-OUT-BACKUP remote-address=182.23.29.17 remote-as=4800 ttl=default
/routing filter
add action=accept chain=DC-IN prefix=172.20.1.8/29
add action=accept chain=DC-IN prefix=172.20.1.16/29
add action=accept chain=DC-IN prefix=172.20.1.24/29
add action=accept chain=DC-IN prefix=172.20.1.32/29
add action=discard chain=DC-IN
add action=accept chain=DC-BACKUP prefix=172.20.1.8/29 set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.16/29 set-bgp-prepend=5
add action=accept bgp-communities="" chain=DC-BACKUP prefix=172.20.1.24/29 \
    set-bgp-prepend=5
add action=accept chain=DC-BACKUP prefix=172.20.1.32/29 set-bgp-prepend=5
add action=discard chain=DC-BACKUP
add action=accept chain=INET-OUT prefix=61.8.75.80/29
add action=accept chain=INET-OUT prefix=182.23.104.112/28
add action=accept chain=INET-OUT prefix=182.23.21.176/29
add action=accept chain=INET-OUT prefix=182.23.33.192/29
add action=accept chain=INET-OUT prefix=182.23.37.200/29
add action=accept chain=INET-OUT prefix=182.23.98.152/29
add action=accept chain=INET-OUT prefix=182.23.109.240/28
add action=accept chain=INET-OUT prefix=202.152.6.8/29
add action=accept chain=INET-OUT prefix=202.152.28.64/28
add action=accept chain=INET-OUT prefix=202.152.59.160/29
add action=discard chain=INET-OUT
add action=accept chain=INET-OUT-BACKUP prefix=61.8.75.80/29 set-bgp-prepend=\
    5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.21.176/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.33.192/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.37.200/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.98.152/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.109.240/28 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=202.152.6.8/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=202.152.28.64/28 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=202.152.59.160/29 \
    set-bgp-prepend=5
add action=accept chain=INET-OUT-BACKUP prefix=182.23.104.112/28 \
    set-bgp-prepend=5
add action=discard chain=INET-OUT-BACKUP
add action=accept chain=INET-IN prefix=0.0.0.0/0
add action=discard chain=INET-IN
add action=accept chain=INET-IN-BACKUP prefix=0.0.0.0/0 set-bgp-prepend=5
add action=discard chain=INET-IN-BACKUP
/snmp
set enabled=yes location=Bekasi trap-community=cpepublic trap-version=2
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=NIRWANA
/system logging
add action=action1 topics=info
add action=action1 topics=error
add action=action1 topics=warning
/system ntp client
set enabled=yes primary-ntp=203.160.128.178
/system routerboard settings
set silent-boot=no
/tool graphing interface
add interface="ether3 - METRO BACKUP 2017007463"
add interface="ether7 - METRO 2016008165"
