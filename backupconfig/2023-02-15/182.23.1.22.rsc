# feb/15/2023 05:01:53 by RouterOS 6.48.1
# software id = VCEC-67DU
#
# model = CCR1072-1G-8S+
# serial number = D8410CD9A0B3
/interface bridge
add name=Lo
/interface ethernet
set [ find default-name=sfp-sfpplus1 ] comment=\
    TRK-PALO_3260-10G-BDGDISSR01_LINE3
set [ find default-name=sfp-sfpplus2 ] comment=PUBLIC-ASR l2mtu=1500
set [ find default-name=sfp-sfpplus3 ] comment=PRIVATE-SOPHOS
set [ find default-name=sfp-sfpplus6 ] advertise="10M-half,10M-full,100M-half,\
    100M-full,1000M-half,1000M-full,2500M-full,5000M-full,10000M-full" \
    comment=TRK-PALO-10G-OPTIC2
/interface vlan
add interface=sfp-sfpplus1 name=2020240094-BPSDM vlan-id=130
add interface=sfp-sfpplus1 name=2020240165-DPMPTSP vlan-id=109
add interface=sfp-sfpplus1 name=2020240168-DLH vlan-id=110
add interface=sfp-sfpplus1 name=2020240178-DISPERKIM vlan-id=111
add interface=sfp-sfpplus1 name=2020240186-DISPUSIPDA vlan-id=116
add interface=sfp-sfpplus1 name=2020240189-BPBD vlan-id=123
add interface=sfp-sfpplus6 name="2020240190-BADAN PENGHUBUNG" vlan-id=100
add interface=sfp-sfpplus1 name=2020240191-BP2D vlan-id=120
add interface=sfp-sfpplus1 name=2020240193-BAPENDA vlan-id=122
add interface=sfp-sfpplus1 name="2020240206-UPTD KASDA" vlan-id=112
add interface=sfp-sfpplus1 name="2020240221-RS PARU" vlan-id=127
add interface=sfp-sfpplus1 name=2020240222-RSJ vlan-id=103
add interface=sfp-sfpplus1 name="2020240224-RSUD AL-IHSAN" vlan-id=2570
add interface=sfp-sfpplus1 name="2020240228-RSUD PAMEUNGPEUK" vlan-id=2341
add interface=sfp-sfpplus1 name="2020240234-RSUD JAMPANG KULON" vlan-id=2339
add interface=sfp-sfpplus1 name="2021240541-RSUD KESEHATAN KERJA" vlan-id=105
add interface=sfp-sfpplus1 name="2021240544-UPTD PENGELOLAAN SAMPAH" vlan-id=\
    150
add interface=sfp-sfpplus1 name="2021240546-UPTD P3JB" vlan-id=171
add interface=sfp-sfpplus1 name="2021240823-CADISDIK WIL VIII" vlan-id=163
add interface=sfp-sfpplus1 name="2021240828-CADISDIK WIL X" vlan-id=195
add interface=sfp-sfpplus1 name="2021240829-CADISDIK WIL XI" vlan-id=146
add interface=sfp-sfpplus1 name=2021240832-UPTD_DISDIK_XII vlan-id=108
add interface=sfp-sfpplus1 name="2021240847-UPTD PPKS" vlan-id=104
add interface=sfp-sfpplus1 name="2021240859-UPTD PSRPD MENSENETRUWITU" \
    vlan-id=107
add interface=sfp-sfpplus1 name="2021240869-UPTD BBH" vlan-id=155
add interface=sfp-sfpplus1 name="2021240872-UPTD BPSBPTH" vlan-id=157
add interface=sfp-sfpplus1 name="2021240873-UPTD BPTPH" vlan-id=158
add interface=sfp-sfpplus1 name="2021240876-UPTD PPMPP" vlan-id=194
add interface=sfp-sfpplus1 name="2021240877-UPTD PSDKPWU" vlan-id=196
add interface=sfp-sfpplus1 name="2021240881-CADISHUT WIL I" vlan-id=133
add interface=sfp-sfpplus1 name="2021240883-CADISHUT WIL II" vlan-id=160
add interface=sfp-sfpplus1 name="2021240895-CADISHUT WIL IV" vlan-id=2353
add interface=sfp-sfpplus1 name="2021240931-CADISHUT WIL VI" vlan-id=2342
add interface=sfp-sfpplus1 name="2021240932-CADISHUT WIL VII" vlan-id=2346
add interface=sfp-sfpplus1 name="2021241005-UPTD P3LLAJ WIL II" vlan-id=152
add interface=sfp-sfpplus1 name="2021241007-UPTD P3LLAJ WIL IV" vlan-id=198
add interface=sfp-sfpplus1 name="2021241008-UPTD P3LLASDP" vlan-id=154
add interface=sfp-sfpplus1 name="2021241045-UPTD PSDA WS CILIWUNG-CISADANE" \
    vlan-id=135
add interface=sfp-sfpplus1 name="2021241046-UPTD PSDA WS CISADEA-CIBARENO" \
    vlan-id=165
add interface=sfp-sfpplus1 name="2021241047-UPTD PSDA WS CITARUM" vlan-id=126
add interface=sfp-sfpplus1 name="2021241139-UPTD PSDA WS CITANDUY" vlan-id=\
    137
add interface=sfp-sfpplus1 name="2021241150-CABANG DESDM WIL II BGR" vlan-id=\
    132
add interface=sfp-sfpplus1 name="2021241156-CABANG DESDM WIL III PWK" \
    vlan-id=161
add interface=sfp-sfpplus1 name="2021241312-CABANG DESDM WIL IV BDG" vlan-id=\
    141
add interface=sfp-sfpplus1 name="2021241320-UPTD P3W" vlan-id=124
add interface=sfp-sfpplus1 name="2021241345-UPTD INDUSTRI LOGAM" vlan-id=121
add interface=sfp-sfpplus1 name="2021241347-UPTD BPSMB AMDK" vlan-id=197
add interface=sfp-sfpplus1 name="2021241348-UPTD BPSMB AGRO" vlan-id=153
add interface=sfp-sfpplus1 name=2021241349-BLKK vlan-id=159
add interface=sfp-sfpplus1 name=2021241350-BLKPMI vlan-id=125
add interface=sfp-sfpplus1 name="2021241351-BLK MANDIRI" vlan-id=102
add interface=sfp-sfpplus1 name="2021241352-UPTD WASNAKER I BGR" vlan-id=131
add interface=sfp-sfpplus1 name="2021241354-UPTD WASNAKER II BKS DAN KRW" \
    vlan-id=136
add interface=sfp-sfpplus1 name="2021241357-UPTD WASNAKER V TSK" vlan-id=147
add interface=sfp-sfpplus1 name="2021241521-GEDUNG PKK" vlan-id=129
add interface=sfp-sfpplus1 name="2021244478-UPTD PJK NUSAWIRU" vlan-id=2343
add interface=sfp-sfpplus1 name="2021244481-CADISDIK WIL IV" vlan-id=170
add interface=sfp-sfpplus1 name="2021244482-CADISDIK WIL V" vlan-id=2345
add interface=sfp-sfpplus1 name="2021244483-CADISHUT WIL III" vlan-id=2344
add interface=sfp-sfpplus1 name="2021244485-CADISHUT WIL V" vlan-id=173
add interface=sfp-sfpplus1 name="2021244487-UPTD P3LLAJ WIL I" vlan-id=145
add interface=sfp-sfpplus1 name="2021263223-BAPENDA 2" vlan-id=178
add interface=sfp-sfpplus1 name="2022300655-BALAI KESEHATAN HEWAN" vlan-id=\
    2384
add interface=sfp-sfpplus1 name="2022302579-CADISDIK WIL VII" vlan-id=149
add interface=sfp-sfpplus1 name="2022302600-CADISDIK WIL XIII" vlan-id=2379
add interface=sfp-sfpplus1 name=2022321125-DINAS_ESDM vlan-id=117
add interface=sfp-sfpplus1 name="2022325383-CADISDIK WIL IX" vlan-id=2392
add interface=sfp-sfpplus1 name=2022328678-UPTD_KEBANDARUDARAAN vlan-id=115
add interface=sfp-sfpplus1 name="2022330816-UPTD MUARA CIASEM" vlan-id=118
add interface=sfp-sfpplus6 name=2023346248-BPBMD vlan-id=101
add disabled=yes interface=sfp-sfpplus1 name="BIRO PJB" vlan-id=302
add interface=ether1 name=NMS vlan-id=101
add interface=ether1 name=NMS-PRTG vlan-id=199
add interface=sfp-sfpplus6 name=SVLAN_1344_CIUSR14 vlan-id=1344
add interface=sfp-sfpplus6 name=SVLAN_1972_STS_1/5 vlan-id=1972
add interface=sfp-sfpplus6 name=SVLAN_1973_STS_1/6 vlan-id=1973
add interface=sfp-sfpplus6 name=SVLAN_3041_CIU_1/5 vlan-id=3041
add interface=sfp-sfpplus6 name=SVLAN_3046 vlan-id=3046
add interface=sfp-sfpplus6 name=SVLAN_3047_CIU_1/7 vlan-id=3047
add interface=sfp-sfpplus6 name=SVLAN_3048_CIU_1/9 vlan-id=3048
add interface=sfp-sfpplus6 name=SVLAN_3049_CIU_1/8 vlan-id=3049
add interface=sfp-sfpplus6 name=SVLAN_3053_CIU_1/6 vlan-id=3053
add interface=SVLAN_1344_CIUSR14 name="2020240085-SEKRETARIAT DAERAH" \
    vlan-id=900
add interface=SVLAN_3048_CIU_1/9 name="2020240086-SEKRETARIAT DPRD" vlan-id=\
    100
add interface=SVLAN_3048_CIU_1/9 name=2020240089-BAPPEDA vlan-id=101
add interface=SVLAN_3041_CIU_1/5 name=2020240091-BKD vlan-id=100
add interface=SVLAN_3048_CIU_1/9 name=2020240092-INSPEKTORAT vlan-id=102
add interface=SVLAN_3049_CIU_1/8 name=2020240180-DISDUKCAPIL vlan-id=100
add interface=SVLAN_1973_STS_1/6 name=2020240182-DINKES vlan-id=100
add interface=SVLAN_1972_STS_1/5 name=2020240184-DISDIK vlan-id=100
add interface=SVLAN_3053_CIU_1/6 name=2020240185-DISHUB vlan-id=100
add interface=SVLAN_3053_CIU_1/6 name=2020240188-DISPARBUD vlan-id=101
add interface=SVLAN_3047_CIU_1/7 name="2020240196-CC PROVINSI" vlan-id=100
add interface=SVLAN_3048_CIU_1/9 name="2020240198-CC SATGAS CITARUM" vlan-id=\
    103
add interface=SVLAN_3047_CIU_1/7 name="2021240542-UPTD LAB LINGKUNGAN HIDUP" \
    vlan-id=101
add interface=SVLAN_1973_STS_1/6 name="2021240548-UPTD LABKES" vlan-id=101
add interface=SVLAN_1973_STS_1/6 name=2021240549-UPELKES vlan-id=102
add interface=SVLAN_1972_STS_1/5 name="2021240844-BALAI TIKOMDIK" vlan-id=101
add interface=SVLAN_3048_CIU_1/9 name="2021240874-UPTD BPMKP" vlan-id=104
add interface=SVLAN_3048_CIU_1/9 name=2021240990-BPSBP vlan-id=105
add interface=SVLAN_3047_CIU_1/7 name=\
    "2021241000-BALAI PERLINDUNGAN PERKEBUNAN" vlan-id=102
add interface=SVLAN_3047_CIU_1/7 name="2021241032-UPTD LAB BAHAN KONSTRUKSI" \
    vlan-id=103
add interface=SVLAN_3048_CIU_1/9 name=\
    "2021241343-UPTD PENGELOLAAN KEBUDAYAAN DAERAH" vlan-id=106
add interface=SVLAN_3049_CIU_1/8 name="2021241346-UPTD IPOK" vlan-id=101
add interface=SVLAN_3041_CIU_1/5 name="2021241356-UPTD WASNAKER IV BDG" \
    vlan-id=101
add interface=SVLAN_3048_CIU_1/9 name="2021241515-BIRO BUMD" vlan-id=107
add interface=SVLAN_3041_CIU_1/5 name=2021241522-DEKRANASDA vlan-id=102
add interface=SVLAN_3053_CIU_1/6 name="2021241523-GUDANG DINKES" vlan-id=102
add interface=SVLAN_3053_CIU_1/6 name="2021244504-UPTD PP ASET" vlan-id=103
add interface=SVLAN_3053_CIU_1/6 name=2022328675-UPTD_PJJW_3 vlan-id=104
add interface=SVLAN_3047_CIU_1/7 name=2023345555-MESJID_PUSDAI vlan-id=104
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/queue simple
add max-limit=210M/210M name=DISHUB target=2020240185-DISHUB
add max-limit=100M/100M name="BIRO BUMND" target="2021241515-BIRO BUMD"
add max-limit=100M/100M name="BADAN PENGHUBUNG" target=\
    "2020240190-BADAN PENGHUBUNG"
add max-limit=520M/520M name="BADAN TEKNOLOGI" target=\
    "2021240844-BALAI TIKOMDIK"
add max-limit=110M/110M name=2023346248-BPBMD target=2023346248-BPBMD
add max-limit=110M/110M name=2023345555-MESJID_PUSDAI target=\
    2023345555-MESJID_PUSDAI
add max-limit=20M/20M name="DISDIK WIL X11" target=2021240832-UPTD_DISDIK_XII
add max-limit=110M/110M name=BAPENDA target=2020240193-BAPENDA
add max-limit=110M/110M name=BAPPEDA target=2020240089-BAPPEDA
add max-limit=210M/210M name=BKD target=2020240091-BKD
add max-limit=210M/210M name=BPBD target=2020240189-BPBD
add max-limit=210M/210M name=BPPD target=2020240191-BP2D
add max-limit=110M/110M name=BPSDM target=2020240094-BPSDM
add max-limit=160M/160M name="CC PROVINSI" target="2020240196-CC PROVINSI"
add max-limit=110M/110M name=DINKES target=2020240182-DINKES
add max-limit=550M/550M name=DISDIK target=2020240184-DISDIK
add max-limit=100M/100M name=DISDUKCAPIL target=2020240180-DISDUKCAPIL
add max-limit=100M/100M name=DISPARBUD target=2020240188-DISPARBUD
add max-limit=110M/110M name=DISPERKIM target=2020240178-DISPERKIM
add max-limit=110M/110M name=DISPUSIPDA target=2020240186-DISPUSIPDA
add max-limit=150M/150M name=DLH target=2020240168-DLH
add max-limit=160M/160M name=INSPEKTORAT target=2020240092-INSPEKTORAT
add max-limit=100M/100M name=G.DINKES target="2021241523-GUDANG DINKES"
add max-limit=110M/110M name=P.MODAL target=2020240165-DPMPTSP
add max-limit=100M/100M name="RSUD JAMPANG" target=\
    "2020240234-RSUD JAMPANG KULON"
add max-limit=310M/310M name=RS_JIWA target=2020240222-RSJ
add max-limit=110M/110M name=SATGAS_CITARUM target=\
    "2020240198-CC SATGAS CITARUM"
add max-limit=510M/510M name=SEKDA target="2020240085-SEKRETARIAT DAERAH"
add max-limit=110M/110M name=SEKRE_DPRD target="2020240086-SEKRETARIAT DPRD"
add max-limit=21M/21M name=PPA target="2021244504-UPTD PP ASET"
add max-limit=100M/100M name=DEKRANASDA target=2021241522-DEKRANASDA
add max-limit=20M/20M name=UPTD_BBLH target="2021240869-UPTD BBH"
add max-limit=20M/20M name=UPTD_BLKM target="2021241351-BLK MANDIRI"
add max-limit=100M/100M name=UPTD_BLKPMI target=2021241350-BLKPMI
add max-limit=20M/20M name=UPTD_BPMKP target="2021240874-UPTD BPMKP"
add max-limit=20M/20M name=UPTD_BPSBP target=2021240990-BPSBP
add max-limit=20M/20M name=UPTD_BPSBTP target="2021240872-UPTD BPSBPTH"
add max-limit=20M/20M name=UPTD_BPSMB_AGRO target=\
    "2021241348-UPTD BPSMB AGRO"
add max-limit=20M/20M name=UPTD_BPSMB_AMDK target=\
    "2021241347-UPTD BPSMB AMDK"
add max-limit=20M/20M name=UPTD_BPTP target="2021240873-UPTD BPTPH"
add max-limit=20M/20M name=UPTD_DESDM_III_PWK target=\
    "2021241156-CABANG DESDM WIL III PWK"
add max-limit=20M/20M name=UPTD_DISDIK_IV target="2021244481-CADISDIK WIL IV"
add max-limit=20M/20M name=UPTD_DISDIK_IX target="2022325383-CADISDIK WIL IX"
add max-limit=20M/20M name=UPTD_DISDIK_V target="2021244482-CADISDIK WIL V"
add max-limit=20M/20M name=UPTD_DISDIK_VII target=\
    "2022302579-CADISDIK WIL VII"
add max-limit=20M/20M name="UPTD_DISDIK_WIL_ X" target=\
    "2021240828-CADISDIK WIL X"
add max-limit=20M/20M name=UPTD_DISDIK_WIL_VIII target=\
    "2021240823-CADISDIK WIL VIII"
add max-limit=20M/20M name=UPTD_DISDIK_XIII target=\
    "2022302600-CADISDIK WIL XIII"
add max-limit=20M/20M name=UPTD_DISHUT_I target="2021240881-CADISHUT WIL I"
add max-limit=20M/20M name=UPTD_DISHUT_II target="2021240883-CADISHUT WIL II"
add max-limit=20M/20M name=UPTD_DISHUT_V target="2021244485-CADISHUT WIL V"
add max-limit=20M/20M name=UPTD_DISHUT_VI target="2021240931-CADISHUT WIL VI"
add max-limit=20M/20M name=UPTD_DISHUT_VII target=\
    "2021240932-CADISHUT WIL VII"
add max-limit=20M/20M name=UPTD_DISHUT_IV target="2021240895-CADISHUT WIL IV"
add max-limit=20M/20M name=UPTD_DISDIK_XI target="2021240829-CADISDIK WIL XI"
add max-limit=20M/20M name=UPTD_DESDM_II_BGR target=\
    "2021241150-CABANG DESDM WIL II BGR"
add max-limit=20M/20M name=UPTD_DISHUT_III target=\
    "2021244483-CADISHUT WIL III"
add max-limit=20M/20M name=UPTD_DESDM_IV_BDG target=\
    "2021241312-CABANG DESDM WIL IV BDG"
add max-limit=160M/160M name=UPTD_UPELKES target=2021240549-UPELKES
add max-limit=100M/100M name=UPTD_DINKESPARU target="2020240221-RS PARU"
add max-limit=20M/20M name=UPTD_DISPERKIM target="2021240546-UPTD P3JB"
add max-limit=100M/100M name=UPTD_INDUSTRI_PANGAN target=\
    "2021241346-UPTD IPOK"
add max-limit=20M/20M name=UPTD_LAB_KONTRUKSI target=\
    "2021241032-UPTD LAB BAHAN KONSTRUKSI"
add max-limit=100M/100M name=UPTD_LABKES target="2021240548-UPTD LABKES"
add max-limit=20M/20M name=UPTD_LLH target=\
    "2021240542-UPTD LAB LINGKUNGAN HIDUP"
add max-limit=20M/20M name=UPTD_LOGAM target="2021241345-UPTD INDUSTRI LOGAM"
add max-limit=20M/20M name=UPTD_NUSAWIRU target=\
    "2021244478-UPTD PJK NUSAWIRU"
add max-limit=100M/100M name=UPTD_P3LLAJ_IV target=\
    "2021241007-UPTD P3LLAJ WIL IV"
add max-limit=20M/20M name=UPTD_P3LLAJ_WII target=\
    "2021241005-UPTD P3LLAJ WIL II"
add max-limit=20M/20M name=UPTD_PANSOS target=\
    "2021240859-UPTD PSRPD MENSENETRUWITU"
add max-limit=100M/100M name=UPTD_KASDA target="2020240206-UPTD KASDA"
add max-limit=110M/110M name=UPTD_PELKES target="2021240847-UPTD PPKS"
add max-limit=20M/20M name=UPTD_PENGAWASAN target=\
    "2021241352-UPTD WASNAKER I BGR"
add max-limit=20M/20M name=UPTD_PENGAWASAN_IV target=\
    "2021241356-UPTD WASNAKER IV BDG"
add max-limit=20M/20M name=UPTD_PENGAWASAN_KERJA target=\
    "2021241354-UPTD WASNAKER II BKS DAN KRW"
add max-limit=20M/20M name=UPTD_PENGAWASAN_V target=\
    "2021241357-UPTD WASNAKER V TSK"
add max-limit=20M/20M name=UPTD_PENGELOLAANSAMPAH target=\
    "2021240544-UPTD PENGELOLAAN SAMPAH"
add max-limit=100M/100M name=UPTD_PENPELPERWI target="2021241320-UPTD P3W"
add max-limit=20M/20M name=UPTD_PERKEBUNAN target=\
    "2021241000-BALAI PERLINDUNGAN PERKEBUNAN"
add max-limit=100M/100M name=UPTD_P3LLASDP target="2021241008-UPTD P3LLASDP"
add max-limit=21M/21M name=UPTD_PKD target=\
    "2021241343-UPTD PENGELOLAAN KEBUDAYAAN DAERAH"
add max-limit=100M/100M name=UPTD_PKK target="2021241521-GEDUNG PKK"
add max-limit=22M/22M name=UPTD_PPMPP target="2021240876-UPTD PPMPP"
add max-limit=20M/20M name=UPTD_PPPLLAJ target="2021244487-UPTD P3LLAJ WIL I"
add max-limit=20M/20M name=UPTD_PSDA_CISADEA target=\
    "2021241046-UPTD PSDA WS CISADEA-CIBARENO"
add max-limit=20M/20M name=UPTD_PSDK target="2021240877-UPTD PSDKPWU"
add max-limit=20M/20M name=UPTD_BLKK target=2021241349-BLKK
add max-limit=100M/100M name=UPTD_RUMKIT_DKK target=\
    "2021240541-RSUD KESEHATAN KERJA"
add max-limit=100M/100M name=UPTD_RUMKIT_IHSAN target=\
    "2020240224-RSUD AL-IHSAN"
add max-limit=20M/20M name=UPTD_SDA_CILIWUNG target=\
    "2021241045-UPTD PSDA WS CILIWUNG-CISADANE"
add max-limit=21M/21M name=UPTD_SDA_CITARUM target=\
    "2021241047-UPTD PSDA WS CITARUM"
add max-limit=100M/100M name=UPTD_PJJW_3 target=2022328675-UPTD_PJJW_3
add max-limit=100M/100M name=BAPENDA_2 target="2021263223-BAPENDA 2"
add max-limit=20M/20M name=UPTD_SDA_TSK target=\
    "2021241139-UPTD PSDA WS CITANDUY"
add max-limit=100M/100M name=UPTD_RUMKIT_PAMEUNGPEUK target=\
    "2020240228-RSUD PAMEUNGPEUK"
add max-limit=20M/20M name="KESEHATAN HEWAN" target=\
    "2022300655-BALAI KESEHATAN HEWAN"
add max-limit=21M/21M name="2022330816-UPTD MUARA CIASEM" target=\
    "2022330816-UPTD MUARA CIASEM"
add max-limit=110M/110M name=2023346413-BPBMD target=2023346248-BPBMD
/routing bgp instance
set default as=65000 client-to-client-reflection=no disabled=yes
/snmp community
add addresses=103.122.5.192/26 name=jabarprov
add addresses=103.122.5.0/26 name=jabarprov2
add addresses=::/0 name=cpepublic
add addresses=202.152.4.72/32 name=lapublic
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface l2tp-server server
set authentication=mschap2 default-profile=default max-mru=1500 max-mtu=1500 \
    mrru=1500
/interface pptp-server server
set enabled=yes max-mru=1500 max-mtu=1500 mrru=1500
/ip address
add address=172.20.1.1/30 interface="2020240085-SEKRETARIAT DAERAH" network=\
    172.20.1.0
add address=172.20.7.1/30 interface=2020240165-DPMPTSP network=172.20.7.0
add address=172.20.21.1/30 disabled=yes interface="BIRO PJB" network=\
    172.20.21.0
add address=172.20.4.1/30 interface=2020240091-BKD network=172.20.4.0
add address=172.20.11.1/30 interface=2020240182-DINKES network=172.20.11.0
add address=172.20.12.1/30 interface=2020240184-DISDIK network=172.20.12.0
add address=172.20.17.1/30 interface="2020240190-BADAN PENGHUBUNG" network=\
    172.20.17.0
add address=172.20.15.1/30 interface=2020240188-DISPARBUD network=172.20.15.0
add address=172.20.6.1/30 interface=2020240094-BPSDM network=172.20.6.0
add address=172.20.28.1/30 interface="2020240196-CC PROVINSI" network=\
    172.20.28.0
add address=172.20.2.1/30 interface="2020240086-SEKRETARIAT DPRD" network=\
    172.20.2.0
add address=172.20.16.1/30 interface=2020240189-BPBD network=172.20.16.0
add address=172.20.8.1/30 interface=2020240168-DLH network=172.20.8.0
add address=172.20.5.1/30 interface=2020240092-INSPEKTORAT network=172.20.5.0
add address=172.20.18.1/30 interface=2020240191-BP2D network=172.20.18.0
add address=172.20.3.1/30 interface=2020240089-BAPPEDA network=172.20.3.0
add address=172.20.13.1/30 interface=2020240185-DISHUB network=172.20.13.0
add address=172.20.9.1/30 interface=2020240178-DISPERKIM network=172.20.9.0
add address=172.20.14.1/30 interface=2020240186-DISPUSIPDA network=\
    172.20.14.0
add address=172.20.20.1/30 interface=2020240193-BAPENDA network=172.20.20.0
add address=172.20.29.1/30 interface="2020240198-CC SATGAS CITARUM" network=\
    172.20.29.0
add address=172.20.10.1/30 interface=2020240180-DISDUKCAPIL network=\
    172.20.10.0
add address=172.20.95.1/30 interface="2021241515-BIRO BUMD" network=\
    172.20.95.0
add address=182.23.1.22/30 interface=NMS network=182.23.1.20
add address=103.122.5.152/28 interface=sfp-sfpplus2 network=103.122.5.144
add address=172.20.36.1/30 interface=2021240549-UPELKES network=172.20.36.0
add address=172.20.48.1/30 interface="2021240847-UPTD PPKS" network=\
    172.20.48.0
add address=172.20.49.1/30 interface="2021240859-UPTD PSRPD MENSENETRUWITU" \
    network=172.20.49.0
add address=172.20.26.1/30 interface="2020240234-RSUD JAMPANG KULON" network=\
    172.20.26.0
add address=172.20.89.1/30 interface="2021241351-BLK MANDIRI" network=\
    172.20.89.0
add address=172.20.111.1/30 interface=2020240222-RSJ network=172.20.111.0
add address=172.20.30.1/30 interface="2020240206-UPTD KASDA" network=\
    172.20.30.0
add address=172.20.83.1/30 interface="2021241345-UPTD INDUSTRI LOGAM" \
    network=172.20.83.0
add address=172.20.96.1/30 interface="2021241523-GUDANG DINKES" network=\
    172.20.96.0
add address=172.20.81.1/30 interface="2021241320-UPTD P3W" network=\
    172.20.81.0
add address=172.20.88.1/30 interface=2021241350-BLKPMI network=172.20.88.0
add address=172.20.75.1/30 interface="2021241047-UPTD PSDA WS CITARUM" \
    network=172.20.75.0
add address=172.20.85.1/30 interface="2021241347-UPTD BPSMB AMDK" network=\
    172.20.85.0
add address=172.20.68.1/30 interface="2021241007-UPTD P3LLAJ WIL IV" network=\
    172.20.68.0
add address=172.20.55.1/30 interface="2021240877-UPTD PSDKPWU" network=\
    172.20.55.0
add address=172.20.42.1/30 interface="2021240828-CADISDIK WIL X" network=\
    172.20.42.0
add address=172.20.22.1/30 interface="2020240221-RS PARU" network=172.20.22.0
add address=172.20.54.1/30 interface="2021240876-UPTD PPMPP" network=\
    172.20.54.0
add address=172.20.97.1/30 interface="2021241521-GEDUNG PKK" network=\
    172.20.97.0
add address=172.20.58.1/30 interface="2021244483-CADISHUT WIL III" network=\
    172.20.58.0
add address=172.20.90.1/30 interface="2021241352-UPTD WASNAKER I BGR" \
    network=172.20.90.0
add address=172.20.77.1/30 interface="2021241150-CABANG DESDM WIL II BGR" \
    network=172.20.77.0
add address=172.20.56.1/30 interface="2021240881-CADISHUT WIL I" network=\
    172.20.56.0
add address=172.20.73.1/30 interface=\
    "2021241045-UPTD PSDA WS CILIWUNG-CISADANE" network=172.20.73.0
add address=172.20.91.1/30 interface=\
    "2021241354-UPTD WASNAKER II BKS DAN KRW" network=172.20.91.0
add address=103.147.222.193/27 network=103.147.222.192
add address=172.20.64.1/30 interface=\
    "2021241000-BALAI PERLINDUNGAN PERKEBUNAN" network=172.20.64.0
add address=172.20.35.1/30 interface="2021240548-UPTD LABKES" network=\
    172.20.35.0
add address=172.20.41.1/30 interface="2022325383-CADISDIK WIL IX" network=\
    172.20.41.0
add address=172.20.53.1/30 interface="2021240874-UPTD BPMKP" network=\
    172.20.53.0
add address=172.20.79.1/30 interface="2021241312-CABANG DESDM WIL IV BDG" \
    network=172.20.79.0
add address=172.20.38.1/30 interface="2021244482-CADISDIK WIL V" network=\
    172.20.38.0
add address=172.20.27.1/30 interface="2021240541-RSUD KESEHATAN KERJA" \
    network=172.20.27.0
add address=172.20.24.1/30 interface="2020240224-RSUD AL-IHSAN" network=\
    172.20.24.0
add address=172.20.65.1/30 interface="2021244487-UPTD P3LLAJ WIL I" network=\
    172.20.65.0
add address=172.20.43.1/30 interface="2021240829-CADISDIK WIL XI" network=\
    172.20.43.0
add address=172.20.93.1/30 interface="2021241357-UPTD WASNAKER V TSK" \
    network=172.20.93.0
add address=172.20.0.206/30 interface=NMS-PRTG network=172.20.0.204
add address=1.6.208.1 interface=Lo network=1.6.208.1
add address=172.20.92.1/30 interface="2021241356-UPTD WASNAKER IV BDG" \
    network=172.20.92.0
add address=172.20.84.1/30 interface="2021241346-UPTD IPOK" network=\
    172.20.84.0
add address=172.20.39.1/30 interface="2022302579-CADISDIK WIL VII" network=\
    172.20.39.0
add address=172.20.33.1/30 interface="2021240544-UPTD PENGELOLAAN SAMPAH" \
    network=172.20.33.0
add address=172.20.98.1/30 interface=2021241522-DEKRANASDA network=\
    172.20.98.0
add address=172.20.72.1/30 interface="2021241032-UPTD LAB BAHAN KONSTRUKSI" \
    network=172.20.72.0
add address=172.20.32.1/30 interface="2021240542-UPTD LAB LINGKUNGAN HIDUP" \
    network=172.20.32.0
add address=172.20.94.1/30 interface="2021244504-UPTD PP ASET" network=\
    172.20.94.0
add address=172.20.69.1/30 interface="2021241008-UPTD P3LLASDP" network=\
    172.20.69.0
add address=172.20.66.1/30 interface="2021241005-UPTD P3LLAJ WIL II" network=\
    172.20.66.0
add address=172.20.86.1/30 interface="2021241348-UPTD BPSMB AGRO" network=\
    172.20.86.0
add address=172.20.50.1/30 interface="2021240869-UPTD BBH" network=\
    172.20.50.0
add address=172.20.70.1/30 interface="2021244478-UPTD PJK NUSAWIRU" network=\
    172.20.70.0
add address=172.20.52.1/30 interface="2021240873-UPTD BPTPH" network=\
    172.20.52.0
add address=172.20.87.1/30 interface=2021241349-BLKK network=172.20.87.0
add address=172.20.51.1/30 interface="2021240872-UPTD BPSBPTH" network=\
    172.20.51.0
add address=172.20.57.1/30 interface="2021240883-CADISHUT WIL II" network=\
    172.20.57.0
add address=172.20.78.1/30 interface="2021241156-CABANG DESDM WIL III PWK" \
    network=172.20.78.0
add address=172.25.10.3/29 comment=SOPHOS interface=sfp-sfpplus3 network=\
    172.25.10.0
add address=172.20.82.1/30 interface=\
    "2021241343-UPTD PENGELOLAAN KEBUDAYAAN DAERAH" network=172.20.82.0
add address=172.20.46.1/30 interface="2021240844-BALAI TIKOMDIK" network=\
    172.20.46.0
add address=172.20.63.1/30 interface=2021240990-BPSBP network=172.20.63.0
add address=172.20.40.1/30 interface="2021240823-CADISDIK WIL VIII" network=\
    172.20.40.0
add address=172.20.74.1/30 interface=\
    "2021241046-UPTD PSDA WS CISADEA-CIBARENO" network=172.20.74.0
add address=172.20.61.1/30 interface="2021240931-CADISHUT WIL VI" network=\
    172.20.61.0
add address=172.20.62.1/30 interface="2021240932-CADISHUT WIL VII" network=\
    172.20.62.0
add address=172.20.45.1/30 interface="2022302600-CADISDIK WIL XIII" network=\
    172.20.45.0
add address=172.20.76.1/30 interface="2021241139-UPTD PSDA WS CITANDUY" \
    network=172.20.76.0
add address=172.20.37.1/30 interface="2021244481-CADISDIK WIL IV" network=\
    172.20.37.0
add address=172.20.34.1/30 interface="2021240546-UPTD P3JB" network=\
    172.20.34.0
add address=172.20.59.1/30 interface="2021240895-CADISHUT WIL IV" network=\
    172.20.59.0
add address=172.20.25.1/30 interface="2020240228-RSUD PAMEUNGPEUK" network=\
    172.20.25.0
add address=172.20.60.1/30 interface="2021244485-CADISHUT WIL V" network=\
    172.20.60.0
add address=172.20.71.1/30 interface=2022328675-UPTD_PJJW_3 network=\
    172.20.71.0
add address=172.20.99.1/30 interface="2021263223-BAPENDA 2" network=\
    172.20.99.0
add address=103.122.5.147/28 interface=sfp-sfpplus2 network=103.122.5.144
add address=172.20.112.1/30 interface="2022300655-BALAI KESEHATAN HEWAN" \
    network=172.20.112.0
add address=172.20.44.1/30 interface=2021240832-UPTD_DISDIK_XII network=\
    172.20.44.0
add address=172.20.113.1/30 interface=2022321125-DINAS_ESDM network=\
    172.20.113.0
add address=103.122.5.150/28 disabled=yes interface=sfp-sfpplus2 network=\
    103.122.5.144
add address=172.20.100.1/30 interface=2022328678-UPTD_KEBANDARUDARAAN \
    network=172.20.100.0
add address=103.122.5.151/28 disabled=yes interface=sfp-sfpplus2 network=\
    103.122.5.144
add address=172.20.116.1/30 interface="2022330816-UPTD MUARA CIASEM" network=\
    172.20.116.0
add address=172.20.101.1/30 interface=2023346248-BPBMD network=172.20.101.0
add address=172.20.102.1/30 interface=2023345555-MESJID_PUSDAI network=\
    172.20.102.0
/ip dns
set servers=202.152.0.2,202.152.5.36
/ip firewall address-list
add address=103.147.222.232/29 list=DNS
add address=103.147.222.240/28 list=DNS
add address=103.147.222.72/29 list=DNS
add address=103.147.222.112/29 list=DNS
add address=103.147.222.120/29 list=DNS
add address=103.147.222.224/29 list=DNS
add address=103.147.222.120/29 list="IP PUBLIC"
add address=103.147.222.0/24 list="IP PUBLIC"
add address=103.122.5.144/28 list="IP PUBLIC"
add address=172.20.0.0/16 list="IP PRIVATE"
add address=10.0.0.0/8 list="IP PRIVATE"
add address=103.147.222.192/27 list="IP PUBLIC"
add address=103.147.222.72/29 list="IP PUBLIC"
add address=103.147.222.112/29 list="IP PUBLIC"
add address=103.147.222.224/29 list="IP PUBLIC"
add address=103.147.222.232/29 list="IP PUBLIC"
add address=103.147.222.240/28 list="IP PUBLIC"
/ip firewall filter
add action=drop chain=forward comment="DNS ATTACK" dst-address-list=DNS \
    dst-port=53 in-interface=sfp-sfpplus2 protocol=udp
add action=drop chain=forward dst-address-list=DNS dst-port=53 in-interface=\
    sfp-sfpplus2 protocol=tcp
add action=drop chain=forward comment="SMB 445 BLOKED" dst-port=445 \
    in-interface=sfp-sfpplus2 protocol=tcp
add action=drop chain=forward dst-port=445 out-interface=sfp-sfpplus2 \
    protocol=tcp
add action=drop chain=forward comment="SSH 22 BLOKED" disabled=yes dst-port=\
    22 in-interface=sfp-sfpplus2 protocol=tcp
add action=drop chain=forward disabled=yes dst-port=22 out-interface=\
    sfp-sfpplus2 protocol=tcp
/ip firewall mangle
add action=mark-routing chain=prerouting disabled=yes new-routing-mark=\
    "IP PRIVATE" passthrough=no src-address-list="IP PRIVATE"
add action=mark-routing chain=prerouting disabled=yes new-routing-mark=\
    "IP PUBLIC" passthrough=no src-address-list="IP PUBLIC"
/ip firewall nat
add action=masquerade chain=srcnat comment=PRIVATE-1-PBR disabled=yes \
    out-interface=sfp-sfpplus3 src-address=10.0.0.0/8
add action=masquerade chain=srcnat comment=PRIVATE-2-PBR disabled=yes \
    out-interface=sfp-sfpplus3 src-address=172.20.0.0/16
add action=src-nat chain=srcnat comment=NAT-ALL out-interface=sfp-sfpplus2 \
    to-addresses=103.122.5.147
add action=src-nat chain=srcnat comment=PRIVATE-1-DIRECT disabled=yes \
    out-interface=sfp-sfpplus2 src-address=10.0.0.0/8 to-addresses=\
    103.122.5.150
add action=src-nat chain=srcnat comment=PRIVATE-2-DIRECT disabled=yes \
    out-interface=sfp-sfpplus2 src-address=172.20.0.0/16 to-addresses=\
    103.122.5.150
add action=src-nat chain=srcnat comment=PUBLIC-PBR disabled=yes \
    out-interface=sfp-sfpplus2 src-address=103.147.222.0/24 to-addresses=\
    103.122.5.150
add action=dst-nat chain=dstnat comment="2020240085-SEKRETARIAT DAERAH" \
    dst-address=103.122.5.152 dst-port=8001 protocol=tcp to-addresses=\
    172.20.1.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.1.2 dst-port=443 protocol=\
    tcp to-addresses=172.20.1.1
add action=dst-nat chain=dstnat comment=\
    "2020240089-BADAN PERENCANAAN PEMBANGUNAN DAERAH" dst-address=\
    103.122.5.152 dst-port=8003 protocol=tcp to-addresses=172.20.3.2 \
    to-ports=80
add action=src-nat chain=srcnat dst-address=172.20.3.2 dst-port=80 protocol=\
    tcp to-addresses=172.20.3.1
add action=dst-nat chain=dstnat comment=\
    "2020240091-BADAN KEPEGAWAIAN DAERAH " dst-address=103.122.5.152 \
    dst-port=8004 protocol=tcp to-addresses=172.20.4.2 to-ports=8291
add action=dst-nat chain=dstnat comment=DISPARBUD-MIKROTIK dst-address=\
    103.122.5.152 dst-port=8999 protocol=tcp to-addresses=172.20.15.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.4.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.4.1
add action=dst-nat chain=dstnat comment=2020240092-INSPEKTORAT dst-address=\
    103.122.5.152 dst-port=8005 protocol=tcp to-addresses=172.20.5.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.5.2 dst-port=443 protocol=\
    tcp to-addresses=172.20.5.1
add action=dst-nat chain=dstnat comment=\
    "2020240094-BADAN PENGEMBANGAN SUMBER DAYA MANUSIA " dst-address=\
    103.122.5.152 dst-port=8006 protocol=tcp to-addresses=172.20.6.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.6.2 dst-port=443 protocol=\
    tcp to-addresses=172.20.6.1
add action=dst-nat chain=dstnat comment=\
    "2020240165-DINAS PENANAMAN MODAL DAN PERIZINAN TERPADU SATU PINTU" \
    dst-address=103.122.5.152 dst-port=8007 protocol=tcp to-addresses=\
    172.20.7.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.7.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.7.1
add action=dst-nat chain=dstnat comment="2020240168-DINAS LINGKUNGAN HIDUP" \
    dst-address=103.122.5.152 dst-port=8008 protocol=tcp to-addresses=\
    172.20.8.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.8.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.8.1
add action=dst-nat chain=dstnat comment=\
    "2020240178-DINAS PERUMAHAN DAN PERMUKIMAN" dst-address=103.122.5.152 \
    dst-port=8009 protocol=tcp to-addresses=172.20.9.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.9.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.9.1
add action=dst-nat chain=dstnat comment=\
    "2020240180-DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL" dst-address=\
    103.122.5.152 dst-port=8010 protocol=tcp to-addresses=172.20.10.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.10.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.10.1
add action=dst-nat chain=dstnat comment="2020240184-DINAS PENDIDIKAN" \
    dst-address=103.122.5.152 dst-port=8012 protocol=tcp to-addresses=\
    172.20.12.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.12.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.12.1
add action=dst-nat chain=dstnat comment="2020240185-DINAS PERHUBUNGAN " \
    dst-address=103.122.5.152 dst-port=8013 protocol=tcp to-addresses=\
    172.20.13.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.11.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.11.1
add action=dst-nat chain=dstnat comment="2020240182-DINAS KESEHATAN" \
    dst-address=103.122.5.152 dst-port=8011 protocol=tcp to-addresses=\
    172.20.11.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.13.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.13.1
add action=dst-nat chain=dstnat comment=\
    "2020240186-DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH" dst-address=\
    103.122.5.152 dst-port=8014 protocol=tcp to-addresses=172.20.14.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.14.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.14.1
add action=dst-nat chain=dstnat comment=\
    "2020240188-DINAS PARIWISATA DAN KEBUDAYAAN " dst-address=103.122.5.152 \
    dst-port=8015 protocol=tcp to-addresses=172.20.15.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.15.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.15.1
add action=dst-nat chain=dstnat comment=\
    "2020240188-DINAS PARIWISATA DAN KEBUDAYAAN " dst-address=103.122.5.152 \
    dst-port=8115 protocol=tcp to-addresses=10.43.1.10 to-ports=8666
add action=src-nat chain=srcnat dst-address=10.43.1.10 dst-port=8666 \
    protocol=tcp to-addresses=172.20.15.2 to-ports=8115
add action=dst-nat chain=dstnat comment=\
    "2020240189-BADAN PENANGGULANGAN BENCANA DAERAH" dst-address=\
    103.122.5.152 dst-port=8016 protocol=tcp to-addresses=172.20.16.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.16.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.16.1
add action=dst-nat chain=dstnat comment="2020240190-BADAN PENGHUBUNG" \
    dst-address=103.122.5.152 dst-port=8017 protocol=tcp to-addresses=\
    172.20.17.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.17.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.17.1
add action=src-nat chain=srcnat dst-address=172.20.15.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.17.1
add action=dst-nat chain=dstnat comment=\
    "2020240191-BADAN PENELITIAN DAN PENGEMBANGAN DAERAH" dst-address=\
    103.122.5.152 dst-port=8018 protocol=tcp to-addresses=172.20.18.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.18.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.18.1
add action=dst-nat chain=dstnat comment="2020240193-BADAN PENDAPATAN DAERAH " \
    dst-address=103.122.5.152 dst-port=8020 protocol=tcp to-addresses=\
    172.20.20.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.20.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.20.1
add action=dst-nat chain=dstnat comment="2020240195-BIRO PBJ" dst-address=\
    103.122.5.152 dst-port=8021 protocol=tcp to-addresses=172.20.21.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.21.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.21.1
add action=dst-nat chain=dstnat comment="2020240221-RUMAH SAKIT PARU" \
    dst-address=103.122.5.152 dst-port=8022 protocol=tcp to-addresses=\
    172.20.22.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.22.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.22.1
add action=dst-nat chain=dstnat comment="2020240222-RUMAH SAKIT JIWA" \
    dst-address=103.122.5.152 dst-port=8023 protocol=tcp to-addresses=\
    172.20.23.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.23.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.23.1
add action=dst-nat chain=dstnat comment=\
    "2020240224-RUMAH SAKIT UMUM DAERAH AL-IHSAN" dst-address=103.122.5.152 \
    dst-port=8024 protocol=tcp to-addresses=172.20.24.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.24.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.24.1
add action=dst-nat chain=dstnat comment=\
    "2020240228-RUMAH SAKIT UMUM DAERAH PAMEUNGPEUK" dst-address=\
    103.122.5.152 dst-port=8025 protocol=tcp to-addresses=172.20.25.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.25.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.25.1
add action=dst-nat chain=dstnat comment=\
    "2020240234-RUMAH SAKIT UMUM DAERAH JAMPANG KULON" dst-address=\
    103.122.5.152 dst-port=8026 protocol=tcp to-addresses=172.20.26.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.26.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.26.1
add action=dst-nat chain=dstnat comment=\
    "2021240541-RUMAH SAKIT UMUM DAERAH KESEHATAN KERJA" dst-address=\
    103.122.5.152 dst-port=8027 protocol=tcp to-addresses=172.20.27.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.27.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.27.1
add action=dst-nat chain=dstnat comment="2020240196-COMMAND CENTER PROVINSI" \
    dst-address=103.122.5.152 dst-port=8028 protocol=tcp to-addresses=\
    172.20.28.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.28.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.28.1
add action=dst-nat chain=dstnat comment=\
    "2020240198-COMMAND CENTER SATGAS CITARUM" dst-address=103.122.5.152 \
    dst-port=8029 protocol=tcp to-addresses=172.20.29.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.29.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.29.1
add action=dst-nat chain=dstnat comment="2020240206-UPTD KAS DAERAH" \
    dst-address=103.122.5.152 dst-port=8030 protocol=tcp to-addresses=\
    172.20.30.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.30.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.30.1
add action=dst-nat chain=dstnat comment=\
    "2021240542-UPTD LABORATORIUM LINGKUNGAN HIDUP" dst-address=103.122.5.152 \
    dst-port=8032 protocol=tcp to-addresses=172.20.32.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.32.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.32.1
add action=dst-nat chain=dstnat comment=\
    "2021240544-UPTD PENGELOLAAN SAMPAH TPA/TPST REGIONAL" dst-address=\
    103.122.5.152 dst-port=8033 protocol=tcp to-addresses=172.20.33.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.33.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.33.1
add action=dst-nat chain=dstnat comment=\
    "2021240546-UPTD PENGELOLAAN DAN PELAYANAN PERUMAHAN JAWA BARAT" \
    dst-address=103.122.5.152 dst-port=8034 protocol=tcp to-addresses=\
    172.20.34.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.34.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.34.1
add action=dst-nat chain=dstnat comment=\
    "2021240548-UPTD LABORATORIUM KESEHATAN" dst-address=103.122.5.152 \
    dst-port=8035 protocol=tcp to-addresses=172.20.35.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.35.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.35.1
add action=dst-nat chain=dstnat comment="2021240549-UPTD PELATIHAN KESEHATAN" \
    dst-address=103.122.5.152 dst-port=8036 protocol=tcp to-addresses=\
    172.20.36.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.36.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.36.1
add action=dst-nat chain=dstnat comment=\
    "2021244481-UPTD CABANG DINAS PENDIDIKAN WILAYAH IV" dst-address=\
    103.122.5.152 dst-port=8037 protocol=tcp to-addresses=172.20.37.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.37.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.37.1
add action=dst-nat chain=dstnat comment=\
    "2021244482-UPTD CABANG DINAS PENDIDIKAN WILAYAH V" dst-address=\
    103.122.5.152 dst-port=8038 protocol=tcp to-addresses=172.20.38.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.38.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.38.1
add action=dst-nat chain=dstnat comment=\
    "2021242621-UPTD CABANG DINAS PENDIDIKAN WILAYAH VII" dst-address=\
    103.122.5.152 dst-port=8039 protocol=tcp to-addresses=172.20.39.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.39.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.39.1
add action=dst-nat chain=dstnat comment=\
    "2021240823-UPTD CABANG DINAS PENDIDIKAN WILAYAH VIII" dst-address=\
    103.122.5.152 dst-port=8040 protocol=tcp to-addresses=172.20.40.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.40.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.40.1
add action=dst-nat chain=dstnat comment=\
    "2021240827-UPTD CABANG DINAS PENDIDIKAN WILAYAH IX" dst-address=\
    103.122.5.152 dst-port=8041 protocol=tcp to-addresses=172.20.41.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.41.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.41.1
add action=dst-nat chain=dstnat comment=\
    "2021240828-UPTD CABANG DINAS PENDIDIKAN WILAYAH X" dst-address=\
    103.122.5.152 dst-port=8042 protocol=tcp to-addresses=172.20.42.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.42.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.42.1
add action=dst-nat chain=dstnat comment=\
    "2021240829-UPTD CABANG DINAS PENDIDIKAN WILAYAH XII" dst-address=\
    103.122.5.152 dst-port=8044 protocol=tcp to-addresses=172.20.44.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.44.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.44.1
add action=dst-nat chain=dstnat comment=\
    "2022302600-UPTD CABANG DINAS PENDIDIKAN WILAYAH XIII" dst-address=\
    103.122.5.152 dst-port=8045 protocol=tcp to-addresses=172.20.45.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.45.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.45.1
add action=dst-nat chain=dstnat comment=\
    "2021240844-BALAI TEKNOLOGI INFORMASI DAN KOMUNIKASI PENDIDIKAN" \
    dst-address=103.122.5.152 dst-port=8046 protocol=tcp to-addresses=\
    172.20.46.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.46.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.46.1
add action=dst-nat chain=dstnat comment=\
    "2021240847-UPTD PENGEMBANGAN DAN PELATIHAN KESEJAHTERAAN SOSIAL" \
    dst-address=103.122.5.152 dst-port=8048 protocol=tcp to-addresses=\
    172.20.48.2 to-ports=1443
add action=src-nat chain=srcnat dst-address=172.20.48.2 dst-port=1443 \
    protocol=tcp to-addresses=172.20.48.1
add action=dst-nat chain=dstnat comment="2021240859-UPTD  PANTI SOSIAL REHABIL\
    ITASI PENYANDANG DISABILITAS MENTAL, SENSORIK NETRA, RUNGU WICARA, TUBUH " \
    dst-address=103.122.5.152 dst-port=8049 protocol=tcp to-addresses=\
    172.20.49.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.49.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.49.1
add action=dst-nat chain=dstnat comment=\
    "2021240869-UPTD BALAI BENIH HOLTIKULTURA" dst-address=103.122.5.152 \
    dst-port=8050 protocol=tcp to-addresses=172.20.50.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.50.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.50.1
add action=dst-nat chain=dstnat comment="2021240872-UPTD BALAI PENGAWASAN DAN \
    SERTIFIKASI BENIH TANAMAN PANGAN DAN HORTIKULTURA " dst-address=\
    103.122.5.152 dst-port=8051 protocol=tcp to-addresses=172.20.51.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.51.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.51.1
add action=dst-nat chain=dstnat comment=\
    "2021240873-UPTD BALAI PERLINDUNGAN TANAMAN PANGAN DAN HORTIKULTURA" \
    dst-address=103.122.5.152 dst-port=8052 protocol=tcp to-addresses=\
    172.20.52.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.52.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.52.1
add action=dst-nat chain=dstnat comment=\
    "2021240874-BALAI PENGAWASAN MUTU DAN KEAMANAN PANGAN" dst-address=\
    103.122.5.152 dst-port=8053 protocol=tcp to-addresses=172.20.53.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.53.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.53.1
add action=dst-nat chain=dstnat comment=\
    "2021240876-UPTD PENGUJIAN DAN PENERAPAN MUTU PRODUK PERIKANAN" \
    dst-address=103.122.5.152 dst-port=8054 protocol=tcp to-addresses=\
    172.20.54.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.54.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.54.1
add action=dst-nat chain=dstnat comment="2021240877-UPTD PENGAWASAN SUMBER DAY\
    A KELAUTAN DAN PERIKANAN WILAYAH UTARA" dst-address=103.122.5.152 \
    dst-port=8055 protocol=tcp to-addresses=172.20.55.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.55.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.55.1
add action=dst-nat chain=dstnat comment=\
    "2021240881-CABANG DINAS KEHUTANAN WILAYAH I" dst-address=103.122.5.152 \
    dst-port=8056 protocol=tcp to-addresses=172.20.56.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.56.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.56.1
add action=dst-nat chain=dstnat comment=\
    "2021240883-CABANG DINAS KEHUTANAN WILAYAH II" dst-address=103.122.5.152 \
    dst-port=8057 protocol=tcp to-addresses=172.20.57.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.57.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.57.1
add action=dst-nat chain=dstnat comment=\
    "2021244483-CABANG DINAS KEHUTANAN WILAYAH III" dst-address=103.122.5.152 \
    dst-port=8058 protocol=tcp to-addresses=172.20.58.2 to-ports=80
add action=src-nat chain=srcnat dst-address=172.20.58.2 dst-port=80 protocol=\
    tcp to-addresses=172.20.58.1
add action=dst-nat chain=dstnat comment=\
    "2021240895-CABANG DINAS KEHUTANAN WILAYAH IV" dst-address=103.122.5.152 \
    dst-port=8059 protocol=tcp to-addresses=172.20.59.2 to-ports=80
add action=src-nat chain=srcnat dst-address=172.20.59.2 dst-port=80 protocol=\
    tcp to-addresses=172.20.59.1
add action=dst-nat chain=dstnat comment=\
    "2021244485-CABANG DINAS KEHUTANAN WILAYAH V" dst-address=103.122.5.152 \
    dst-port=8060 protocol=tcp to-addresses=172.20.60.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.60.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.60.1
add action=dst-nat chain=dstnat comment=\
    "2021240931-CABANG DINAS KEHUTANAN WILAYAH VI" dst-address=103.122.5.152 \
    dst-port=8061 protocol=tcp to-addresses=172.20.61.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.61.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.61.1
add action=dst-nat chain=dstnat comment=\
    "2021240932-CABANG DINAS KEHUTANAN WILAYAH VII" dst-address=103.122.5.152 \
    dst-port=8062 protocol=tcp to-addresses=172.20.62.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.62.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.62.1
add action=dst-nat chain=dstnat comment=\
    "2021240990-UPTD BALAI PENGAWASAN DAN SERTIFIKASI BENIH PERKEBUNAN" \
    dst-address=103.122.5.152 dst-port=8063 protocol=tcp to-addresses=\
    172.20.63.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.63.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.63.1
add action=dst-nat chain=dstnat comment=\
    "2021241000-BALAI PERLINDUNGAN PERKEBUNAN" dst-address=103.122.5.152 \
    dst-port=8064 protocol=tcp to-addresses=172.20.64.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.64.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.64.1
add action=dst-nat chain=dstnat comment="2021244487-UPTD PENGELOLAAN PRASARANA\
    \_PERHUBUNGAN LALU LINTAS ANGKUTAN JALAN WILAYAH I" dst-address=\
    103.122.5.152 dst-port=8065 protocol=tcp to-addresses=172.20.65.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.65.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.65.1
add action=dst-nat chain=dstnat comment="2021241005-UPTD PENGELOLAAN PRASARANA\
    \_PERHUBUNGAN LALU LINTAS ANGKUTAN JALAN WILAYAH II" dst-address=\
    103.122.5.152 dst-port=8066 protocol=tcp to-addresses=172.20.66.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.66.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.66.1
add action=dst-nat chain=dstnat comment="2021241007-UPTD PENGELOLAAN PRASARANA\
    \_PERHUBUNGAN LALU LINTAS ANGKUTAN JALAN WILAYAH IV" dst-address=\
    103.122.5.152 dst-port=8068 protocol=tcp to-addresses=172.20.68.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.68.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.68.1
add action=dst-nat chain=dstnat comment="2021241008-UPTD PENGELOLAAN PRASARANA\
    \_PERHUBUNGAN LALU LINTAS ANGKUTAN SUNGAI, DANAU DAN PENYEBERANGAN" \
    dst-address=103.122.5.152 dst-port=8069 protocol=tcp to-addresses=\
    172.20.69.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.69.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.69.1
add action=dst-nat chain=dstnat comment=\
    "2021244478-UPTD PELAYANAN JASA KEBANDARUDARAAN NUSAWIRU" dst-address=\
    103.122.5.152 dst-port=8070 protocol=tcp to-addresses=172.20.70.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.70.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.70.1
add action=dst-nat chain=dstnat comment=\
    "2021241029-UPTD PENGELOLAAN JALAN DAN JEMBATAN WILAYAH PELAYAN III" \
    dst-address=103.122.5.152 dst-port=8071 protocol=tcp to-addresses=\
    172.20.71.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.71.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.71.1
add action=dst-nat chain=dstnat comment=\
    "2021241032-UPTD LABORATORIUM BAHAN KONSTRUKSI" dst-address=103.122.5.152 \
    dst-port=8072 protocol=tcp to-addresses=172.20.72.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.72.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.72.1
add action=dst-nat chain=dstnat comment="2021241045-UPTD PENGELOLAAN SUMBER DA\
    YA AIR WILAYAH SUNGAI CILIWUNG-CISADANE" dst-address=103.122.5.152 \
    dst-port=8073 protocol=tcp to-addresses=172.20.73.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.73.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.73.1
add action=dst-nat chain=dstnat comment="2021241046-UPTD PENGELOLAAN SUMBER DA\
    YA AIR WILAYAH SUNGAI CISADEA-CIBARENO" dst-address=103.122.5.152 \
    dst-port=8074 protocol=tcp to-addresses=172.20.74.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.74.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.74.1
add action=dst-nat chain=dstnat comment=\
    "2021241047-UPTD PENGELOLAAN SUMBER DAYA AIR WILAYAH SUNGAI CITARUM" \
    dst-address=103.122.5.152 dst-port=8075 protocol=tcp to-addresses=\
    172.20.75.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.75.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.75.1
add action=dst-nat chain=dstnat comment=\
    "2021241139-UPTD PENGELOLAAN SUMBER DAYA AIR WILAYAH SUNGAI CITANDUY" \
    dst-address=103.122.5.152 dst-port=8076 protocol=tcp to-addresses=\
    172.20.76.2 to-ports=80
add action=src-nat chain=srcnat dst-address=172.20.76.2 dst-port=80 protocol=\
    tcp to-addresses=172.20.76.1
add action=dst-nat chain=dstnat comment=\
    "2021241150-CABANG DINAS ENERGI DAN SUMBER DAYA MINERAL WILAYAH II BOGOR" \
    dst-address=103.122.5.152 dst-port=8077 protocol=tcp to-addresses=\
    172.20.77.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.77.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.77.1
add action=dst-nat chain=dstnat comment="2021241156-CABANG DINAS ENERGI DAN SU\
    MBER DAYA MINERAL WILAYAH III PURWAKARTA" dst-address=103.122.5.152 \
    dst-port=8078 protocol=tcp to-addresses=172.20.78.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.78.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.78.1
add action=dst-nat chain=dstnat comment="2021241312-CABANG DINAS ENERGI DAN SU\
    MBER DAYA MINERAL WILAYAH IV BANDUNG" dst-address=103.122.5.152 dst-port=\
    8079 protocol=tcp to-addresses=172.20.79.2 to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.79.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.79.1
add action=dst-nat chain=dstnat comment=\
    "2021241320-UPTD PENDIDIKAN DAN PELATIHAN PERKOPERASIAN DAN WIRAUSAHA" \
    dst-address=103.122.5.152 dst-port=8081 protocol=tcp to-addresses=\
    172.20.81.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.81.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.81.1
add action=dst-nat chain=dstnat comment=\
    "2021241343-UPTD PENGELOLAAN KEBUDAYAAN DAERAH JAWA BARAT" dst-address=\
    103.122.5.152 dst-port=8082 protocol=tcp to-addresses=172.20.82.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.82.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.82.1
add action=dst-nat chain=dstnat comment="2021241345-UPTD INDUSTRI LOGAM" \
    dst-address=103.122.5.152 dst-port=8083 protocol=tcp to-addresses=\
    172.20.83.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.83.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.83.1
add action=dst-nat chain=dstnat comment=\
    "2021241346-UPTD INDUSTRI PANGAN, OLAHAN DAN KEMASAN" dst-address=\
    103.122.5.152 dst-port=8084 protocol=tcp to-addresses=172.20.84.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.84.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.84.1
add action=dst-nat chain=dstnat comment="2021241347-UPTD BALAI PENGUJIAN DAN S\
    ERTIFIKASI MUTU BARANG AIR MINUM DALAM KEMASAN CIREBON" dst-address=\
    103.122.5.152 dst-port=8085 protocol=tcp to-addresses=172.20.85.2 \
    to-ports=443
add action=src-nat chain=srcnat dst-address=172.20.85.2 dst-port=443 \
    protocol=tcp to-addresses=172.20.85.1
add action=dst-nat chain=dstnat comment="2021241348-UPTD BALAI PENGUJIAN DAN S\
    ERTIFIKASI MUTU BARANG AGRO BANDUNG" dst-address=103.122.5.152 dst-port=\
    8086 protocol=tcp to-addresses=172.20.86.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.86.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.86.1
add action=dst-nat chain=dstnat comment=\
    "2021241349-UPTD BALAI LATIHAN KERJA KOMPETENSI" dst-address=\
    103.122.5.152 dst-port=8087 protocol=tcp to-addresses=172.20.87.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.87.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.87.1
add action=dst-nat chain=dstnat comment=\
    "2021241350-UPTD BALAI LATIHAN KERJA PEKERJA MIGRAN INDONESIA" \
    dst-address=103.122.5.152 dst-port=8088 protocol=tcp to-addresses=\
    172.20.88.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.88.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.88.1
add action=dst-nat chain=dstnat comment=\
    "2021241351-UPTD BALAI LATIHAN KERJA MANDIRI" dst-address=103.122.5.152 \
    dst-port=8089 protocol=tcp to-addresses=172.20.89.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.89.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.89.1
add action=dst-nat chain=dstnat comment=\
    "2021241352-UPTD PENGAWASAN KETENAGAKERJAAN WILAYAH I BOGOR" dst-address=\
    103.122.5.152 dst-port=8105 protocol=tcp to-addresses=172.20.90.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.90.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.90.1
add action=dst-nat chain=dstnat comment="2021241354-UPTD PENGAWASAN KETENAGAKE\
    RJAAN WILAYAH II BEKASI DAN KARAWANG" dst-address=103.122.5.152 dst-port=\
    8091 protocol=tcp to-addresses=172.20.91.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.91.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.91.1
add action=dst-nat chain=dstnat comment=\
    "2021241356-UPTD PENGAWASAN KETENAGAKERJAAN WILAYAH IV BANDUNG" \
    dst-address=103.122.5.152 dst-port=8092 protocol=tcp to-addresses=\
    172.20.92.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.92.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.92.1
add action=dst-nat chain=dstnat comment=\
    "2021241357-UPTD PENGAWASAN KETENAGAKERJAAN WILAYAH V TASIKMALAYA" \
    dst-address=103.122.5.152 dst-port=8093 protocol=tcp to-addresses=\
    172.20.93.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.93.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.93.1
add action=dst-nat chain=dstnat comment=\
    "2021244504-UPTD PENGAMANAN DAN PEMANFAATAN ASET" dst-address=\
    103.122.5.152 dst-port=8094 protocol=tcp to-addresses=172.20.94.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.94.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.94.1
add action=dst-nat chain=dstnat comment="2021241515-BIRO BUMD" dst-address=\
    103.122.5.152 dst-port=8095 protocol=tcp to-addresses=172.20.95.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.95.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.95.1
add action=dst-nat chain=dstnat comment="2021241523-GUDANG DINAS KESEHATAN" \
    dst-address=103.122.5.152 dst-port=8096 protocol=tcp to-addresses=\
    172.20.96.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.96.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.96.1
add action=dst-nat chain=dstnat comment="2021241521-GEDUNG PKK" dst-address=\
    103.122.5.152 dst-port=8097 protocol=tcp to-addresses=172.20.97.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.97.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.97.1
add action=dst-nat chain=dstnat comment=\
    "2021241522-DEWAN KERAJINAN NASIONAL DAERAH JAWA BARAT" dst-address=\
    103.122.5.152 dst-port=8098 protocol=tcp to-addresses=172.20.98.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.98.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.98.1
add action=dst-nat chain=dstnat comment="2021263223-BAPENDA 2" dst-address=\
    103.122.5.152 dst-port=8099 protocol=tcp to-addresses=172.20.99.2 \
    to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.99.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.99.1
add action=dst-nat chain=dstnat comment="SEKDA 2" dst-address=103.122.5.152 \
    dst-port=8103 protocol=tcp to-addresses=172.20.103.2 to-ports=8291
add action=dst-nat chain=dstnat comment="SEKDA 2" dst-address=103.122.5.152 \
    dst-port=8159 protocol=tcp to-addresses=10.135.4.2 to-ports=8291
add action=src-nat chain=srcnat dst-address=172.20.103.2 dst-port=8291 \
    protocol=tcp to-addresses=172.20.103.1
/ip route
add disabled=yes distance=1 gateway=172.25.10.1 routing-mark=PRIVATE
add distance=1 gateway=103.122.5.145
add disabled=yes distance=1 gateway=182.23.1.21
add distance=1 dst-address=1.6.0.0/16 gateway=172.20.0.205
add comment=SEKDA distance=1 dst-address=1.6.208.162/32 gateway=172.20.1.2
add comment=BAPPEDA distance=1 dst-address=1.6.208.164/32 gateway=172.20.3.2
add comment=INSPEKTORAT distance=1 dst-address=1.6.208.166/32 gateway=\
    172.20.5.2
add comment=BPSDM distance=1 dst-address=1.6.208.167/32 gateway=172.20.6.2
add comment=P.MODAL distance=1 dst-address=1.6.208.168/32 gateway=172.20.7.2
add comment=DLH distance=1 dst-address=1.6.208.169/32 gateway=172.20.8.2
add comment=DISPERKIM distance=1 dst-address=1.6.208.170/32 gateway=\
    172.20.9.2
add comment=DISDUKCAPIL distance=1 dst-address=1.6.208.171/32 gateway=\
    172.20.10.2
add comment=DINKES distance=1 dst-address=1.6.208.172/32 gateway=172.20.11.2
add comment=DISDIK distance=1 dst-address=1.6.208.173/32 gateway=172.20.12.2
add comment=DISPUSIPDA distance=1 dst-address=1.6.208.175/32 gateway=\
    172.20.14.2
add comment=DISPARBUD distance=1 dst-address=1.6.208.176/32 gateway=\
    172.20.15.2
add comment=BPBD distance=1 dst-address=1.6.208.177/32 gateway=172.20.16.2
add comment="BADAN PENGHUBUNG" distance=1 dst-address=1.6.208.178/32 gateway=\
    172.20.17.2
add comment=BPPD distance=1 dst-address=1.6.208.179/32 gateway=172.20.18.2
add comment="BIRO BUMD" distance=1 dst-address=1.6.208.180/32 gateway=\
    172.20.95.2
add comment=BAPENDA distance=1 dst-address=1.6.208.181/32 gateway=172.20.20.2
add distance=1 dst-address=1.6.208.182/32 gateway=172.20.22.2
add distance=1 dst-address=1.6.208.183/32 gateway=172.20.111.2
add distance=1 dst-address=1.6.208.184/32 gateway=172.20.24.2
add distance=1 dst-address=1.6.208.185/32 gateway=172.20.25.2
add distance=1 dst-address=1.6.208.186/32 gateway=172.20.26.2
add distance=1 dst-address=1.6.208.187/32 gateway=172.20.27.2
add comment=SATGAS distance=1 dst-address=1.6.208.188/32 gateway=172.20.29.2
add distance=1 dst-address=1.6.208.189/32 gateway=172.20.35.2
add comment=UPTD_PELKES distance=1 dst-address=1.6.208.191/32 gateway=\
    172.20.48.2
add comment=UPTD_PENPELPERWI distance=1 dst-address=1.6.208.192/32 gateway=\
    172.20.81.2
add distance=1 dst-address=1.6.208.193/32 gateway=172.20.87.2
add distance=1 dst-address=1.6.208.194/32 gateway=172.20.32.2
add distance=1 dst-address=1.6.208.195/32 gateway=172.20.33.2
add distance=1 dst-address=1.6.208.196/32 gateway=172.20.34.2
add distance=1 dst-address=1.6.208.197/32 gateway=172.20.37.2
add distance=1 dst-address=1.6.208.198/32 gateway=172.20.38.2
add distance=1 dst-address=1.6.208.199/32 gateway=172.20.39.2
add distance=1 dst-address=1.6.208.200/32 gateway=172.20.40.2
add comment="UPTD DISDIK WIL X" distance=1 dst-address=1.6.208.202/32 \
    gateway=172.20.42.2
add distance=1 dst-address=1.6.208.203/32 gateway=172.20.43.2
add distance=1 dst-address=1.6.208.204/32 gateway=172.20.44.2
add distance=1 dst-address=1.6.208.205/32 gateway=172.20.45.2
add distance=1 dst-address=1.6.208.206/32 gateway=172.20.46.2
add distance=1 dst-address=1.6.208.207/32 gateway=172.20.49.2
add distance=1 dst-address=1.6.208.208/32 gateway=172.20.50.2
add distance=1 dst-address=1.6.208.209/32 gateway=172.20.51.2
add distance=1 dst-address=1.6.208.210/32 gateway=172.20.52.2
add distance=1 dst-address=1.6.208.211/32 gateway=172.20.53.2
add distance=1 dst-address=1.6.208.212/32 gateway=172.20.112.2
add distance=1 dst-address=1.6.208.213/32 gateway=172.20.54.2
add distance=1 dst-address=1.6.208.214/32 gateway=172.20.55.2
add distance=1 dst-address=1.6.208.217/32 gateway=172.20.56.2
add distance=1 dst-address=1.6.208.218/32 gateway=172.20.57.2
add distance=1 dst-address=1.6.208.219/32 gateway=172.20.58.2
add distance=1 dst-address=1.6.208.220/32 gateway=172.20.59.2
add distance=1 dst-address=1.6.208.221/32 gateway=172.20.60.2
add distance=1 dst-address=1.6.208.222/32 gateway=172.20.61.2
add distance=1 dst-address=1.6.208.223/32 gateway=172.20.62.2
add distance=1 dst-address=1.6.208.224/32 gateway=172.20.63.2
add distance=1 dst-address=1.6.208.225/32 gateway=172.20.64.2
add distance=1 dst-address=1.6.208.226/32 gateway=172.20.65.2
add distance=1 dst-address=1.6.208.227/32 gateway=172.20.66.2
add comment=UPTD_P3LALIN distance=1 dst-address=1.6.208.228/32 gateway=\
    172.20.68.2
add distance=1 dst-address=1.6.208.229/32 gateway=172.20.69.2
add distance=1 dst-address=1.6.208.230/32 gateway=172.20.70.2
add distance=1 dst-address=1.6.208.231/32 gateway=172.20.71.2
add distance=1 dst-address=1.6.208.232/32 gateway=172.20.72.2
add distance=1 dst-address=1.6.208.233/32 gateway=172.20.73.2
add distance=1 dst-address=1.6.208.234/32 gateway=172.20.74.2
add comment=UPTD_SDA distance=1 dst-address=1.6.208.235/32 gateway=\
    172.20.75.2
add distance=1 dst-address=1.6.208.236/32 gateway=172.20.76.2
add distance=1 dst-address=1.6.208.237/32 gateway=172.20.77.2
add distance=1 dst-address=1.6.208.238/32 gateway=172.20.78.2
add distance=1 dst-address=1.6.208.239/32 gateway=172.20.113.2
add distance=1 dst-address=1.6.208.240/32 gateway=172.20.79.2
add distance=1 dst-address=1.6.208.241/32 gateway=172.20.82.2
add distance=1 dst-address=1.6.208.242/32 gateway=172.20.83.2
add distance=1 dst-address=1.6.208.243/32 gateway=172.20.84.2
add distance=1 dst-address=1.6.208.244/32 gateway=172.20.85.2
add distance=1 dst-address=1.6.208.245/32 gateway=172.20.86.2
add comment=UPTD_BLKPMI distance=1 dst-address=1.6.208.246/32 gateway=\
    172.20.88.2
add comment=UPTD_BLKM distance=1 dst-address=1.6.208.247/32 gateway=\
    172.20.89.2
add distance=1 dst-address=1.6.208.248/32 gateway=172.20.90.2
add distance=1 dst-address=1.6.208.249/32 gateway=172.20.91.2
add distance=1 dst-address=1.6.208.250/32 gateway=172.20.92.2
add distance=1 dst-address=1.6.208.251/32 gateway=172.20.93.2
add distance=1 dst-address=1.6.208.252/32 gateway=172.20.94.2
add distance=1 dst-address=1.6.208.253/32 gateway=172.20.28.2
add distance=1 dst-address=1.6.208.254/32 gateway=172.20.98.2
add distance=1 dst-address=1.6.209.1/32 gateway=172.20.97.2
add distance=1 dst-address=1.6.209.2/32 gateway=172.20.96.2
add distance=1 dst-address=1.6.209.3/32 gateway=172.20.100.2
add distance=1 dst-address=1.6.209.4/32 gateway=172.20.116.2
add comment=BPMBD distance=1 dst-address=1.6.209.5/32 gateway=172.20.101.2
add comment=PUSDAI distance=1 dst-address=1.6.209.6/32 gateway=172.20.102.2
add distance=1 dst-address=10.0.3.0/24 gateway=172.25.10.1
add distance=1 dst-address=10.0.20.0/24 gateway=172.25.10.1
add comment=SEKDA distance=1 dst-address=10.11.0.0/16 gateway=172.20.1.2
add comment="SEK DPRD" distance=1 dst-address=10.12.0.0/16 gateway=172.20.2.2
add comment=BAPPEDA distance=1 dst-address=10.13.0.0/16 gateway=172.20.3.2
add comment=BKD distance=1 dst-address=10.14.0.0/16 gateway=172.20.4.2
add comment=Diskominfo/Tamansari distance=1 dst-address=10.15.0.0/16 gateway=\
    172.25.10.1
add comment=INSPEKTORAT distance=1 dst-address=10.16.1.0/24 gateway=\
    172.20.5.2
add comment=BPSDM distance=1 dst-address=10.17.1.0/24 gateway=172.20.6.2
add distance=1 dst-address=10.17.2.0/24 gateway=172.20.6.2
add comment=P.MODAL distance=1 dst-address=10.18.0.0/16 gateway=172.20.7.2
add comment=DLH distance=1 dst-address=10.19.1.0/24 gateway=172.20.8.2
add distance=1 dst-address=10.21.1.0/24 gateway=172.20.97.2
add distance=1 dst-address=10.26.1.0/24 gateway=172.20.93.2
add comment=DISPERKIM distance=1 dst-address=10.27.1.0/24 gateway=172.20.9.2
add comment=DISDUKCAPIL distance=1 dst-address=10.28.1.0/24 gateway=\
    172.20.10.2
add comment=DINKES distance=1 dst-address=10.29.1.0/24 gateway=172.20.11.2
add comment=DISDIK distance=1 dst-address=10.30.1.0/24 gateway=172.20.12.2
add distance=1 dst-address=10.32.0.0/16 gateway=172.20.50.2
add distance=1 dst-address=10.33.0.0/16 gateway=172.20.53.2
add comment=DISHUB distance=1 dst-address=10.37.1.0/24 gateway=172.20.13.2
add comment=DISPUSIPDA distance=1 dst-address=10.38.1.0/24 gateway=\
    172.20.14.2
add comment=BAPENDA distance=1 dst-address=10.41.0.0/16 gateway=172.20.20.2
add comment=UPTD_PENPELPERWI distance=1 dst-address=10.42.1.0/24 gateway=\
    172.20.81.2
add comment=DISPARBUD distance=1 dst-address=10.43.1.0/24 gateway=172.20.15.2
add distance=1 dst-address=10.44.0.0/16 gateway=172.20.99.2
add distance=1 dst-address=10.45.1.0/24 gateway=172.20.83.2
add distance=1 dst-address=10.46.1.0/24 gateway=172.20.85.2
add distance=1 dst-address=10.47.1.0/24 gateway=172.20.90.2
add comment=UPTD_BLKPMI distance=1 dst-address=10.47.2.0/24 gateway=\
    172.20.88.2
add comment=UPTD_BLKM distance=1 dst-address=10.47.3.0/24 gateway=172.20.89.2
add comment=BPBD distance=1 dst-address=10.50.1.0/24 gateway=172.20.16.2
add comment="BADAN PENGHUBUNG" distance=1 dst-address=10.51.1.0/24 gateway=\
    172.20.17.2
add distance=1 dst-address=10.53.0.0/22 gateway=172.20.28.2
add comment=BPPD distance=1 dst-address=10.57.1.0/24 gateway=172.20.18.2
add comment=UPTD_KASDA distance=1 dst-address=10.60.1.0/24 gateway=\
    172.20.30.2
add comment=SATGAS distance=1 dst-address=10.62.1.0/24 gateway=172.20.29.2
add comment="BIRO BUMD" distance=1 dst-address=10.63.1.0/24 gateway=\
    172.20.95.2
add distance=1 dst-address=10.64.1.0/24 gateway=172.20.96.2
add distance=1 dst-address=10.67.1.0/24 gateway=172.20.98.2
add distance=1 dst-address=10.82.1.0/24 gateway=172.20.100.2
add distance=1 dst-address=10.85.1.0/24 gateway=172.20.116.2
add distance=1 dst-address=10.119.1.0/24 gateway=172.20.32.2
add distance=1 dst-address=10.119.2.0/24 gateway=172.20.33.2
add disabled=yes distance=1 dst-address=10.127.1.0/24 gateway=172.20.34.2
add distance=1 dst-address=10.127.2.0/24 gateway=172.20.34.2
add distance=1 dst-address=10.129.1.0/24 gateway=172.20.22.2
add distance=1 dst-address=10.129.2.0/24 gateway=172.20.111.2
add distance=1 dst-address=10.129.3.0/30 gateway=172.20.24.2
add distance=1 dst-address=10.129.3.4/30 gateway=172.20.24.2
add distance=1 dst-address=10.129.4.0/24 gateway=172.20.25.2
add distance=1 dst-address=10.129.5.0/24 gateway=172.20.26.2
add distance=1 dst-address=10.129.6.0/24 gateway=172.20.27.2
add distance=1 dst-address=10.129.7.0/24 gateway=172.20.35.2
add comment=UPTD_DINKES distance=1 dst-address=10.129.8.0/24 gateway=\
    172.20.36.2
add distance=1 dst-address=10.130.4.0/24 gateway=172.20.37.2
add distance=1 dst-address=10.130.5.0/24 gateway=172.20.38.2
add distance=1 dst-address=10.130.7.0/24 gateway=172.20.39.2
add distance=1 dst-address=10.130.8.0/24 gateway=172.20.40.2
add distance=1 dst-address=10.130.9.0/24 gateway=172.20.41.2
add comment="UPTD DISDIK WIL X" distance=1 dst-address=10.130.10.0/24 \
    gateway=172.20.42.2
add distance=1 dst-address=10.130.11.0/24 gateway=172.20.43.2
add distance=1 dst-address=10.130.12.0/24 gateway=172.20.44.2
add distance=1 dst-address=10.130.13.0/24 gateway=172.20.45.2
add distance=1 dst-address=10.130.14.0/24 gateway=172.20.46.2
add distance=1 dst-address=10.130.15.0/24 gateway=172.20.94.2
add comment=UPTD_PELKES distance=1 dst-address=10.131.2.0/24 gateway=\
    172.20.48.2
add distance=1 dst-address=10.131.6.0/24 gateway=172.20.49.2
add distance=1 dst-address=10.132.4.0/24 gateway=172.20.51.2
add distance=1 dst-address=10.132.5.0/24 gateway=172.20.52.2
add distance=1 dst-address=10.134.5.0/24 gateway=172.20.54.2
add distance=1 dst-address=10.134.6.0/24 gateway=172.20.55.2
add distance=1 dst-address=10.135.1.0/24 gateway=172.20.56.2
add distance=1 dst-address=10.135.2.0/24 gateway=172.20.57.2
add distance=1 dst-address=10.135.3.0/24 gateway=172.20.58.2
add distance=1 dst-address=10.135.4.0/24 gateway=172.20.59.2
add distance=1 dst-address=10.135.5.0/24 gateway=172.20.60.2
add distance=1 dst-address=10.135.6.0/24 gateway=172.20.61.2
add distance=1 dst-address=10.135.7.0/24 gateway=172.20.62.2
add distance=1 dst-address=10.136.2.0/24 gateway=172.20.63.2
add distance=1 dst-address=10.136.3.0/24 gateway=172.20.64.2
add distance=1 dst-address=10.137.1.0/24 gateway=172.20.65.2
add distance=1 dst-address=10.137.2.0/24 gateway=172.20.66.2
add comment=UPTD_P3LALIN distance=1 dst-address=10.137.4.0/24 gateway=\
    172.20.68.2
add distance=1 dst-address=10.137.5.0/24 gateway=172.20.69.2
add distance=1 dst-address=10.137.7.0/24 gateway=172.20.70.2
add distance=1 dst-address=10.139.3.0/24 gateway=172.20.71.2
add distance=1 dst-address=10.139.7.0/24 gateway=172.20.72.2
add distance=1 dst-address=10.140.1.0/24 gateway=172.20.73.2
add distance=1 dst-address=10.140.2.0/24 gateway=172.20.74.2
add comment=UPTD_SDA distance=1 dst-address=10.140.3.0/24 gateway=172.20.75.2
add distance=1 dst-address=10.140.5.0/24 gateway=172.20.76.2
add distance=1 dst-address=10.141.2.0/24 gateway=172.20.77.2
add distance=1 dst-address=10.141.3.0/24 gateway=172.20.78.2
add distance=1 dst-address=10.141.4.0/24 gateway=172.20.79.2
add distance=1 dst-address=10.143.1.0/24 gateway=172.20.82.2
add distance=1 dst-address=10.145.2.0/24 gateway=172.20.84.2
add distance=1 dst-address=10.145.6.0/24 gateway=172.20.86.2
add distance=1 dst-address=10.147.1.0/24 gateway=172.20.87.2
add distance=1 dst-address=10.147.5.0/24 gateway=172.20.91.2
add distance=1 dst-address=10.147.7.0/24 gateway=172.20.92.2
add distance=1 dst-address=10.147.8.0/24 gateway=172.20.113.2
add distance=1 dst-address=10.147.9.0/24 gateway=172.20.101.2
add distance=1 dst-address=10.147.10.0/24 gateway=172.20.102.2
add distance=1 dst-address=33.33.33.0/29 gateway=172.20.0.205
add distance=1 dst-address=36.37.127.226/32 gateway=182.23.1.21
add distance=1 dst-address=103.147.222.72/29 gateway=172.20.2.2
add distance=1 dst-address=103.147.222.112/29 gateway=172.20.27.2
add distance=1 dst-address=103.147.222.120/29 gateway=172.20.111.2
add distance=1 dst-address=103.147.222.224/29 gateway=172.20.10.2
add comment=DINKES distance=1 dst-address=103.147.222.232/29 gateway=\
    172.20.11.2
add comment=SEKDA distance=1 dst-address=103.147.222.240/28 gateway=\
    172.20.1.2
add distance=1 dst-address=118.96.214.213/32 gateway=182.23.1.21
add comment=BKD distance=1 dst-address=172.16.141.96/30 gateway=172.20.4.2
add distance=1 dst-address=172.16.141.112/30 gateway=172.20.13.2
add distance=1 dst-address=172.20.0.96/29 gateway=172.20.0.205
add comment=BPSDM distance=1 dst-address=172.20.6.252/30 gateway=172.20.6.2
add comment="DINKES\
    \n" distance=1 dst-address=172.20.11.252/30 gateway=172.20.11.2
add distance=1 dst-address=172.20.28.252/30 gateway=172.20.28.2
add distance=1 dst-address=172.20.36.0/24 gateway=NMS
add distance=1 dst-address=172.20.48.0/24 gateway=NMS
add comment=UPTD_PELKES distance=1 dst-address=172.20.48.4/30 gateway=\
    172.20.48.2
add distance=1 dst-address=172.20.52.252/30 gateway=172.20.52.2
add comment=UPTD_SDA distance=1 dst-address=172.20.75.252/30 gateway=\
    172.20.75.2
add distance=1 dst-address=172.20.81.0/24 gateway=NMS
add comment="PTP P.MODAL" distance=1 dst-address=172.21.7.0/30 gateway=\
    172.20.7.2
add distance=1 dst-address=182.23.78.2/32 gateway=172.25.10.1
add distance=1 dst-address=192.100.100.0/24 gateway=172.20.112.2
add distance=1 dst-address=192.100.100.0/24 gateway=172.20.112.1
add comment="IP PTP UPTD PPA" distance=1 dst-address=192.168.10.0/30 gateway=\
    172.20.94.2
add comment="IP PTP BPBD" distance=1 dst-address=192.168.11.0/30 gateway=\
    172.20.16.2
add comment="IP PTP CADISDIK V" distance=1 dst-address=192.168.12.0/30 \
    gateway=172.20.38.2
add comment="IP PTP TIKOMDIK" distance=1 dst-address=192.168.13.0/30 gateway=\
    172.20.46.2
add comment="IP PTP BAPPEDA" distance=1 dst-address=192.168.14.0/30 gateway=\
    172.20.3.2
add comment="IP PTP BPTPH" distance=1 dst-address=192.168.20.0/30 gateway=\
    172.20.52.2
add disabled=yes distance=1 dst-address=202.152.1.147/32 gateway=182.23.1.21
add disabled=yes distance=1 dst-address=202.152.22.173/32 gateway=182.23.1.21
/ip route rule
add disabled=yes dst-address=172.20.0.0/16 src-address=10.0.3.0/24 table=main
add disabled=yes src-address=182.23.1.20/30 table=main
add disabled=yes src-address=103.122.5.144/28 table=PUBLIC
add disabled=yes src-address=103.147.222.0/24 table=PUBLIC
add disabled=yes src-address=103.147.222.120/29 table=PUBLIC
add disabled=yes src-address=172.20.0.0/16 table=PRIVATE
add disabled=yes src-address=10.0.0.0/8 table=PRIVATE
/ip service
set telnet disabled=yes port=2323
set ftp disabled=yes
set www disabled=yes
set ssh port=8222
set api disabled=yes
set api-ssl disabled=yes
/lcd
set time-interval=weekly
/ppp profile
add bridge=*7C name=cicurug use-encryption=yes
/routing bgp peer
add disabled=yes multihop=yes name=peer1 remote-address=9.9.9.2 remote-as=\
    65001 update-source=2020240165-DPMPTSP
/routing filter
add chain=bgp-in set-target-scope=30
add chain=bgp-in set-target-scope=30
/snmp
set enabled=yes trap-community=lapublic
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name="B/H METRO DISKOMINFO"
/tool graphing interface
add interface="2021240847-UPTD PPKS"
add interface="2020240085-SEKRETARIAT DAERAH"
/tool traffic-generator
set test-id=2
/tool traffic-generator packet-template
add ip-dst=172.20.95.2 name=BUMD
add ip-dst=172.20.9.2 name=DISPERKIM
add ip-dst=172.20.10.2 name=DISDUKCAPIL
add ip-dst=172.20.21.2 name=PBJ
add ip-dst=172.20.11.2 name=DINKES
add ip-dst=172.20.12.2 name=DISDIK
add ip-dst=172.20.15.2 name=DISPARBUD
add ip-dst=172.20.14.2 name=DISPUSIPDA
add ip-dst=172.20.8.2 name=DLH
add ip-dst=172.20.5.2 name=INSPEKTORAT
add ip-dst=172.20.96.2 name=GUDANGDINKES
add ip-dst=172.20.26.2 name=JAMPANG
add ip-dst=172.20.23.2 name=JIWA
add ip-dst=172.20.98.2 name=DEKRANASDA
add ip-dst=172.20.97.2 name=PKK
add ip-dst=172.20.25.2 name=PAMEUNGPEUK
add ip-dst=172.20.6.2 name=BPSDM
add ip-dst=172.20.28.2 name=PROVINSI
add ip-dst=172.20.1.2 name=SEKDA
