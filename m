From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Tue, 02 Mar 2004 06:20:31 +0000
Subject: [Kernel-janitors] [PATCH] Various Documentation/ related updates.
Message-Id: <E1Ay3GZ-000HJK-00.adobriyan-mail-ru@f25.mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove the rest of references to smp.tex
Documentation/cpufreq => Documentation/cpu-freq
DocBook/tulip.{pdf,ps,html} => DocBook/tulip-user.{pdf,ps,html}
Bunch of other typos.

diff -urN a/Documentation/computone.txt b/Documentation/computone.txt
--- a/Documentation/computone.txt	2004-02-28 01:21:26.000000000 +0300
+++ b/Documentation/computone.txt	2004-03-02 08:18:16.000000000 +0300
@@ -261,7 +261,7 @@
 management of symbolic links from the devfs name space to the conventional
 names.  More details on devfs can be found on the DEVFS home site at
 <http://www.atnf.csiro.au/~rgooch/linux/> or in the file kernel
-documentation files, .../linux/Documentation/filesystems/devfs/REAME.
+documentation files, .../linux/Documentation/filesystems/devfs/README.
 
 If you are using devfs, existing devices are automatically created within
 the devfs name space.  Normal devices will be tts/F0 - tts/F255 and callout
diff -urN a/Documentation/networking/bonding.txt b/Documentation/networking/bonding.txt
--- a/Documentation/networking/bonding.txt	2004-02-28 01:20:58.000000000 +0300
+++ b/Documentation/networking/bonding.txt	2004-03-02 08:22:32.000000000 +0300
@@ -55,8 +55,9 @@
 --------------------------------------
 This version of the bonding driver requires updated ifenslave program. The
 original one from extreme-linux and beowulf will not work. Kernels 2.4.12
-and above include the updated version of ifenslave.c in Documentation/network
-directory. For older kernels, please follow the links at the end of this file.
+and above include the updated version of ifenslave.c in
+Documentation/networking directory. For older kernels, please follow the
+links at the end of this file.
 
 IMPORTANT!!!  If you are running on Redhat 7.1 or greater, you need
 to be careful because /usr/include/linux is no longer a symbolic link
diff -urN a/arch/alpha/Kconfig b/arch/alpha/Kconfig
--- a/arch/alpha/Kconfig	2004-02-28 01:21:26.000000000 +0300
+++ b/arch/alpha/Kconfig	2004-03-02 08:03:40.000000000 +0300
@@ -495,8 +495,8 @@
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/i386/IO-APIC.txt>,
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/i386/IO-APIC.txt>,
 	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
 	  <http://www.tldp.org/docs.html#howto>.
 
diff -urN a/arch/arm/Kconfig b/arch/arm/Kconfig
--- a/arch/arm/Kconfig	2004-02-28 01:21:02.000000000 +0300
+++ b/arch/arm/Kconfig	2004-03-02 08:04:56.000000000 +0300
@@ -351,7 +351,7 @@
 	help
 	  This enables the CPUfreq driver for ARM Integrator CPUs.
 
-	  For details, take a look at linux/Documentation/cpufreq.
+	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say Y.
 
diff -urN a/arch/i386/Kconfig b/arch/i386/Kconfig
--- a/arch/i386/Kconfig	2004-02-28 01:20:58.000000000 +0300
+++ b/arch/i386/Kconfig	2004-03-02 08:11:28.000000000 +0300
@@ -457,8 +457,8 @@
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/i386/IO-APIC.txt>,
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/i386/IO-APIC.txt>,
 	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
 	  <http://www.tldp.org/docs.html#howto>.
 
diff -urN a/arch/mips/Kconfig b/arch/mips/Kconfig
--- a/arch/mips/Kconfig	2004-02-28 01:21:02.000000000 +0300
+++ b/arch/mips/Kconfig	2004-03-02 08:12:42.000000000 +0300
@@ -1209,9 +1209,8 @@
 	  People using multiprocessor machines who say Y here should also say
 	  Y to "Enhanced Real Time Clock Support", below.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt> and the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  See also the <file:Documentation/smp.txt> and the SMP-HOWTO
+	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
diff -urN a/arch/parisc/Kconfig b/arch/parisc/Kconfig
--- a/arch/parisc/Kconfig	2004-02-28 01:21:14.000000000 +0300
+++ b/arch/parisc/Kconfig	2004-03-02 08:13:14.000000000 +0300
@@ -131,10 +131,9 @@
 	  singleprocessor machines. On a singleprocessor machine, the kernel
 	  will run faster if you say N here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/nmi_watchdog.txt>
-	  and the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available
+	  at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
diff -urN a/arch/ppc/Kconfig b/arch/ppc/Kconfig
--- a/arch/ppc/Kconfig	2004-02-28 01:21:30.000000000 +0300
+++ b/arch/ppc/Kconfig	2004-03-02 08:13:42.000000000 +0300
@@ -163,7 +163,7 @@
 	  fly. This is a nice method to save battery power on notebooks,
 	  because the lower the clock speed, the less power the CPU consumes.
 
-	  For more information, take a look at linux/Documentation/cpufreq or
+	  For more information, take a look at linux/Documentation/cpu-freq or
 	  at <http://www.brodo.de/cpufreq/>
 
 	  If in doubt, say N.
diff -urN a/arch/s390/Kconfig b/arch/s390/Kconfig
--- a/arch/s390/Kconfig	2004-02-28 01:21:00.000000000 +0300
+++ b/arch/s390/Kconfig	2004-03-02 08:14:18.000000000 +0300
@@ -89,9 +89,8 @@
 	  singleprocessor machines. On a singleprocessor machine, the kernel
 	  will run faster if you say N here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt> and the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  See also the <file:Documentation/smp.txt> and the SMP-HOWTO
+	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  Even if you don't know what to do here, say Y.
 
diff -urN a/arch/sh/Kconfig b/arch/sh/Kconfig
--- a/arch/sh/Kconfig	2004-02-28 01:21:30.000000000 +0300
+++ b/arch/sh/Kconfig	2004-03-02 08:15:10.000000000 +0300
@@ -483,10 +483,9 @@
 	  People using multiprocessor machines who say Y here should also say
 	  Y to "Enhanced Real Time Clock Support", below.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/nmi_watchdog.txt>
-	  and the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available
+	  at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
@@ -522,7 +521,7 @@
 	  CPU clock scaling allows you to change the clock speed of the
 	  running CPU on the fly.
 
-	  For details, take a look at <file:Documentation/cpufreq>.
+	  For details, take a look at <file:Documentation/cpu-freq>.
 
 	  If unsure, say N.
 
@@ -543,7 +542,7 @@
 	  This adds the cpufreq driver for SuperH. At present, only
 	  the SH-4 is supported.
 
-	  For details, take a look at <file:Documentation/cpufreq>.
+	  For details, take a look at <file:Documentation/cpu-freq>.
 
 	  If unsure, say N.
 
diff -urN a/arch/sparc/Kconfig b/arch/sparc/Kconfig
--- a/arch/sparc/Kconfig	2004-02-28 01:20:54.000000000 +0300
+++ b/arch/sparc/Kconfig	2004-03-02 08:15:50.000000000 +0300
@@ -103,8 +103,8 @@
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/i386/IO-APIC.txt>,
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/i386/IO-APIC.txt>,
 	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
 	  <http://www.tldp.org/docs.html#howto>.
 
diff -urN a/arch/sparc64/Kconfig b/arch/sparc64/Kconfig
--- a/arch/sparc64/Kconfig	2004-02-28 01:21:28.000000000 +0300
+++ b/arch/sparc64/Kconfig	2004-03-02 08:16:34.000000000 +0300
@@ -107,8 +107,8 @@
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also the <file:Documentation/smp.tex>,
-	  <file:Documentation/smp.txt>, <file:Documentation/i386/IO-APIC.txt>,
+	  See also the <file:Documentation/smp.txt>,
+	  <file:Documentation/i386/IO-APIC.txt>,
 	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
 	  <http://www.tldp.org/docs.html#howto>.
 
@@ -139,7 +139,7 @@
 	  fly.  Currently there are only sparc64 drivers for UltraSPARC-III
 	  and UltraSPARC-IIe processors.
 
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say N.
 
@@ -159,7 +159,7 @@
 	help
 	  This adds the CPUFreq driver for UltraSPARC-III processors.
 
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say N.
 
@@ -169,7 +169,7 @@
 	help
 	  This adds the CPUFreq driver for UltraSPARC-IIe processors.
 
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say N.
 
diff -urN a/drivers/net/Kconfig b/drivers/net/Kconfig
--- a/drivers/net/Kconfig	2004-02-28 01:21:28.000000000 +0300
+++ b/drivers/net/Kconfig	2004-03-02 08:32:00.000000000 +0300
@@ -2050,8 +2050,8 @@
 	  
 	  If you want to compile this driver as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want),
-	  say M here and read Documentation/modules.txt. This is recommended.
-	  The module will be called sk98lin. This is recommended.
+	  say M here and read Documentation/kbuild/modules.txt. The module will
+	  be called sk98lin. This is recommended.
 
 config TIGON3
 	tristate "Broadcom Tigon3 support"
diff -urN a/drivers/net/tulip/21142.c b/drivers/net/tulip/21142.c
--- a/drivers/net/tulip/21142.c	2004-02-28 01:20:58.000000000 +0300
+++ b/drivers/net/tulip/21142.c	2004-03-02 08:34:16.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/eeprom.c b/drivers/net/tulip/eeprom.c
--- a/drivers/net/tulip/eeprom.c	2004-02-28 01:21:28.000000000 +0300
+++ b/drivers/net/tulip/eeprom.c	2004-03-02 08:34:42.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/interrupt.c b/drivers/net/tulip/interrupt.c
--- a/drivers/net/tulip/interrupt.c	2004-02-28 01:20:58.000000000 +0300
+++ b/drivers/net/tulip/interrupt.c	2004-03-02 08:34:56.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/media.c b/drivers/net/tulip/media.c
--- a/drivers/net/tulip/media.c	2004-02-28 01:20:58.000000000 +0300
+++ b/drivers/net/tulip/media.c	2004-03-02 08:35:16.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/pnic.c b/drivers/net/tulip/pnic.c
--- a/drivers/net/tulip/pnic.c	2004-02-28 01:21:22.000000000 +0300
+++ b/drivers/net/tulip/pnic.c	2004-03-02 08:35:26.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/pnic2.c b/drivers/net/tulip/pnic2.c
--- a/drivers/net/tulip/pnic2.c	2004-02-28 01:20:56.000000000 +0300
+++ b/drivers/net/tulip/pnic2.c	2004-03-02 08:35:36.000000000 +0300
@@ -9,7 +9,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/timer.c b/drivers/net/tulip/timer.c
--- a/drivers/net/tulip/timer.c	2004-02-28 01:20:54.000000000 +0300
+++ b/drivers/net/tulip/timer.c	2004-03-02 08:36:04.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/tulip.h b/drivers/net/tulip/tulip.h
--- a/drivers/net/tulip/tulip.h	2004-02-28 01:21:28.000000000 +0300
+++ b/drivers/net/tulip/tulip.h	2004-03-02 08:37:00.000000000 +0300
@@ -7,7 +7,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/net/tulip/tulip_core.c b/drivers/net/tulip/tulip_core.c
--- a/drivers/net/tulip/tulip_core.c	2004-02-28 01:21:02.000000000 +0300
+++ b/drivers/net/tulip/tulip_core.c	2004-03-02 08:36:18.000000000 +0300
@@ -8,7 +8,7 @@
 	This software may be used and distributed according to the terms
 	of the GNU General Public License, incorporated herein by reference.
 
-	Please refer to Documentation/DocBook/tulip.{pdf,ps,html}
+	Please refer to Documentation/DocBook/tulip-user.{pdf,ps,html}
 	for more information on this driver, or visit the project
 	Web page at http://sourceforge.net/projects/tulip/
 
diff -urN a/drivers/usb/media/Kconfig b/drivers/usb/media/Kconfig
--- a/drivers/usb/media/Kconfig	2004-02-28 01:20:56.000000000 +0300
+++ b/drivers/usb/media/Kconfig	2004-03-02 08:37:22.000000000 +0300
@@ -202,4 +202,4 @@
 	  This code is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want).
 	  The module will be called w9968cf.o. If you want to compile it as a
-	  module, say M here and read <file:Documentation/modules.txt>.
+	  module, say M here and read <file:Documentation/kbuild/modules.txt>.
diff -urN a/net/decnet/README b/net/decnet/README
--- a/net/decnet/README	2004-02-28 01:21:00.000000000 +0300
+++ b/net/decnet/README	2004-03-02 08:37:54.000000000 +0300
@@ -2,7 +2,7 @@
                       ===========
 
 The documentation for this kernel subsystem is available in the
-Documentation/networking subdirctory of this distribution and also
+Documentation/networking subdirectory of this distribution and also
 on line at http://www.chygwyn.com/DECnet/
 
 Steve Whitehouse <SteveW@ACM.org>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
