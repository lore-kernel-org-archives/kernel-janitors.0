From: Matthew Wilcox <willy@debian.org>
Date: Wed, 04 Feb 2004 16:33:38 +0000
Subject: [Kernel-janitors] [PATCH] Make watchdogs depend on their hardware
Message-Id: <20040204163338.GY18725@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Wim

In order to make the watchdog menu useful for some architectures, we need
to only be able to select the watchdogs that can compile.  This patch also
moves the SuperH watchdog from its own Kconfig file to the normal one.

Index: drivers/char/watchdog/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/char/watchdog/Kconfig,v
retrieving revision 1.5
diff -u -p -r1.5 Kconfig
--- a/drivers/char/watchdog/Kconfig	7 Jan 2004 21:30:17 -0000	1.5
+++ b/drivers/char/watchdog/Kconfig	4 Feb 2004 16:22:38 -0000
@@ -51,7 +51,7 @@ config SOFT_WATCHDOG
 
 config WDT
 	tristate "WDT Watchdog timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && ISA
 	---help---
 	  If you have a WDT500P or WDT501P watchdog board, say Y here,
 	  otherwise N. It is not possible to probe for this board, which means
@@ -83,7 +83,7 @@ config WDT_501_FAN
 
 config WDTPCI
 	tristate "WDT PCI Watchdog timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && PCI
 	---help---
 	  If you have a PCI WDT500/501 watchdog board, say Y here, otherwise
 	  N.  It is not possible to probe for this board, which means that you
@@ -108,7 +108,7 @@ config WDT_501_PCI
 
 config PCWATCHDOG
 	tristate "Berkshire Products PC Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && ISA
 	---help---
 	  This is the driver for the Berkshire Products PC Watchdog card.
 	  This card simply watches your kernel to make sure it doesn't freeze,
@@ -124,7 +124,7 @@ config PCWATCHDOG
 
 config ACQUIRE_WDT
 	tristate "Acquire SBC Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  This is the driver for the hardware watchdog on the PSC-6x86 Single
 	  Board Computer produced by Acquire Inc (and others).  This watchdog
@@ -139,7 +139,7 @@ config ACQUIRE_WDT
 
 config ADVANTECH_WDT
 	tristate "Advantech SBC Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  If you are configuring a Linux kernel for the Advantech single-board
 	  computer, say `Y' here to support its built-in watchdog timer
@@ -182,7 +182,7 @@ config SA1100_WATCHDOG
 
 config EUROTECH_WDT
 	tristate "Eurotech CPU-1220/1410 Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  Enable support for the watchdog timer on the Eurotech CPU-1220 and
 	  CPU-1410 cards.  These are PC/104 SBCs. Spec sheets and product
@@ -190,7 +190,7 @@ config EUROTECH_WDT
 
 config IB700_WDT
 	tristate "IB700 SBC Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  This is the driver for the hardware watchdog on the IB700 Single
 	  Board Computer produced by TMC Technology (www.tmc-uk.com). This watchdog
@@ -206,7 +206,7 @@ config IB700_WDT
 
 config I810_TCO
 	tristate "Intel i8xx TCO timer / Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  Hardware driver for the TCO timer built into the Intel i8xx
 	  chipset family.  The TCO (Total Cost of Ownership) timer is a
@@ -226,7 +226,7 @@ config I810_TCO
 
 config MIXCOMWD
 	tristate "Mixcom Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && ISA
 	---help---
 	  This is a driver for the Mixcom hardware watchdog cards.  This
 	  watchdog simply watches your kernel to make sure it doesn't freeze,
@@ -240,7 +240,7 @@ config MIXCOMWD
 
 config SCx200_WDT
 	tristate "NatSemi SCx200 Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  Enable the built-in watchdog timer support on the National 
 	  Semiconductor SCx200 processors.
@@ -249,7 +249,7 @@ config SCx200_WDT
 
 config 60XX_WDT
 	tristate "SBC-60XX Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This driver can be used with the watchdog timer found on some
 	  single board computers, namely the 6010 PII based computer.
@@ -263,7 +263,7 @@ config 60XX_WDT
 
 config W83877F_WDT
 	tristate "W83877F (EMACS) Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  This is the driver for the hardware watchdog on the W83877F chipset
 	  as used in EMACS PC-104 motherboards (and likely others).  This
@@ -278,7 +278,7 @@ config W83877F_WDT
 
 config W83627HF_WDT
 	tristate "W83627HF Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  This is the driver for the hardware watchdog on the W83627HF chipset
 	  as used in Advantech PC-9578 and Tyan S2721-533 motherboards
@@ -293,7 +293,7 @@ config W83627HF_WDT
 
 config MACHZ_WDT
 	tristate "ZF MachZ Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  If you are using a ZF Micro MachZ processor, say Y here, otherwise
 	  N.  This is the driver for the watchdog timer builtin on that
@@ -306,7 +306,7 @@ config MACHZ_WDT
 
 config SC520_WDT
 	tristate "AMD Elan SC520 processor Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This is the driver for the hardware watchdog built in to the
 	  AMD "Elan" SC520 microcomputer commonly used in embedded systems.
@@ -319,7 +319,7 @@ config SC520_WDT
 
 config AMD7XX_TCO
 	tristate "AMD 766/768 TCO Timer/Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This is the driver for the hardware watchdog built in to the
 	  AMD 766/768 chipsets.
@@ -332,7 +332,7 @@ config AMD7XX_TCO
 
 config ALIM7101_WDT
 	tristate "ALi M7101 PMU Computer Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This is the driver for the hardware watchdog on the ALi M7101 PMU
 	  as used in the x86 Cobalt servers.
@@ -344,7 +344,7 @@ config ALIM7101_WDT
 
 config ALIM1535_WDT
 	tristate "ALi M1535 PMU Watchdog Timer"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86 && PCI
 	---help---
 	  This is the driver for the hardware watchdog on the ALi M1535 PMU.
 
@@ -355,7 +355,7 @@ config ALIM1535_WDT
 
 config SC1200_WDT
 	tristate "National Semiconductor PC87307/PC97307 (ala SC1200) Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This is a driver for National Semiconductor PC87307/PC97307 hardware
 	  watchdog cards as found on the SC1200. This watchdog is mainly used
@@ -369,7 +369,7 @@ config SC1200_WDT
 
 config WAFER_WDT
 	tristate "ICP Wafer 5823 Single Board Computer Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	help
 	  This is a driver for the hardware watchdog on the ICP Wafer 5823
 	  Single Board Computer (and probably other similar models).
@@ -379,10 +379,27 @@ config WAFER_WDT
 
 config CPU5_WDT
 	tristate "SMA CPU5 Watchdog"
-	depends on WATCHDOG
+	depends on WATCHDOG && X86
 	---help---
 	  TBD.
 	  To compile this driver as a module, choose M here: the
 	  module will be called cpu5wdt.
+
+config SH_WDT
+	tristate "SuperH Watchdog"
+	depends on WATCHDOG && SUPERH
+	help
+	  This driver adds watchdog support for the integrated watchdog in the
+	  SuperH processors. If you have one of these processors and wish
+	  to have watchdog support enabled, say Y, otherwise say N.
+
+	  As a side note, saying Y here will automatically boost HZ to 1000
+	  so that the timer has a chance to clear the overflow counter. On
+	  slower systems (such as the SH-2 and SH-3) this will likely yield
+	  some performance issues. As such, the WDT should be avoided here
+	  unless it is absolutely necessary.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called shwdt.
 
 endmenu
Index: arch/sh/Kconfig
=================================RCS file: /var/cvs/linux-2.6/arch/sh/Kconfig,v
retrieving revision 1.6
diff -u -p -r1.6 Kconfig
--- a/arch/sh/Kconfig	27 Jan 2004 18:44:40 -0000	1.6
+++ b/arch/sh/Kconfig	4 Feb 2004 16:22:50 -0000
@@ -941,60 +945,8 @@ config PSMOUSE
 	  the "mconv2" utility from <ftp://ibiblio.org/pub/Linux/system/mouse/>.
 
 
-menu "Watchdog Cards"
+source "drivers/char/watchdog/Kconfig"
 
-config WATCHDOG
-	bool "Watchdog Timer Support"
-	---help---
-	  If you say Y here (and to one of the following options) and create a
-	  character special file /dev/watchdog with major number 10 and minor
-	  number 130 using mknod ("man mknod"), you will get a watchdog, i.e.:
-	  subsequently opening the file and then failing to write to it for
-	  longer than 1 minute will result in rebooting the machine. This
-	  could be useful for a networked machine that needs to come back
-	  online as fast as possible after a lock-up. There's both a watchdog
-	  implementation entirely in software (which can sometimes fail to
-	  reboot the machine) and a driver for hardware watchdog boards, which
-	  are more robust and can also keep track of the temperature inside
-	  your computer. For details, read <file:Documentation/watchdog/watchdog.txt>
-	  in the kernel source.
-
-	  The watchdog is usually used together with the watchdog daemon
-	  which is available from
-	  <ftp://ibiblio.org/pub/Linux/system/daemons/watchdog/>. This daemon can
-	  also monitor NFS connections and can reboot the machine when the process
-	  table is full.
-
-	  If unsure, say N.
-
-config WATCHDOG_NOWAYOUT
-	bool "Disable watchdog shutdown on close"
-	depends on WATCHDOG
-	help
-	  The default watchdog behaviour (which you get if you say N here) is
-	  to stop the timer if the process managing it closes the file
-	  /dev/watchdog. It's always remotely possible that this process might
-	  get killed. If you say Y here, the watchdog cannot be stopped once
-	  it has been started.
-
-config SH_WDT
-	tristate "SuperH Watchdog"
-	depends on WATCHDOG
-	help
-	  This driver adds watchdog support for the integrated watchdog in the
-	  SuperH processors. If you have one of these processors and wish
-	  to have watchdog support enabled, say Y, otherwise say N.
-
-	  As a side note, saying Y here will automatically boost HZ to 1000
-	  so that the timer has a chance to clear the overflow counter. On
-	  slower systems (such as the SH-2 and SH-3) this will likely yield
-	  some performance issues. As such, the WDT should be avoided here
-	  unless it is absolutely necessary.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called shwdt.
-
-endmenu
 
 config RTC
 	tristate "Enhanced Real Time Clock Support"

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
