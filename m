From: Domen Puncer <domen@coderock.org>
Date: Sat, 04 Dec 2004 22:15:23 +0000
Subject: [KJ] 70 "unneeded casts" patches
Message-Id: <20041204221523.GA3790@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============043571393924669799=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============043571393924669799==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Couple of days ago I did 70 patches removing unneeded casts.

Now I feel a little stupid about sending that amount of silly patches to
everyone's mailbox, so I put them to:
http://coderock.org/kernel/janitor/unneeded_casts/

Diff between old and new compiles' logs (make some/file.o) shows no
introduced warnings, but quite some files don't compile.

diffstat:
 arch/ia64/hp/sim/simeth.c                         |    8 +-
 arch/ppc/8260_io/enet.c                           |   12 +--
 arch/ppc/8260_io/fcc_enet.c                       |   28 +++----
 arch/ppc/8xx_io/enet.c                            |   12 +--
 arch/ppc/8xx_io/fec.c                             |    6 -
 drivers/bluetooth/hci_bcsp.c                      |    4 -
 drivers/char/pcmcia/synclink_cs.c                 |   46 ++++++------
 drivers/isdn/i4l/isdn_concap.c                    |    2 
 drivers/isdn/i4l/isdn_net.c                       |   70 +++++++++----------
 drivers/isdn/i4l/isdn_ppp.c                       |   23 +++---
 drivers/media/dvb/b2c2/skystar2.c                 |   12 +--
 drivers/media/dvb/cinergyT2/cinergyT2.c           |   18 ++--
 drivers/media/dvb/dibusb/dvb-dibusb.c             |    6 -
 drivers/media/dvb/dvb-core/dmxdev.c               |   60 ++++++----------
 drivers/media/dvb/dvb-core/dvb_ca_en50221.c       |   40 +++++------
 drivers/media/dvb/dvb-core/dvb_net.c              |   44 ++++++------
 drivers/media/dvb/ttpci/av7110.c                  |   44 ++++++------
 drivers/media/dvb/ttpci/av7110_av.c               |   67 +++++++++---------
 drivers/media/dvb/ttpci/av7110_ca.c               |   24 +++---
 drivers/media/dvb/ttpci/budget-core.c             |   20 ++---
 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c |    9 +-
 drivers/media/dvb/ttusb-dec/ttusb_dec.c           |   24 +++---
 drivers/media/video/arv.c                         |    2 
 drivers/media/video/w9966.c                       |    6 -
 drivers/media/video/zr36120.c                     |   16 ++--
 drivers/mtd/chips/jedec.c                         |   14 +--
 drivers/mtd/chips/map_ram.c                       |    6 -
 drivers/mtd/chips/map_rom.c                       |    2 
 drivers/mtd/devices/doc1000.c                     |    4 -
 drivers/mtd/devices/doc2000.c                     |   28 +++----
 drivers/mtd/devices/doc2001.c                     |   24 +++---
 drivers/mtd/devices/doc2001plus.c                 |   28 +++----
 drivers/mtd/devices/ms02-nv.c                     |    6 -
 drivers/mtd/devices/mtdram.c                      |    4 -
 drivers/mtd/devices/phram.c                       |    8 +-
 drivers/mtd/devices/pmc551.c                      |   10 +-
 drivers/mtd/devices/slram.c                       |    8 +-
 drivers/mtd/maps/ocelot.c                         |    2 
 drivers/mtd/maps/uclinux.c                        |    4 -
 drivers/mtd/mtdchar.c                             |   10 +-
 drivers/mtd/nand/diskonchip.c                     |   80 +++++++++++-----------
 drivers/mtd/nand/s3c2410.c                        |   10 +-
 drivers/net/appletalk/ipddp.c                     |    2 
 drivers/net/appletalk/ltpc.c                      |    8 +-
 drivers/net/arcnet/arc-rawmode.c                  |    4 -
 drivers/net/arcnet/arc-rimi.c                     |   14 +--
 drivers/net/arcnet/arcnet.c                       |   30 ++++----
 drivers/net/arcnet/com20020.c                     |    6 -
 drivers/net/arcnet/com90io.c                      |    4 -
 drivers/net/arcnet/com90xx.c                      |    8 +-
 drivers/net/arcnet/rfc1051.c                      |    8 +-
 drivers/net/arcnet/rfc1201.c                      |   12 +--
 drivers/net/bonding/bond_3ad.c                    |    3 
 drivers/net/hamradio/baycom_epp.c                 |    4 -
 drivers/net/hamradio/baycom_par.c                 |    4 -
 drivers/net/hamradio/baycom_ser_fdx.c             |    2 
 drivers/net/hamradio/baycom_ser_hdx.c             |    2 
 drivers/net/hamradio/bpqether.c                   |   12 +--
 drivers/net/hamradio/hdlcdrv.c                    |   12 +--
 drivers/net/hamradio/mkiss.c                      |   22 +++---
 drivers/net/hamradio/scc.c                        |   12 +--
 drivers/net/hamradio/yam.c                        |   12 +--
 drivers/net/irda/ali-ircc.c                       |   22 +++---
 drivers/net/irda/donauboe.c                       |   28 +++----
 drivers/net/irda/irda-usb.c                       |   12 +--
 drivers/net/irda/irport.c                         |   27 +++----
 drivers/net/irda/nsc-ircc.c                       |   16 ++--
 drivers/net/irda/smsc-ircc2.c                     |   25 +++---
 drivers/net/irda/via-ircc.c                       |   17 ++--
 drivers/net/irda/w83977af_ir.c                    |   16 +---
 70 files changed, 585 insertions(+), 610 deletions(-)


	Domen

--===============043571393924669799==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============043571393924669799==--
