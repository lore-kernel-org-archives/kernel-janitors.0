From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:12:57 +0000
Subject: [PATCH 02/12] arch/arm: Removed duplicate includes.
Message-Id: <472F7949.5000209@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/arm/common/rtctime.c            |    1 -
 arch/arm/mach-ep93xx/core.c          |    1 -
 arch/arm/mach-ixp23xx/core.c         |    1 -
 arch/arm/mach-ixp23xx/espresso.c     |    2 --
 arch/arm/mach-ixp23xx/ixdp2351.c     |    2 --
 arch/arm/mach-ixp23xx/roadrunner.c   |    2 --
 arch/arm/mach-ixp4xx/nslu2-power.c   |    1 -
 arch/arm/mach-omap1/board-nokia770.c |    1 -
 arch/arm/mach-omap1/board-osk.c      |    1 -
 arch/arm/mach-omap1/board-palmtt.c   |    1 -
 arch/arm/mach-omap1/board-palmz71.c  |    1 -
 arch/arm/mach-omap2/board-apollon.c  |    1 -
 12 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/arch/arm/common/rtctime.c b/arch/arm/common/rtctime.c
index bf1075e..f53bca4 100644
--- a/arch/arm/common/rtctime.c
+++ b/arch/arm/common/rtctime.c
@@ -20,7 +20,6 @@
 #include <linux/capability.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/rtc.h>
 
 #include <asm/rtc.h>
 #include <asm/semaphore.h>
diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 70b2c78..f8f001d 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -21,7 +21,6 @@
 #include <linux/serial.h>
 #include <linux/tty.h>
 #include <linux/bitops.h>
-#include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/device.h>
diff --git a/arch/arm/mach-ixp23xx/core.c b/arch/arm/mach-ixp23xx/core.c
index 16356ff..5fea5a1 100644
--- a/arch/arm/mach-ixp23xx/core.c
+++ b/arch/arm/mach-ixp23xx/core.c
@@ -22,7 +22,6 @@
 #include <linux/serial.h>
 #include <linux/tty.h>
 #include <linux/bitops.h>
-#include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/device.h>
diff --git a/arch/arm/mach-ixp23xx/espresso.c b/arch/arm/mach-ixp23xx/espresso.c
index 7a85ced..d3a779a 100644
--- a/arch/arm/mach-ixp23xx/espresso.c
+++ b/arch/arm/mach-ixp23xx/espresso.c
@@ -19,7 +19,6 @@
 #include <linux/tty.h>
 #include <linux/bitops.h>
 #include <linux/ioport.h>
-#include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/device.h>
@@ -40,7 +39,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/irq.h>
 #include <asm/mach/pci.h>
 
 static int __init espresso_pci_init(void)
diff --git a/arch/arm/mach-ixp23xx/ixdp2351.c b/arch/arm/mach-ixp23xx/ixdp2351.c
index c41a6b5..5c5d4d6 100644
--- a/arch/arm/mach-ixp23xx/ixdp2351.c
+++ b/arch/arm/mach-ixp23xx/ixdp2351.c
@@ -24,7 +24,6 @@
 #include <linux/tty.h>
 #include <linux/bitops.h>
 #include <linux/ioport.h>
-#include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/device.h>
@@ -44,7 +43,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/irq.h>
 #include <asm/mach/pci.h>
 
 /*
diff --git a/arch/arm/mach-ixp23xx/roadrunner.c b/arch/arm/mach-ixp23xx/roadrunner.c
index e356449..f0f70ba 100644
--- a/arch/arm/mach-ixp23xx/roadrunner.c
+++ b/arch/arm/mach-ixp23xx/roadrunner.c
@@ -23,7 +23,6 @@
 #include <linux/tty.h>
 #include <linux/bitops.h>
 #include <linux/ioport.h>
-#include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/device.h>
@@ -44,7 +43,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/irq.h>
 #include <asm/mach/pci.h>
 
 /*
diff --git a/arch/arm/mach-ixp4xx/nslu2-power.c b/arch/arm/mach-ixp4xx/nslu2-power.c
index acd71e9..6f10dc2 100644
--- a/arch/arm/mach-ixp4xx/nslu2-power.c
+++ b/arch/arm/mach-ixp4xx/nslu2-power.c
@@ -21,7 +21,6 @@
 #include <linux/reboot.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/reboot.h>
 
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 22db19a..3903d37 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -32,7 +32,6 @@
 #include <asm/arch/common.h>
 #include <asm/arch/dsp_common.h>
 #include <asm/arch/aic23.h>
-#include <asm/arch/gpio.h>
 #include <asm/arch/omapfb.h>
 #include <asm/arch/lcd_mipid.h>
 
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 5db182d..4081a42 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -31,7 +31,6 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/interrupt.h>
 #include <linux/i2c.h>
 
 #include <linux/mtd/mtd.h>
diff --git a/arch/arm/mach-omap1/board-palmtt.c b/arch/arm/mach-omap1/board-palmtt.c
index e47010f..ed7094a 100644
--- a/arch/arm/mach-omap1/board-palmtt.c
+++ b/arch/arm/mach-omap1/board-palmtt.c
@@ -42,7 +42,6 @@
 #include <asm/arch/common.h>
 #include <asm/arch/omap-alsa.h>
 
-#include <linux/input.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 
diff --git a/arch/arm/mach-omap1/board-palmz71.c b/arch/arm/mach-omap1/board-palmz71.c
index c275d51..a9a0f66 100644
--- a/arch/arm/mach-omap1/board-palmz71.c
+++ b/arch/arm/mach-omap1/board-palmz71.c
@@ -44,7 +44,6 @@
 #include <asm/arch/common.h>
 #include <asm/arch/omap-alsa.h>
 
-#include <linux/input.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 
diff --git a/arch/arm/mach-omap2/board-apollon.c b/arch/arm/mach-omap2/board-apollon.c
index 3bb49c1..94e38cc 100644
--- a/arch/arm/mach-omap2/board-apollon.c
+++ b/arch/arm/mach-omap2/board-apollon.c
@@ -26,7 +26,6 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/leds.h>
-#include <linux/irq.h>
 
 #include <asm/hardware.h>
 #include <asm/mach-types.h>
-- 


