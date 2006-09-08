From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:22 +0000
Subject: [KJ] [PATCH 00/72] arm: add KERN_ constants to files in arch/arm/*
Message-Id: <20060908015622.10114.66478.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This series of patches add appropriate KERN_ constants to printk()s in the rest of
the files in /arch/arm.  It also reworks some debug #defines to make their operation
more clear.

 mach-footbridge/cats-pci.c     |    2 -
 mach-footbridge/netwinder-hw.c |   56 ++++++++++++++++++++---------------------
 mach-h720x/common.c            |   19 +++++--------
 mach-integrator/clock.c        |    2 -
 mach-integrator/impd1.c        |    4 +-
 mach-iop3xx/iop321-pci.c       |    6 ----
 mach-iop3xx/iop331-pci.c       |    8 +----
 mach-ixp2000/ixdp2800.c        |    2 -
 mach-ixp23xx/pci.c             |    6 ----
 mach-ixp4xx/common-pci.c       |    8 ++---
 mach-ixp4xx/common.c           |    2 -
 mach-ixp4xx/gtwx5715-pci.c     |    2 -
 mach-lh7a40x/clcd.c            |    8 ++---
 mach-lh7a40x/ssp-cpld.c        |   19 +++++--------
 mach-netx/generic.c            |    6 ----
 mach-omap1/board-h2.c          |    2 -
 mach-omap1/board-h3.c          |    2 -
 mach-omap1/board-innovator.c   |    4 +-
 mach-omap1/board-nokia770.c    |    2 -
 mach-omap1/board-osk.c         |    4 +-
 mach-omap1/clock.c             |    2 -
 mach-omap1/id.c                |   22 +++++++---------
 mach-omap1/irq.c               |    4 +-
 mach-omap1/pm.c                |    6 ++--
 mach-omap1/serial.c            |    6 ++--
 mach-omap2/pm.c                |    6 ++--
 mach-omap2/serial.c            |   12 ++++----
 mach-pnx4008/gpio.c            |    2 -
 mach-pxa/idp.c                 |    2 -
 mach-realview/clock.c          |    2 -
 mach-realview/hotplug.c        |    4 --
 mach-realview/localtimer.c     |    2 -
 mach-rpc/dma.c                 |    2 -
 mach-s3c2410/cpu.c             |    2 -
 mach-s3c2410/dma.c             |   18 ++++++-------
 mach-s3c2410/irq.c             |    6 ++--
 mach-s3c2410/pm.c              |    2 -
 mach-s3c2410/s3c2410-clock.c   |    2 -
 mach-s3c2410/s3c2410.c         |    4 +-
 mach-s3c2410/s3c2412-clock.c   |    2 -
 mach-s3c2410/s3c2412.c         |    4 +-
 mach-s3c2410/s3c2440-clock.c   |    2 -
 mach-s3c2410/s3c2440-irq.c     |    2 -
 mach-s3c2410/s3c2440.c         |    2 -
 mach-s3c2410/s3c2442-clock.c   |    2 -
 mach-s3c2410/s3c2442.c         |    2 -
 mach-s3c2410/s3c244x.c         |    2 -
 mach-s3c2410/time.c            |    2 -
 mach-s3c2410/usb-simtec.c      |    2 -
 mach-sa1100/assabet.c          |    4 +-
 mach-sa1100/collie_pm.c        |   14 +++++-----
 mach-sa1100/cpu-sa1110.c       |    2 -
 mach-sa1100/h3600.c            |   18 ++++++++-----
 mach-shark/irq.c               |    2 -
 mach-versatile/clock.c         |    2 -
 mach-versatile/pci.c           |   14 +++++-----
 mm/alignment.c                 |    2 -
 mm/fault.c                     |    2 -
 mm/init.c                      |   16 +++++------
 mm/ioremap.c                   |    2 -
 mm/mm-armv.c                   |    2 -
 nwfpe/fpa11.c                  |    4 +-
 nwfpe/fpa11_cprt.c             |    4 +-
 nwfpe/softfloat.c              |    2 -
 plat-omap/dma.c                |   10 -------
 plat-omap/dmtimer.c            |    2 -
 plat-omap/gpio.c               |    6 ++--
 plat-omap/mcbsp.c              |   18 ++++++-------
 plat-omap/mux.c                |   10 +++----
 plat-omap/ocpi.c               |    2 -
 plat-omap/pm.c                 |    6 ++--
 plat-omap/usb.c                |    4 +-
 72 files changed, 204 insertions(+), 236 deletions(-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
