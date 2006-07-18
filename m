From: ricknu-0@student.ltu.se
Date: Tue, 18 Jul 2006 17:30:01 +0000
Subject: [KJ] [PATCH] Remove obsolete #include <linux/config.h>
Message-Id: <1153243801.44bd1a99669e9@portal.student.luth.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Richard Knutsson

Remove obsolete #include <linux/config.h>.
Pulled and diffed against linus' git-tree (06-07-18).

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>

---

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 2cb9c43..d4193c8 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -21,7 +21,6 @@ #include <linux/user.h>
 #include <linux/a.out.h>
 #include <linux/screen_info.h>
 #include <linux/delay.h>
-#include <linux/config.h>	/* CONFIG_ALPHA_LCA etc */
 #include <linux/mc146818rtc.h>
 #include <linux/console.h>
 #include <linux/cpu.h>
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 4342cea..f6cfe8c 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -4,7 +4,6 @@
  * The system call table. 
  */
 
-#include <linux/config.h>			/* CONFIG_OSF4_COMPAT */
 #include <asm/unistd.h>
 
 	.data
diff --git a/arch/arm/kernel/crunch.c b/arch/arm/kernel/crunch.c
index 7481759..cec8378 100644
--- a/arch/arm/kernel/crunch.c
+++ b/arch/arm/kernel/crunch.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/signal.h>
diff --git a/arch/arm/kernel/iwmmxt-notifier.c b/arch/arm/kernel/iwmmxt-notifier.c
index 44a86c3..0d1a1db 100644
--- a/arch/arm/kernel/iwmmxt-notifier.c
+++ b/arch/arm/kernel/iwmmxt-notifier.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/signal.h>
diff --git a/arch/arm/mach-at91rm9200/board-1arm.c
b/arch/arm/mach-at91rm9200/board-1arm.c
index dc79e09..051a295 100644
--- a/arch/arm/mach-at91rm9200/board-1arm.c
+++ b/arch/arm/mach-at91rm9200/board-1arm.c
@@ -18,7 +18,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-at91rm9200/board-carmeva.c
b/arch/arm/mach-at91rm9200/board-carmeva.c
index 2c138b5..54891c4 100644
--- a/arch/arm/mach-at91rm9200/board-carmeva.c
+++ b/arch/arm/mach-at91rm9200/board-carmeva.c
@@ -19,7 +19,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-at91rm9200/board-eb9200.c
b/arch/arm/mach-at91rm9200/board-eb9200.c
index a3e2df9..4531f34 100644
--- a/arch/arm/mach-at91rm9200/board-eb9200.c
+++ b/arch/arm/mach-at91rm9200/board-eb9200.c
@@ -19,7 +19,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-at91rm9200/board-kafa.c
b/arch/arm/mach-at91rm9200/board-kafa.c
index bf760c5..354b91c 100644
--- a/arch/arm/mach-at91rm9200/board-kafa.c
+++ b/arch/arm/mach-at91rm9200/board-kafa.c
@@ -18,7 +18,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-at91rm9200/board-kb9202.c
b/arch/arm/mach-at91rm9200/board-kb9202.c
index f06d2b5..1827db4 100644
--- a/arch/arm/mach-at91rm9200/board-kb9202.c
+++ b/arch/arm/mach-at91rm9200/board-kb9202.c
@@ -19,7 +19,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-ep93xx/edb9302.c b/arch/arm/mach-ep93xx/edb9302.c
index 62a8efd..0315615 100644
--- a/arch/arm/mach-ep93xx/edb9302.c
+++ b/arch/arm/mach-ep93xx/edb9302.c
@@ -10,7 +10,6 @@
  * your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-ep93xx/edb9315.c b/arch/arm/mach-ep93xx/edb9315.c
index ef7482f..249ca9e 100644
--- a/arch/arm/mach-ep93xx/edb9315.c
+++ b/arch/arm/mach-ep93xx/edb9315.c
@@ -10,7 +10,6 @@
  * your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-ep93xx/edb9315a.c b/arch/arm/mach-ep93xx/edb9315a.c
index bfefdaa..e03407e 100644
--- a/arch/arm/mach-ep93xx/edb9315a.c
+++ b/arch/arm/mach-ep93xx/edb9315a.c
@@ -10,7 +10,6 @@
  * your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/arm/mach-lh7a40x/clcd.c b/arch/arm/mach-lh7a40x/clcd.c
index 93751fe..1992db4 100644
--- a/arch/arm/mach-lh7a40x/clcd.c
+++ b/arch/arm/mach-lh7a40x/clcd.c
@@ -8,7 +8,7 @@
  *  version 2 as published by the Free Software Foundation.
  *
  */
-#include <linux/config.h>
+
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
diff --git a/arch/arm/mach-lh7a40x/clocks.c b/arch/arm/mach-lh7a40x/clocks.c
index 2291afe..7530a95 100644
--- a/arch/arm/mach-lh7a40x/clocks.c
+++ b/arch/arm/mach-lh7a40x/clocks.c
@@ -8,7 +8,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/cpufreq.h>
 #include <asm/hardware.h>
 #include <asm/arch/clocks.h>
diff --git a/arch/arm/mach-omap2/pm-domain.c b/arch/arm/mach-omap2/pm-domain.c
index 5e20e74..2494091 100644
--- a/arch/arm/mach-omap2/pm-domain.c
+++ b/arch/arm/mach-omap2/pm-domain.c
@@ -15,7 +15,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/clk.h>
diff --git a/arch/arm/mach-pnx4008/gpio.c b/arch/arm/mach-pnx4008/gpio.c
index e1ce050..1ab84ce 100644
--- a/arch/arm/mach-pnx4008/gpio.c
+++ b/arch/arm/mach-pnx4008/gpio.c
@@ -14,7 +14,6 @@
  * or implied.
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/arch/arm/mach-pnx4008/sleep.S b/arch/arm/mach-pnx4008/sleep.S
index 93c802b..fea1e17 100644
--- a/arch/arm/mach-pnx4008/sleep.S
+++ b/arch/arm/mach-pnx4008/sleep.S
@@ -11,7 +11,6 @@
  * or implied.
  */
 
-#include <linux/config.h>
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/hardware.h>
diff --git a/arch/arm/mach-pnx4008/time.c b/arch/arm/mach-pnx4008/time.c
index 756228d..b986065 100644
--- a/arch/arm/mach-pnx4008/time.c
+++ b/arch/arm/mach-pnx4008/time.c
@@ -11,7 +11,6 @@
  * or implied.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
diff --git a/arch/arm/mach-pxa/leds-trizeps4.c b/arch/arm/mach-pxa/leds-trizeps4.c
index 14cfc85..2271d20 100644
--- a/arch/arm/mach-pxa/leds-trizeps4.c
+++ b/arch/arm/mach-pxa/leds-trizeps4.c
@@ -10,7 +10,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/config.h>
 #include <linux/init.h>
 
 #include <asm/hardware.h>
diff --git a/arch/arm26/lib/ecard.S b/arch/arm26/lib/ecard.S
index b463315..586b099 100644
--- a/arch/arm26/lib/ecard.S
+++ b/arch/arm26/lib/ecard.S
@@ -7,7 +7,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#include <linux/config.h> /* for CONFIG_CPU_nn */
+
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/hardware.h>
diff --git a/arch/arm26/lib/io-acorn.S b/arch/arm26/lib/io-acorn.S
index f6c3e30..c413721 100644
--- a/arch/arm26/lib/io-acorn.S
+++ b/arch/arm26/lib/io-acorn.S
@@ -7,7 +7,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#include <linux/config.h> /* for CONFIG_CPU_nn */
+
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/hardware.h>
diff --git a/arch/frv/kernel/time.c b/arch/frv/kernel/time.c
index d5b64e1..217a4c1 100644
--- a/arch/frv/kernel/time.c
+++ b/arch/frv/kernel/time.c
@@ -10,7 +10,6 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h> /* CONFIG_HEARTBEAT */
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/sched.h>
diff --git a/arch/h8300/kernel/time.c b/arch/h8300/kernel/time.c
index 688a510..91f4765 100644
--- a/arch/h8300/kernel/time.c
+++ b/arch/h8300/kernel/time.c
@@ -16,7 +16,6 @@
  *		"A Kernel Model for Precision Timekeeping" by Dave Mills
  */
 
-#include <linux/config.h> /* CONFIG_HEARTBEAT */
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
diff --git a/arch/i386/boot/video.S b/arch/i386/boot/video.S
index 8c2a6fa..2c5b5cc 100644
--- a/arch/i386/boot/video.S
+++ b/arch/i386/boot/video.S
@@ -11,8 +11,6 @@
  *
  */
 
-#include <linux/config.h> /* for CONFIG_VIDEO_* */
-
 /* Enable autodetection of SVGA adapters and modes. */
 #undef CONFIG_VIDEO_SVGA
 
diff --git a/arch/i386/kernel/nmi.c b/arch/i386/kernel/nmi.c
index 2dd928a..a8b7293 100644
--- a/arch/i386/kernel/nmi.c
+++ b/arch/i386/kernel/nmi.c
@@ -13,7 +13,6 @@
  *  Mikael Pettersson	: PM converted to driver model. Disable/enable API.
  */
 
-#include <linux/config.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
diff --git a/arch/i386/lib/delay.c b/arch/i386/lib/delay.c
index 3c0714c..f6edb11 100644
--- a/arch/i386/lib/delay.c
+++ b/arch/i386/lib/delay.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/config.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
 
diff --git a/arch/m32r/mm/mmu.S b/arch/m32r/mm/mmu.S
index 0c28f11..9a4d40b 100644
--- a/arch/m32r/mm/mmu.S
+++ b/arch/m32r/mm/mmu.S
@@ -6,7 +6,6 @@
 
 /* $Id: mmu.S,v 1.15 2004/03/16 02:56:27 takata Exp $ */
 
-#include <linux/config.h>	/* CONFIG_MMU */
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/smp.h>
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 98e4b1a..073d945 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -10,7 +10,6 @@
  *		"A Kernel Model for Precision Timekeeping" by Dave Mills
  */
 
-#include <linux/config.h> /* CONFIG_HEARTBEAT */
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
diff --git a/arch/m68knommu/platform/532x/config.c
b/arch/m68knommu/platform/532x/config.c
index ceef9bc..c7d6ad5 100644
--- a/arch/m68knommu/platform/532x/config.c
+++ b/arch/m68knommu/platform/532x/config.c
@@ -17,7 +17,6 @@
 
 /***************************************************************************/
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/param.h>
diff --git a/arch/m68knommu/platform/68328/romvec.S
b/arch/m68knommu/platform/68328/romvec.S
index 3e7fe1e..3108446 100644
--- a/arch/m68knommu/platform/68328/romvec.S
+++ b/arch/m68knommu/platform/68328/romvec.S
@@ -10,8 +10,6 @@
  * Copyright 2006 Greg Ungerer <gerg@snapgear.com>
  */
 
-#include <linux/config.h>
-
 .global _start
 .global _buserr
 .global trap
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 3e79e62..eaad232 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -12,8 +12,6 @@
  * Initial Version 04-23-1999 by Helge Deller <deller@gmx.de>
  */
 
-#include <linux/config.h>	/* for CONFIG_SMP */
-
 #include <asm/asm-offsets.h>
 #include <asm/psw.h>
 #include <asm/pdc.h>
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 9670a89..a058004 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -6,7 +6,6 @@
  * thanks to Philipp Rumpf, Mike Shaver and various others
  * sorry about the wall, puffin..
  */
-#include <linux/config.h> /* for CONFIG_SMP */
 
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c
b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index b463056..0d2ea8b 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -11,7 +11,6 @@
  * option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/stddef.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 18e6e11..32a3d1c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -11,7 +11,6 @@
  * option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/stddef.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c
b/arch/powerpc/platforms/cell/cbe_regs.c
index ce696c1..73fdfea 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -7,7 +7,6 @@
  */
 
 
-#include <linux/config.h>
 #include <linux/percpu.h>
 #include <linux/types.h>
 
diff --git a/arch/powerpc/platforms/cell/ras.c b/arch/powerpc/platforms/cell/ras.c
index 033ad6e..0984c70 100644
--- a/arch/powerpc/platforms/cell/ras.c
+++ b/arch/powerpc/platforms/cell/ras.c
@@ -1,6 +1,5 @@
 #define DEBUG
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/smp.h>
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index d7a4fc7..dd11842 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -18,7 +18,6 @@
  * or implied.
  */
 
-#include <linux/config.h>
 #include <linux/stddef.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
diff --git a/arch/powerpc/sysdev/tsi108_dev.c b/arch/powerpc/sysdev/tsi108_dev.c
index 26a0cc8..d71963d 100644
--- a/arch/powerpc/sysdev/tsi108_dev.c
+++ b/arch/powerpc/sysdev/tsi108_dev.c
@@ -9,7 +9,6 @@
  * option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/stddef.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/ppc/amiga/time.c b/arch/ppc/amiga/time.c
index 0073527..8c880c0 100644
--- a/arch/ppc/amiga/time.c
+++ b/arch/ppc/amiga/time.c
@@ -1,4 +1,3 @@
-#include <linux/config.h> /* CONFIG_HEARTBEAT */
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
diff --git a/arch/ppc/platforms/4xx/cpci405.h b/arch/ppc/platforms/4xx/cpci405.h
index f5a5c0c..a6c0a13 100644
--- a/arch/ppc/platforms/4xx/cpci405.h
+++ b/arch/ppc/platforms/4xx/cpci405.h
@@ -13,7 +13,6 @@ #ifdef __KERNEL__
 #ifndef __CPCI405_H__
 #define __CPCI405_H__
 
-#include <linux/config.h>
 #include <platforms/4xx/ibm405gp.h>
 #include <asm/ppcboot.h>
 
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 8654b44..4c7ec71 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -25,7 +25,6 @@
  * <zaitcev> Sounds reasonable
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
diff --git a/arch/sparc/kernel/of_device.c b/arch/sparc/kernel/of_device.c
index 5a2faad..701e5ff 100644
--- a/arch/sparc/kernel/of_device.c
+++ b/arch/sparc/kernel/of_device.c
@@ -1,4 +1,3 @@
-#include <linux/config.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/sparc64/kernel/auxio.c b/arch/sparc64/kernel/auxio.c
index 718350a..826118e 100644
--- a/arch/sparc64/kernel/auxio.c
+++ b/arch/sparc64/kernel/auxio.c
@@ -5,7 +5,6 @@
  * Refactoring for unified NCR/PCIO support 2002 Eric Brower (ebrower@usa.net)
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/sparc64/kernel/of_device.c b/arch/sparc64/kernel/of_device.c
index 7064cee..352518b 100644
--- a/arch/sparc64/kernel/of_device.c
+++ b/arch/sparc64/kernel/of_device.c
@@ -1,4 +1,3 @@
-#include <linux/config.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/sparc64/kernel/prom.c b/arch/sparc64/kernel/prom.c
index c86007a..b88563d 100644
--- a/arch/sparc64/kernel/prom.c
+++ b/arch/sparc64/kernel/prom.c
@@ -15,7 +15,6 @@
  *      2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/string.h>
diff --git a/arch/v850/kernel/time.c b/arch/v850/kernel/time.c
index a0b4669..690dbfa 100644
--- a/arch/v850/kernel/time.c
+++ b/arch/v850/kernel/time.c
@@ -10,7 +10,6 @@
  *		"A Kernel Model for Precision Timekeeping" by Dave Mills
  */
 
-#include <linux/config.h> /* CONFIG_HEARTBEAT */
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/arch/x86_64/boot/video.S b/arch/x86_64/boot/video.S
index 2aa565c..d6ff88f 100644
--- a/arch/x86_64/boot/video.S
+++ b/arch/x86_64/boot/video.S
@@ -11,8 +11,6 @@
  *
  */
 
-#include <linux/config.h> /* for CONFIG_VIDEO_* */
-
 /* Enable autodetection of SVGA adapters and modes. */
 #undef CONFIG_VIDEO_SVGA
 
diff --git a/arch/x86_64/ia32/ia32_binfmt.c b/arch/x86_64/ia32/ia32_binfmt.c
index a9dc0f3..d233389 100644
--- a/arch/x86_64/ia32/ia32_binfmt.c
+++ b/arch/x86_64/ia32/ia32_binfmt.c
@@ -6,7 +6,6 @@
  * of ugly preprocessor tricks. Talk about very very poor man's inheritance.
  */ 
 #include <linux/types.h>
-#include <linux/config.h> 
 #include <linux/stddef.h>
 #include <linux/rwsem.h>
 #include <linux/sched.h>
diff --git a/arch/x86_64/kernel/pci-calgary.c b/arch/x86_64/kernel/pci-calgary.c
index e71ed53..6f2047c 100644
--- a/arch/x86_64/kernel/pci-calgary.c
+++ b/arch/x86_64/kernel/pci-calgary.c
@@ -21,7 +21,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
diff --git a/arch/x86_64/kernel/tce.c b/arch/x86_64/kernel/tce.c
index d3a9e79..0062f73 100644
--- a/arch/x86_64/kernel/tce.c
+++ b/arch/x86_64/kernel/tce.c
@@ -21,7 +21,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
diff --git a/arch/x86_64/kernel/x8664_ksyms.c b/arch/x86_64/kernel/x8664_ksyms.c
index 370952c..f77cdc9 100644
--- a/arch/x86_64/kernel/x8664_ksyms.c
+++ b/arch/x86_64/kernel/x8664_ksyms.c
@@ -1,7 +1,6 @@
 /* Exports for assembly files.
    All C exports should go in the respective C files. */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 
diff --git a/arch/x86_64/lib/delay.c b/arch/x86_64/lib/delay.c
index b6cd3cc..50be909 100644
--- a/arch/x86_64/lib/delay.c
+++ b/arch/x86_64/lib/delay.c
@@ -8,7 +8,6 @@
  *	depends wildly on alignment on many x86 processors. 
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
diff --git a/arch/x86_64/lib/thunk.S b/arch/x86_64/lib/thunk.S
index 332ea5d..4bb9a33 100644
--- a/arch/x86_64/lib/thunk.S
+++ b/arch/x86_64/lib/thunk.S
@@ -6,7 +6,6 @@
 	 * $Id: thunk.S,v 1.2 2002/03/13 20:06:58 ak Exp $
 	 */
 
-	#include <linux/config.h>
 	#include <linux/linkage.h>
 	#include <asm/dwarf2.h>
 	#include <asm/calling.h>			
diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 1c4df22..54904f1 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -20,7 +20,6 @@
  *
  */
 
-#include <linux/config.h>	/* CONFIG_PROC_FS */
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/types.h>
diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 78082ed..1ad9817 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -19,7 +19,7 @@
  *    Questions/Comments/Bugfixes to iss_storagedev@hp.com
  *
  */
-#include <linux/config.h>	/* CONFIG_PROC_FS */
+
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/pci.h>
diff --git a/drivers/char/ftape/lowlevel/fdc-io.c
b/drivers/char/ftape/lowlevel/fdc-io.c
index 65c9d2e..2165324 100644
--- a/drivers/char/ftape/lowlevel/fdc-io.c
+++ b/drivers/char/ftape/lowlevel/fdc-io.c
@@ -26,7 +26,6 @@
  *      Linux.
  */
 
-#include <linux/config.h> /* for CONFIG_FT_* */
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/ioport.h>
diff --git a/drivers/char/ftape/zftape/zftape-rw.c
b/drivers/char/ftape/zftape/zftape-rw.c
index a61ef50..dab6346 100644
--- a/drivers/char/ftape/zftape/zftape-rw.c
+++ b/drivers/char/ftape/zftape/zftape-rw.c
@@ -24,7 +24,6 @@
  *      zftape.
  */
 
-#include <linux/config.h> /* for CONFIG_ZFT_DFLT_BLK_SZ */
 #include <linux/errno.h>
 #include <linux/mm.h>
 
diff --git a/drivers/char/ftape/zftape/zftape-rw.h
b/drivers/char/ftape/zftape/zftape-rw.h
index 14c07f0..1ceec22 100644
--- a/drivers/char/ftape/zftape/zftape-rw.h
+++ b/drivers/char/ftape/zftape/zftape-rw.h
@@ -28,7 +28,6 @@ #define _ZFTAPE_RW_H
  *
  */
 
-#include <linux/config.h> /* for CONFIG_ZFT_DFLT_BLK_SZ */
 #include "../zftape/zftape-buffers.h"
 
 #define SEGMENTS_PER_TAPE  (ft_segments_per_track * ft_tracks_per_tape)
diff --git a/drivers/char/hw_random/ixp4xx-rng.c
b/drivers/char/hw_random/ixp4xx-rng.c
index ef71022..7f7615b 100644
--- a/drivers/char/hw_random/ixp4xx-rng.c
+++ b/drivers/char/hw_random/ixp4xx-rng.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/char/nsc_gpio.c b/drivers/char/nsc_gpio.c
index 7719bd7..4d47d79 100644
--- a/drivers/char/nsc_gpio.c
+++ b/drivers/char/nsc_gpio.c
@@ -7,7 +7,6 @@
    Copyright (c) 2005      Jim Cromie <jim.cromie@gmail.com>
 */
 
-#include <linux/config.h>
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/errno.h>
diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 17bc8ab..4c231f8 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -35,7 +35,6 @@ #endif
 
 #define MAX_DEVICE_COUNT 4
 
-#include <linux/config.h>	
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/signal.h>
diff --git a/drivers/char/sx.c b/drivers/char/sx.c
index e1cd2bc..8320acd 100644
--- a/drivers/char/sx.c
+++ b/drivers/char/sx.c
@@ -205,7 +205,6 @@ #define RCS_REV "$Revision: 1.33 $"
 
 
 #include <linux/module.h>
-#include <linux/config.h> 
 #include <linux/kdev_t.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index df782dd..499a41a 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -63,7 +63,6 @@ #define MAX_ISA_DEVICES 10
 #define MAX_PCI_DEVICES 10
 #define MAX_TOTAL_DEVICES 20
 
-#include <linux/config.h>	
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/signal.h>
diff --git a/drivers/char/watchdog/pcwd.c b/drivers/char/watchdog/pcwd.c
index cd7d1b6..9718717 100644
--- a/drivers/char/watchdog/pcwd.c
+++ b/drivers/char/watchdog/pcwd.c
@@ -49,7 +49,6 @@
  *	More info available at http://www.berkprod.com/ or http://www.pcwatchdog.com/
  */
 
-#include <linux/config.h>	/* For CONFIG_WATCHDOG_NOWAYOUT/... */
 #include <linux/module.h>	/* For module specific items */
 #include <linux/moduleparam.h>	/* For new moduleparam's */
 #include <linux/types.h>	/* For standard types (like size_t) */
diff --git a/drivers/char/watchdog/pcwd_pci.c b/drivers/char/watchdog/pcwd_pci.c
index c7cfd6d..21ed0c5 100644
--- a/drivers/char/watchdog/pcwd_pci.c
+++ b/drivers/char/watchdog/pcwd_pci.c
@@ -31,7 +31,6 @@
  *	Includes, defines, variables, module parameters, ...
  */
 
-#include <linux/config.h>	/* For CONFIG_WATCHDOG_NOWAYOUT/... */
 #include <linux/module.h>	/* For module specific items */
 #include <linux/moduleparam.h>	/* For new moduleparam's */
 #include <linux/types.h>	/* For standard types (like size_t) */
diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index eec43ab..87f7312 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -32,7 +32,6 @@
     program which treats the 83791d as an 83781d).
 */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 5928240..820a752 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -9,7 +9,6 @@
  * kind, whether express or implied.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sched.h>
diff --git a/drivers/ide/pci/generic.c b/drivers/ide/pci/generic.c
index 2f962cf..09679c9 100644
--- a/drivers/ide/pci/generic.c
+++ b/drivers/ide/pci/generic.c
@@ -23,7 +23,6 @@
 
 #undef REALLY_SLOW_IO		/* most systems can safely undef this */
 
-#include <linux/config.h> /* for CONFIG_BLK_DEV_IDEPCI */
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/drivers/ide/pci/rz1000.c b/drivers/ide/pci/rz1000.c
index 608cd76..5f6950c 100644
--- a/drivers/ide/pci/rz1000.c
+++ b/drivers/ide/pci/rz1000.c
@@ -17,7 +17,6 @@
 
 #undef REALLY_SLOW_IO		/* most systems can safely undef this */
 
-#include <linux/config.h> /* for CONFIG_BLK_DEV_IDEPCI */
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/drivers/leds/leds-ams-delta.c b/drivers/leds/leds-ams-delta.c
index e9f0611..599878c 100644
--- a/drivers/leds/leds-ams-delta.c
+++ b/drivers/leds/leds-ams-delta.c
@@ -8,7 +8,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
diff --git a/drivers/media/radio/radio-aimslab.c
b/drivers/media/radio/radio-aimslab.c
index df22a58..5a9c1f1 100644
--- a/drivers/media/radio/radio-aimslab.c
+++ b/drivers/media/radio/radio-aimslab.c
@@ -35,7 +35,6 @@ #include <asm/io.h>		/* outb, outb_p			*
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_RTRACK_PORT 	*/
 #include <asm/semaphore.h>	/* Lock for the I/O 		*/
 
 #ifndef CONFIG_RADIO_RTRACK_PORT
diff --git a/drivers/media/radio/radio-aztech.c b/drivers/media/radio/radio-aztech.c
index 95e6322..63697ab 100644
--- a/drivers/media/radio/radio-aztech.c
+++ b/drivers/media/radio/radio-aztech.c
@@ -32,7 +32,6 @@ #include <asm/io.h>		/* outb, outb_p			*
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_AZTECH_PORT 	*/
 
 /* acceptable ports: 0x350 (JP3 shorted), 0x358 (JP3 open) */
 
diff --git a/drivers/media/radio/radio-gemtek.c b/drivers/media/radio/radio-gemtek.c
index 162f37d..ffabe02 100644
--- a/drivers/media/radio/radio-gemtek.c
+++ b/drivers/media/radio/radio-gemtek.c
@@ -23,7 +23,6 @@ #include <asm/io.h>		/* outb, outb_p			*
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_GEMTEK_PORT 	*/
 #include <linux/spinlock.h>
 
 #ifndef CONFIG_RADIO_GEMTEK_PORT
diff --git a/drivers/media/radio/radio-rtrack2.c
b/drivers/media/radio/radio-rtrack2.c
index 5b68ac4..e5e9d41 100644
--- a/drivers/media/radio/radio-rtrack2.c
+++ b/drivers/media/radio/radio-rtrack2.c
@@ -16,7 +16,6 @@ #include <asm/io.h>		/* outb, outb_p			*
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_RTRACK2_PORT 	*/
 #include <linux/spinlock.h>
 
 #ifndef CONFIG_RADIO_RTRACK2_PORT
diff --git a/drivers/media/radio/radio-terratec.c
b/drivers/media/radio/radio-terratec.c
index dfba4ae..72d82ca 100644
--- a/drivers/media/radio/radio-terratec.c
+++ b/drivers/media/radio/radio-terratec.c
@@ -31,7 +31,6 @@ #include <asm/io.h>		/* outb, outb_p			*
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_TERRATEC_PORT 	*/
 #include <linux/spinlock.h>
 
 #ifndef CONFIG_RADIO_TERRATEC_PORT
diff --git a/drivers/media/radio/radio-trust.c b/drivers/media/radio/radio-trust.c
index 8da4bad..696fae8 100644
--- a/drivers/media/radio/radio-trust.c
+++ b/drivers/media/radio/radio-trust.c
@@ -23,7 +23,6 @@ #include <asm/io.h>
 #include <asm/uaccess.h>
 #include <linux/videodev.h>
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_TRUST_PORT 	*/
 
 /* acceptable ports: 0x350 (JP3 shorted), 0x358 (JP3 open) */
 
diff --git a/drivers/media/radio/radio-typhoon.c
b/drivers/media/radio/radio-typhoon.c
index edd0122..2835c89 100644
--- a/drivers/media/radio/radio-typhoon.c
+++ b/drivers/media/radio/radio-typhoon.c
@@ -37,7 +37,6 @@ #include <asm/io.h>		/* outb, outb_p    
 #include <asm/uaccess.h>	/* copy to/from user              */
 #include <linux/videodev.h>	/* kernel radio structs           */
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_TYPHOON_*         */
 
 #define BANNER "Typhoon Radio Card driver v0.1\n"
 
diff --git a/drivers/media/radio/radio-zoltrix.c
b/drivers/media/radio/radio-zoltrix.c
index 59b86a6..432c3e2 100644
--- a/drivers/media/radio/radio-zoltrix.c
+++ b/drivers/media/radio/radio-zoltrix.c
@@ -34,7 +34,6 @@ #include <asm/io.h>		/* outb, outb_p    
 #include <asm/uaccess.h>	/* copy to/from user              */
 #include <linux/videodev.h>	/* kernel radio structs           */
 #include <media/v4l2-common.h>
-#include <linux/config.h>	/* CONFIG_RADIO_ZOLTRIX_PORT      */
 
 #ifndef CONFIG_RADIO_ZOLTRIX_PORT
 #define CONFIG_RADIO_ZOLTRIX_PORT -1
diff --git a/drivers/media/video/cx88/cx88-tvaudio.c
b/drivers/media/video/cx88/cx88-tvaudio.c
index 5785c34..cbd85fe 100644
--- a/drivers/media/video/cx88/cx88-tvaudio.c
+++ b/drivers/media/video/cx88/cx88-tvaudio.c
@@ -52,7 +52,6 @@ #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/smp_lock.h>
 #include <linux/delay.h>
-#include <linux/config.h>
 #include <linux/kthread.h>
 
 #include "cx88.h"
diff --git a/drivers/media/video/pvrusb2/pvrusb2-hdw-internal.h
b/drivers/media/video/pvrusb2/pvrusb2-hdw-internal.h
index 0d6dc33..0bc85c8 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-hdw-internal.h
+++ b/drivers/media/video/pvrusb2/pvrusb2-hdw-internal.h
@@ -33,7 +33,6 @@ #define __PVRUSB2_HDW_INTERNAL_H
 
 */
 
-#include <linux/config.h>
 #include <linux/videodev2.h>
 #include <linux/i2c.h>
 #include <linux/mutex.h>
diff --git a/drivers/media/video/pvrusb2/pvrusb2-main.c
b/drivers/media/video/pvrusb2/pvrusb2-main.c
index 8f1a5af..e976c48 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-main.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-main.c
@@ -20,7 +20,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
diff --git a/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
b/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
index 6af55a8..dacc87b 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
@@ -19,7 +19,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <asm/semaphore.h>
diff --git a/drivers/net/3c501.c b/drivers/net/3c501.c
index 07136ec..d7b115a 100644
--- a/drivers/net/3c501.c
+++ b/drivers/net/3c501.c
@@ -120,7 +120,6 @@ #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/errno.h>
-#include <linux/config.h>	/* for CONFIG_IP_MULTICAST */
 #include <linux/spinlock.h>
 #include <linux/ethtool.h>
 #include <linux/delay.h>
diff --git a/drivers/net/hp100.c b/drivers/net/hp100.c
index e7d9bf3..ff5a67d 100644
--- a/drivers/net/hp100.c
+++ b/drivers/net/hp100.c
@@ -111,7 +111,6 @@ #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/types.h>
-#include <linux/config.h>	/* for CONFIG_PCI */
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
diff --git a/drivers/net/irda/mcs7780.c b/drivers/net/irda/mcs7780.c
index 47f6f64..415ba8d 100644
--- a/drivers/net/irda/mcs7780.c
+++ b/drivers/net/irda/mcs7780.c
@@ -45,7 +45,6 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/errno.h>
diff --git a/drivers/net/irda/w83977af_ir.c b/drivers/net/irda/w83977af_ir.c
index 0ea65c4..b69776e 100644
--- a/drivers/net/irda/w83977af_ir.c
+++ b/drivers/net/irda/w83977af_ir.c
@@ -40,7 +40,6 @@
  ********************************************************************/
 
 #include <linux/module.h>
-#include <linux/config.h> 
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/skbuff.h>
diff --git a/drivers/net/netx-eth.c b/drivers/net/netx-eth.c
index b1311ae..30ed9a5 100644
--- a/drivers/net/netx-eth.c
+++ b/drivers/net/netx-eth.c
@@ -17,7 +17,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 25e31fb..b1d8ed4 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -14,7 +14,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
diff --git a/drivers/net/phy/vitesse.c b/drivers/net/phy/vitesse.c
index ffd215d..792716b 100644
--- a/drivers/net/phy/vitesse.c
+++ b/drivers/net/phy/vitesse.c
@@ -12,7 +12,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
diff --git a/drivers/net/smc911x.c b/drivers/net/smc911x.c
index d37bd86..642cfb6 100644
--- a/drivers/net/smc911x.c
+++ b/drivers/net/smc911x.c
@@ -56,7 +56,6 @@ #define SMC_DEBUG	 ( SMC_DEBUG_RX	  | \
 #endif
 
 
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/drivers/net/wan/cycx_main.c b/drivers/net/wan/cycx_main.c
index 430b1f6..a5e7ce1 100644
--- a/drivers/net/wan/cycx_main.c
+++ b/drivers/net/wan/cycx_main.c
@@ -40,7 +40,6 @@
 * 1998/08/08	acme		Initial version.
 */
 
-#include <linux/config.h>	/* OS configuration options */
 #include <linux/stddef.h>	/* offsetof(), etc. */
 #include <linux/errno.h>	/* return codes */
 #include <linux/string.h>	/* inline memset(), etc. */
diff --git a/drivers/net/wan/dlci.c b/drivers/net/wan/dlci.c
index 6e1ec5b..7369875 100644
--- a/drivers/net/wan/dlci.c
+++ b/drivers/net/wan/dlci.c
@@ -28,7 +28,6 @@
  *		2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h> /* for CONFIG_DLCI_COUNT */
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
diff --git a/drivers/net/wan/sdla.c b/drivers/net/wan/sdla.c
index 7628c2d..0ba018f 100644
--- a/drivers/net/wan/sdla.c
+++ b/drivers/net/wan/sdla.c
@@ -32,7 +32,6 @@
  *		2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h> /* for CONFIG_DLCI_MAX */
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
diff --git a/drivers/rtc/rtc-max6902.c b/drivers/rtc/rtc-max6902.c
index 2c97395..6c283a0 100644
--- a/drivers/rtc/rtc-max6902.c
+++ b/drivers/rtc/rtc-max6902.c
@@ -19,7 +19,6 @@
  *                - Initial driver creation.
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/version.h>
 
diff --git a/drivers/scsi/aic7xxx_old.c b/drivers/scsi/aic7xxx_old.c
index 3f85b5e..ba3bcca 100644
--- a/drivers/scsi/aic7xxx_old.c
+++ b/drivers/scsi/aic7xxx_old.c
@@ -249,8 +249,6 @@ #include <scsi/scsicam.h>
 #include <linux/stat.h>
 #include <linux/slab.h>        /* for kmalloc() */
 
-#include <linux/config.h>        /* for CONFIG_PCI */
-
 #define AIC7XXX_C_VERSION  "5.2.6"
 
 #define ALL_TARGETS -1
diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index e133733..4580633 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -46,7 +46,6 @@ #include <asm/uaccess.h>
 
 #include <linux/stat.h>
 #include <linux/slab.h>		/* for kmalloc() */
-#include <linux/config.h>	/* for CONFIG_PCI */
 #include <linux/pci.h>		/* for PCI support */
 #include <linux/proc_fs.h>
 #include <linux/blkdev.h>
diff --git a/drivers/scsi/hptiop.c b/drivers/scsi/hptiop.c
index ab2f8b2..ba4e7b5 100644
--- a/drivers/scsi/hptiop.c
+++ b/drivers/scsi/hptiop.c
@@ -15,7 +15,7 @@
  *
  * For more information, visit http://www.highpoint-tech.com
  */
-#include <linux/config.h>
+
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/string.h>
diff --git a/drivers/scsi/imm.h b/drivers/scsi/imm.h
index ece936a..8f6f32f 100644
--- a/drivers/scsi/imm.h
+++ b/drivers/scsi/imm.h
@@ -66,7 +66,6 @@ #define   IMM_VERSION   "2.05 (for Linux
  */
 /* ------ END OF USER CONFIGURABLE PARAMETERS ----- */
 
-#include  <linux/config.h>
 #include  <linux/stddef.h>
 #include  <linux/module.h>
 #include  <linux/kernel.h>
diff --git a/drivers/scsi/libata-eh.c b/drivers/scsi/libata-eh.c
index 4b6aa30..b3095fd 100644
--- a/drivers/scsi/libata-eh.c
+++ b/drivers/scsi/libata-eh.c
@@ -32,7 +32,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/ppa.h b/drivers/scsi/ppa.h
index 7511df3..ba80214 100644
--- a/drivers/scsi/ppa.h
+++ b/drivers/scsi/ppa.h
@@ -73,7 +73,6 @@ #define   PPA_VERSION   "2.07 (for Linux
  */
 /* ------ END OF USER CONFIGURABLE PARAMETERS ----- */
 
-#include  <linux/config.h>
 #include  <linux/stddef.h>
 #include  <linux/module.h>
 #include  <linux/kernel.h>
diff --git a/drivers/scsi/scsi.h b/drivers/scsi/scsi.h
index f51e466..d5a55fa 100644
--- a/drivers/scsi/scsi.h
+++ b/drivers/scsi/scsi.h
@@ -20,8 +20,6 @@
 #ifndef _SCSI_H
 #define _SCSI_H
 
-#include <linux/config.h>	    /* for CONFIG_SCSI_LOGGING */
-
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_device.h>
 #include <scsi/scsi_eh.h>
diff --git a/drivers/serial/cpm_uart/cpm_uart.h b/drivers/serial/cpm_uart/cpm_uart.h
index 3b35cb7..a8f894c 100644
--- a/drivers/serial/cpm_uart/cpm_uart.h
+++ b/drivers/serial/cpm_uart/cpm_uart.h
@@ -16,7 +16,6 @@
 #ifndef CPM_UART_H
 #define CPM_UART_H
 
-#include <linux/config.h>
 #include <linux/platform_device.h>
 #include <linux/fs_uart_pd.h>
 
diff --git a/drivers/serial/netx-serial.c b/drivers/serial/netx-serial.c
index c1adc9e..7502109 100644
--- a/drivers/serial/netx-serial.c
+++ b/drivers/serial/netx-serial.c
@@ -17,8 +17,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/config.h>
-
 #if defined(CONFIG_SERIAL_NETX_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
 #define SUPPORT_SYSRQ
 #endif
diff --git a/drivers/spi/spi_s3c24xx.c b/drivers/spi/spi_s3c24xx.c
index 5fc1456..20eb6e9 100644
--- a/drivers/spi/spi_s3c24xx.c
+++ b/drivers/spi/spi_s3c24xx.c
@@ -13,7 +13,6 @@
 
 //#define DEBUG
 
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
diff --git a/drivers/spi/spi_s3c24xx_gpio.c b/drivers/spi/spi_s3c24xx_gpio.c
index aacdceb..a5d2cdf 100644
--- a/drivers/spi/spi_s3c24xx_gpio.c
+++ b/drivers/spi/spi_s3c24xx_gpio.c
@@ -11,7 +11,6 @@
  *
 */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
diff --git a/drivers/usb/input/pid.c b/drivers/usb/input/pid.c
index d9d9f65..299ec95 100644
--- a/drivers/usb/input/pid.c
+++ b/drivers/usb/input/pid.c
@@ -24,7 +24,6 @@
  * e-mail - mail your message to <rdamazio@lsi.usp.br>
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
diff --git a/drivers/usb/input/usbtouchscreen.c b/drivers/usb/input/usbtouchscreen.c
index 3b175aa..6e66db8 100644
--- a/drivers/usb/input/usbtouchscreen.c
+++ b/drivers/usb/input/usbtouchscreen.c
@@ -32,7 +32,6 @@
 
 //#define DEBUG
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/input.h>
diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index bfde82f..fc6cc14 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -20,7 +20,6 @@
  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/init.h>
diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
b/drivers/usb/misc/sisusbvga/sisusb.c
index 738bd7c..61f0144 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -36,7 +36,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c
b/drivers/usb/misc/sisusbvga/sisusb_con.c
index fb48fec..bf26c3c 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -47,7 +47,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/fs/isofs/namei.c b/fs/isofs/namei.c
index e7ba0c3..c04b3a1 100644
--- a/fs/isofs/namei.c
+++ b/fs/isofs/namei.c
@@ -6,7 +6,6 @@
  *  (C) 1991  Linus Torvalds - minix filesystem
  */
 
-#include <linux/config.h>	/* Joliet? */
 #include <linux/smp_lock.h>
 #include "isofs.h"
 
diff --git a/fs/nfs/namespace.c b/fs/nfs/namespace.c
index 19b98ca..166502f 100644
--- a/fs/nfs/namespace.c
+++ b/fs/nfs/namespace.c
@@ -6,8 +6,6 @@
  * NFS namespace
  */
 
-#include <linux/config.h>
-
 #include <linux/dcache.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
diff --git a/fs/nfs/nfs4namespace.c b/fs/nfs/nfs4namespace.c
index ea38d27..3193770 100644
--- a/fs/nfs/nfs4namespace.c
+++ b/fs/nfs/nfs4namespace.c
@@ -6,8 +6,6 @@
  * NFSv4 namespace
  */
 
-#include <linux/config.h>
-
 #include <linux/dcache.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
diff --git a/fs/nfs/nfsroot.c b/fs/nfs/nfsroot.c
index c0a754e..330e4e9 100644
--- a/fs/nfs/nfsroot.c
+++ b/fs/nfs/nfsroot.c
@@ -69,7 +69,6 @@
  *	Fabian Frederick:	Option parser rebuilt (using parser lib)
 */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index e8a9bee..83b3723 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -15,7 +15,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 
diff --git a/include/asm-arm/arch-lh7a40x/clocks.h
b/include/asm-arm/arch-lh7a40x/clocks.h
index bee02fd..7d0ba18 100644
--- a/include/asm-arm/arch-lh7a40x/clocks.h
+++ b/include/asm-arm/arch-lh7a40x/clocks.h
@@ -8,8 +8,6 @@
  *
  */
 
-#include <linux/config.h>
-
 #ifndef __ASM_ARCH_CLOCKS_H
 #define __ASM_ARCH_CLOCKS_H
 
diff --git a/include/asm-arm/pgtable-nommu.h b/include/asm-arm/pgtable-nommu.h
index b13322d..c1b264d 100644
--- a/include/asm-arm/pgtable-nommu.h
+++ b/include/asm-arm/pgtable-nommu.h
@@ -13,7 +13,6 @@ #define _ASMARM_PGTABLE_NOMMU_H
 
 #ifndef __ASSEMBLY__
 
-#include <linux/config.h>
 #include <linux/slab.h>
 #include <asm/processor.h>
 #include <asm/page.h>
diff --git a/include/asm-i386/dwarf2.h b/include/asm-i386/dwarf2.h
index 2280f62..fe2392f 100644
--- a/include/asm-i386/dwarf2.h
+++ b/include/asm-i386/dwarf2.h
@@ -1,8 +1,6 @@
 #ifndef _DWARF2_H
 #define _DWARF2_H
 
-#include <linux/config.h>
-
 #ifndef __ASSEMBLY__
 #warning "asm/dwarf2.h should be only included in pure assembly files"
 #endif
diff --git a/include/asm-i386/tsc.h b/include/asm-i386/tsc.h
index 97b828c..c139331 100644
--- a/include/asm-i386/tsc.h
+++ b/include/asm-i386/tsc.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_i386_TSC_H
 #define _ASM_i386_TSC_H
 
-#include <linux/config.h>
 #include <asm/processor.h>
 
 /*
diff --git a/include/asm-powerpc/irq.h b/include/asm-powerpc/irq.h
index d903a62..5714900 100644
--- a/include/asm-powerpc/irq.h
+++ b/include/asm-powerpc/irq.h
@@ -9,7 +9,6 @@ #define _ASM_POWERPC_IRQ_H
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/threads.h>
 #include <linux/list.h>
 #include <linux/radix-tree.h>
diff --git a/include/asm-powerpc/pci-bridge.h b/include/asm-powerpc/pci-bridge.h
index 4f55573..86ee46b 100644
--- a/include/asm-powerpc/pci-bridge.h
+++ b/include/asm-powerpc/pci-bridge.h
@@ -6,7 +6,6 @@ #ifndef CONFIG_PPC64
 #include <asm-ppc/pci-bridge.h>
 #else
 
-#include <linux/config.h>
 #include <linux/pci.h>
 #include <linux/list.h>
 
diff --git a/include/asm-x86_64/calgary.h b/include/asm-x86_64/calgary.h
index fbfb501..3f2ffaa 100644
--- a/include/asm-x86_64/calgary.h
+++ b/include/asm-x86_64/calgary.h
@@ -24,7 +24,6 @@
 #ifndef _ASM_X86_64_CALGARY_H
 #define _ASM_X86_64_CALGARY_H
 
-#include <linux/config.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
diff --git a/include/linux/unwind.h b/include/linux/unwind.h
index ce48e2c..73e1751 100644
--- a/include/linux/unwind.h
+++ b/include/linux/unwind.h
@@ -12,8 +12,6 @@ #define _LINUX_UNWIND_H
  * is not much point in implementing the full Dwarf2 unwind API.
  */
 
-#include <linux/config.h>
-
 struct module;
 
 #ifdef CONFIG_STACK_UNWIND
diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 1ab806c..4a2bb08 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -3,7 +3,6 @@ #define _LINUX_VMSTAT_H
 
 #include <linux/types.h>
 #include <linux/percpu.h>
-#include <linux/config.h>
 #include <linux/mmzone.h>
 #include <asm/atomic.h>
 
diff --git a/include/net/netdma.h b/include/net/netdma.h
index 19760eb..1c390f7 100644
--- a/include/net/netdma.h
+++ b/include/net/netdma.h
@@ -20,7 +20,6 @@
  */
 #ifndef NETDMA_H
 #define NETDMA_H
-#include <linux/config.h>
 #ifdef CONFIG_NET_DMA
 #include <linux/dmaengine.h>
 #include <linux/skbuff.h>
diff --git a/init/do_mounts.h b/init/do_mounts.h
index e7f2e7f..735705d 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -1,4 +1,3 @@
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/syscalls.h>
diff --git a/kernel/rtmutex-debug.c b/kernel/rtmutex-debug.c
index 0c1faa9..54eb449 100644
--- a/kernel/rtmutex-debug.c
+++ b/kernel/rtmutex-debug.c
@@ -16,7 +16,7 @@
  *
  * See rt.c in preempt-rt for proper credits and further information
  */
-#include <linux/config.h>
+
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/module.h>
diff --git a/kernel/rtmutex-tester.c b/kernel/rtmutex-tester.c
index 948bd8f..6bd511c 100644
--- a/kernel/rtmutex-tester.c
+++ b/kernel/rtmutex-tester.c
@@ -6,7 +6,7 @@
  *  Copyright (C) 2006, Timesys Corp., Thomas Gleixner <tglx@timesys.com>
  *
  */
-#include <linux/config.h>
+
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/sched.h>
diff --git a/mm/filemap.h b/mm/filemap.h
index 3f2a343..c2bff04 100644
--- a/mm/filemap.h
+++ b/mm/filemap.h
@@ -12,7 +12,6 @@ #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
 #include <linux/uio.h>
-#include <linux/config.h>
 #include <linux/uaccess.h>
 
 size_t
diff --git a/mm/slab.c b/mm/slab.c
index 0f20843..ea8a488 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -86,7 +86,6 @@
  *	All object allocations for a node occur from node specific slab lists.
  */
 
-#include	<linux/config.h>
 #include	<linux/slab.h>
 #include	<linux/mm.h>
 #include	<linux/poison.h>
diff --git a/mm/vmstat.c b/mm/vmstat.c
index dfdf241..1ee23db 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -9,7 +9,6 @@
  *		Christoph Lameter <christoph@lameter.com>
  */
 
-#include <linux/config.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 
diff --git a/net/atm/atm_sysfs.c b/net/atm/atm_sysfs.c
index 5df4b9a..c0a4ae2 100644
--- a/net/atm/atm_sysfs.c
+++ b/net/atm/atm_sysfs.c
@@ -1,6 +1,5 @@
 /* ATM driver model support. */
 
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
diff --git a/net/core/dev_mcast.c b/net/core/dev_mcast.c
index c57d887..eb674ea 100644
--- a/net/core/dev_mcast.c
+++ b/net/core/dev_mcast.c
@@ -21,7 +21,6 @@
  *	2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h> 
 #include <linux/module.h> 
 #include <asm/uaccess.h>
 #include <asm/system.h>
diff --git a/net/core/wireless.c b/net/core/wireless.c
index d2bc72d..6780df3 100644
--- a/net/core/wireless.c
+++ b/net/core/wireless.c
@@ -72,7 +72,6 @@
 
 /***************************** INCLUDES *****************************/
 
-#include <linux/config.h>		/* Not needed ??? */
 #include <linux/module.h>
 #include <linux/types.h>		/* off_t */
 #include <linux/netdevice.h>		/* struct ifreq, dev_get_by_name() */
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index c84a320..529ee51 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -67,7 +67,6 @@
  *		2 of the License, or (at your option) any later version.
  */
 
-#include <linux/config.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/types.h>
diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index cb8a92f..1fbb384 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -31,7 +31,6 @@
  *              --  Josef Siemes <jsiemes@web.de>, Aug 2002
  */
 
-#include <linux/config.h>
 #include <linux/types.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
diff --git a/net/ipv4/netfilter/ip_conntrack_sip.c
b/net/ipv4/netfilter/ip_conntrack_sip.c
index fc87ce0..7d1548e 100644
--- a/net/ipv4/netfilter/ip_conntrack_sip.c
+++ b/net/ipv4/netfilter/ip_conntrack_sip.c
@@ -8,7 +8,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/skbuff.h>
diff --git a/net/ipv4/raw.c b/net/ipv4/raw.c
index bd221ec..337cd94 100644
--- a/net/ipv4/raw.c
+++ b/net/ipv4/raw.c
@@ -39,7 +39,6 @@
  *		2 of the License, or (at your option) any later version.
  */
  
-#include <linux/config.h> 
 #include <linux/types.h>
 #include <asm/atomic.h>
 #include <asm/byteorder.h>
diff --git a/net/ipv4/tcp_lp.c b/net/ipv4/tcp_lp.c
index 1f977b6..e8eb7a2 100644
--- a/net/ipv4/tcp_lp.c
+++ b/net/ipv4/tcp_lp.c
@@ -31,7 +31,6 @@
  * Version: $Id: tcp_lp.c,v 1.22 2006-05-02 18:18:19 hswong3i Exp $
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <net/tcp.h>
 
diff --git a/net/ipv4/tcp_veno.c b/net/ipv4/tcp_veno.c
index 11b42a7..5b2fe6d 100644
--- a/net/ipv4/tcp_veno.c
+++ b/net/ipv4/tcp_veno.c
@@ -9,7 +9,6 @@
  * 	See http://www.ntu.edu.sg/home5/ZHOU0022/papers/CPFu03a.pdf
  */
 
-#include <linux/config.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/skbuff.h>
diff --git a/sound/aoa/soundbus/sysfs.c b/sound/aoa/soundbus/sysfs.c
index d31f814..f580942 100644
--- a/sound/aoa/soundbus/sysfs.c
+++ b/sound/aoa/soundbus/sysfs.c
@@ -1,4 +1,3 @@
-#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/stat.h>
 /* FIX UP */
diff --git a/sound/core/memory.c b/sound/core/memory.c
index fe59850..93537ab 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -20,7 +20,6 @@
  *
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
diff --git a/sound/oss/ac97_plugin_ad1980.c b/sound/oss/ac97_plugin_ad1980.c
index 24a9acd..0435c43 100644
--- a/sound/oss/ac97_plugin_ad1980.c
+++ b/sound/oss/ac97_plugin_ad1980.c
@@ -28,7 +28,6 @@
 
 */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
diff --git a/sound/oss/awe_wave.c b/sound/oss/awe_wave.c
index d1a0eb2..2ad9dc4 100644
--- a/sound/oss/awe_wave.c
+++ b/sound/oss/awe_wave.c
@@ -28,7 +28,6 @@
  */
 
 #include <linux/awe_voice.h>
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/string.h>
diff --git a/sound/oss/cmpci.c b/sound/oss/cmpci.c
index ea51aaf..20628aa 100644
--- a/sound/oss/cmpci.c
+++ b/sound/oss/cmpci.c
@@ -106,7 +106,6 @@
  */
 /*****************************************************************************/
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
diff --git a/sound/oss/forte.c b/sound/oss/forte.c
index ea1c020..fbc431a 100644
--- a/sound/oss/forte.c
+++ b/sound/oss/forte.c
@@ -27,7 +27,6 @@
  *
  */
  
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 
diff --git a/sound/oss/gus_card.c b/sound/oss/gus_card.c
index dbb2977..217913a 100644
--- a/sound/oss/gus_card.c
+++ b/sound/oss/gus_card.c
@@ -15,7 +15,6 @@
  */
       
  
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
diff --git a/sound/oss/gus_wave.c b/sound/oss/gus_wave.c
index 942d518..89dbf92 100644
--- a/sound/oss/gus_wave.c
+++ b/sound/oss/gus_wave.c
@@ -18,7 +18,6 @@
  */
  
 #include <linux/init.h> 
-#include <linux/config.h>
 #include <linux/spinlock.h>
 
 #define GUSPNP_AUTODETECT
diff --git a/sound/oss/mad16.c b/sound/oss/mad16.c
index aa3c50d..954647f 100644
--- a/sound/oss/mad16.c
+++ b/sound/oss/mad16.c
@@ -39,7 +39,6 @@
  *	Pavel Rabel		Clean up                           Nov-2000
  */
 
-#include <linux/config.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/gameport.h>
diff --git a/sound/oss/maestro3.c b/sound/oss/maestro3.c
index 5548e3c..5ef6e61 100644
--- a/sound/oss/maestro3.c
+++ b/sound/oss/maestro3.c
@@ -124,7 +124,6 @@
 
 /*****************************************************************************/
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
diff --git a/sound/oss/maui.c b/sound/oss/maui.c
index 05cf194..ee95014 100644
--- a/sound/oss/maui.c
+++ b/sound/oss/maui.c
@@ -25,7 +25,6 @@
  */
 
 #include <linux/interrupt.h>
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 
diff --git a/sound/oss/wavfront.c b/sound/oss/wavfront.c
index 1dec395..72c8d60 100644
--- a/sound/oss/wavfront.c
+++ b/sound/oss/wavfront.c
@@ -79,7 +79,6 @@ #include <linux/syscalls.h>
 #include <linux/ioport.h>    
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
-#include <linux/config.h>
 
 #include <linux/delay.h>
 
diff --git a/sound/oss/ymfpci.c b/sound/oss/ymfpci.c
index 6e22472..4c89af9 100644
--- a/sound/oss/ymfpci.c
+++ b/sound/oss/ymfpci.c
@@ -51,7 +51,6 @@
  * is entirely harmless.
  */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/sound/oss/ymfpci.h b/sound/oss/ymfpci.h
index ac1785f..ef2806d 100644
--- a/sound/oss/ymfpci.h
+++ b/sound/oss/ymfpci.h
@@ -21,7 +21,7 @@ #define __YMFPCI_H
  *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  *
  */
-#include <linux/config.h>
+
 #include <linux/mutex.h>
 
 /*

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
