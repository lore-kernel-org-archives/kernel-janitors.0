From: Carlo Perassi <carlo@linux.it>
Date: Mon, 28 Jun 2004 09:57:21 +0000
Subject: [Kernel-janitors] check_region question
Message-Id: <20040628095721.GA20954@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34063094565832785=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34063094565832785==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi
compiling a new 2.6.7 I got
drivers/ide/pci/trm290.c:376: warning: `check_region' is deprecated
drivers/char/specialix.c:290: warning: `check_region' is deprecated

So I searched and found (see the end of the email) a lot of places where
that call occours.
I guess this is not (always) a "search/replace" task so my question is 

(a)
if a call like
check_region(s, n)
should be replaced with
request_region(s, n, name)
(where name is something like hwif->name)
and
(b)
if an if statement like
if (check_region(s, n))
should be replaced with
if (!request_region(s, n, name))
is there something more than ((a) + (b)) to convert a deprecated section
of code?

I found some old patches which should be good examples but I don't know
this topic enough to make a general theory.

Thanks.

drivers/tc/zs.c:1745
drivers/ide/pci/trm290.c:376
drivers/net/eepro.c:549
drivers/pnp/resource.c:256
drivers/char/esp.c:2373
drivers/char/mwave/tp3780i.c:256
drivers/char/amiserial.c:2094
drivers/char/specialix.c:290
drivers/scsi/fdomain.c:763
drivers/scsi/aic7xxx/aic79xx_osm_pci.c:258
drivers/scsi/aic7xxx/aic79xx_osm_pci.c:259
drivers/scsi/aic7xxx/aic7770_osm.c:129
drivers/scsi/aic7xxx/aic7770_osm.c:213
drivers/scsi/aic7xxx/aic7xxx_osm_pci.c:248
drivers/scsi/sym53c416.c:627
drivers/scsi/sym53c416.c:715
drivers/scsi/eata_pio.c:596
drivers/scsi/advansys.c:4622
drivers/scsi/advansys.c:10006
drivers/scsi/BusLogic.c:694
drivers/scsi/BusLogic.c:698
drivers/scsi/BusLogic.c:702
drivers/scsi/BusLogic.c:706
drivers/scsi/BusLogic.c:710
drivers/scsi/BusLogic.c:714
drivers/scsi/BusLogic.c:970
drivers/scsi/BusLogic.c:985
drivers/scsi/BusLogic.c:990
drivers/scsi/BusLogic.c:995
drivers/scsi/BusLogic.c:1000
drivers/scsi/BusLogic.c:1005
drivers/cdrom/sbpcd.c:5680
drivers/cdrom/isp16.c:124
drivers/pcmcia/i82365.c:673
drivers/pcmcia/i82365.c:807
drivers/pcmcia/tcic.c:347
drivers/telephony/ixj.c:7737
drivers/telephony/ixj.c:7799
drivers/telephony/ixj.c:7835
sound/oss/waveartist.c:1349
sound/oss/pss.c:191
sound/oss/pss.c:674
sound/oss/pss.c:744
sound/oss/pss.c:1038
sound/oss/wf_midi.c:787
sound/oss/cs4232.c:141
sound/oss/cs4232.c:193
sound/oss/mad16.c:322
sound/oss/msnd_pinnacle.c:1148
sound/oss/msnd_pinnacle.c:1836
sound/oss/wavfront.c:2421
sound/oss/sscape.c:737
sound/oss/sscape.c:1113
sound/oss/sscape.c:1132
sound/oss/sscape.c:1137
sound/oss/maui.c:307
sound/oss/sb_common.c:523
sound/oss/sb_common.c:1227
sound/oss/mpu401.c:1215
sound/oss/trix.c:85
sound/oss/trix.c:147
sound/oss/trix.c:292
sound/oss/opl3sa.c:114
sound/oss/opl3sa.c:122
sound/oss/ad1848.c:1581
sound/oss/ad1848.c:2531
sound/oss/sgalaxy.c:89
sound/oss/sgalaxy.c:97
sound/oss/gus_card.c:76
sound/oss/gus_card.c:78
sound/oss/gus_card.c:93
sound/oss/gus_card.c:94

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============34063094565832785==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34063094565832785==--
