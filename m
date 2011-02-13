From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Feb 2011 11:50:54 +0000
Subject: [PATCH 0/5] Convert release_resource to release_region/release_mem_region
Message-Id: <1297599132-7226-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Request_region should be used with release_region, not release_resource.

The changes are somewhat complicated, so I have only done a few cases to
start with.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,E;
@@
(
*x = request_region(...)
|
*x = request_mem_region(...)
)
... when != release_region(x)
    when != x = E
* release_resource(x);
// </smpl>

The complete set of files in which this semantic match finds problesm is as
follows:

arch/unicore32/kernel/rtc.c
arch/x86/pci/direct.c
drivers/char/hw_random/omap-rng.c
drivers/char/pcmcia/ipwireless/main.c
drivers/i2c/busses/i2c-au1550.c
drivers/i2c/busses/i2c-nuc900.c
drivers/i2c/busses/i2c-s3c2410.c
drivers/i2c/busses/i2c-sh7760.c
drivers/i2c/busses/i2c-simtec.c
drivers/media/video/s5p-fimc/fimc-core.c
drivers/mfd/sm501.c
drivers/misc/atmel_tclib.c
drivers/mmc/host/au1xmmc.c
drivers/mmc/host/davinci_mmc.c
drivers/mmc/host/mvsdio.c
drivers/mmc/host/pxamci.c
drivers/mmc/host/sdhci-s3c.c
drivers/mtd/maps/ceiva.c
drivers/net/a2065.c
drivers/net/ariadne.c
drivers/net/arm/ixp4xx_eth.c
drivers/net/ax88796.c
drivers/parport/parport_ax88796.c
drivers/parport/parport_pc.c
drivers/rtc/rtc-s3c.c
drivers/spi/au1550_spi.c
drivers/spi/spi_s3c24xx.c
drivers/tty/serial/sh-sci.c
drivers/tty/serial/vr41xx_siu.c
drivers/usb/gadget/s3c-hsotg.c
drivers/video/s3c-fb.c
drivers/video/s3c2410fb.c
drivers/video/sh7760fb.c
drivers/video/sm501fb.c
drivers/watchdog/davinci_wdt.c
drivers/watchdog/max63xx_wdt.c
drivers/watchdog/pnx4008_wdt.c
drivers/watchdog/s3c2410_wdt.c

