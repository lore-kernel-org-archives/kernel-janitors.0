From: Matthew Wilcox <willy@debian.org>
Date: Wed, 14 Jan 2004 06:57:42 +0000
Subject: [Kernel-janitors] Kconfig cleanups
Message-Id: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


It's not clear to me whether this works better split up into many smaller
patches or not.  I'm happy to do that if people feel it's worthwhile.

This patch attempts to reduce the number of inappropriate questions being
asked by menuconfig.

Index: arch/arm26/Kconfig
=================================RCS file: /var/cvs/linux-2.6/arch/arm26/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- arch/arm26/Kconfig	28 Sep 2003 04:04:42 -0000	1.4
+++ arch/arm26/Kconfig	14 Jan 2004 06:44:44 -0000
@@ -216,11 +216,6 @@ source "drivers/input/Kconfig"
 
 source "drivers/char/Kconfig"
 
-config KBDMOUSE
-	bool
-	depends on ARCH_ACORN && BUSMOUSE=y
-	default y
-
 source "drivers/media/Kconfig"
 
 source "fs/Kconfig"
Index: drivers/block/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/block/Kconfig,v
retrieving revision 1.5
diff -u -p -r1.5 Kconfig
--- drivers/block/Kconfig	18 Oct 2003 00:23:04 -0000	1.5
+++ drivers/block/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -6,7 +6,7 @@ menu "Block devices"
 
 config BLK_DEV_FD
 	tristate "Normal floppy disk support"
-	depends on !X86_PC9800 && !ARCH_S390
+	depends on !X86_PC9800 && !ARCH_S390 && !AMIGA && !ATARI && !IA64
 	---help---
 	  If you want to use the floppy disk drive(s) of your PC under Linux,
 	  say Y. Information about this driver, especially important for IBM
Index: drivers/char/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/char/Kconfig,v
retrieving revision 1.8
diff -u -p -r1.8 Kconfig
--- drivers/char/Kconfig	26 Oct 2003 15:16:50 -0000	1.8
+++ drivers/char/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -595,6 +595,7 @@ menu "Mice"
 
 config BUSMOUSE
 	tristate "Bus Mouse Support"
+	depends ARM26
 	---help---
 	  Say Y here if your machine has a bus mouse as opposed to a serial
 	  mouse. Most people have a regular serial MouseSystem or
@@ -612,10 +613,15 @@ config BUSMOUSE
 	  To compile this driver as a module, choose M here: the
 	  module will be called busmouse.
 
+config KBDMOUSE
+	def_bool y
+	depends on ARM26 && ARCH_ACORN && BUSMOUSE
+
 endmenu
 
 config QIC02_TAPE
 	tristate "QIC-02 tape support"
+	depends ISA
 	help
 	  If you have a non-SCSI tape drive like that, say Y.
 
Index: drivers/char/agp/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/char/agp/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- drivers/char/agp/Kconfig	28 Sep 2003 04:05:17 -0000	1.4
+++ drivers/char/agp/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -1,5 +1,6 @@
 config AGP
 	tristate "/dev/agpgart (AGP Support)" if !GART_IOMMU
+	depends on PCI
 	default y if GART_IOMMU
 	---help---
 	  AGP (Accelerated Graphics Port) is a bus system mainly used to
Index: drivers/char/drm/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/char/drm/Kconfig,v
retrieving revision 1.3
diff -u -p -r1.3 Kconfig
--- drivers/char/drm/Kconfig	28 Sep 2003 04:05:17 -0000	1.3
+++ drivers/char/drm/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -6,6 +6,7 @@
 #
 config DRM
 	bool "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
+	depends on PCI
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
@@ -17,21 +18,21 @@ config DRM
 
 config DRM_TDFX
 	tristate "3dfx Banshee/Voodoo3+"
-	depends on DRM
+	depends on DRM && PCI
 	help
 	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
 	  graphics card.  If M is selected, the module will be called tdfx.
 
 config DRM_GAMMA
 	tristate "3dlabs GMX 2000"
-	depends on DRM
+	depends on DRM && PCI
 	help
 	  This is the old gamma driver, please tell me if it might actually
 	  work.
 
 config DRM_R128
 	tristate "ATI Rage 128"
-	depends on DRM
+	depends on DRM && PCI
 	help
 	  Choose this option if you have an ATI Rage 128 graphics card.  If M
 	  is selected, the module will be called r128.  AGP support for
@@ -39,7 +40,7 @@ config DRM_R128
 
 config DRM_RADEON
 	tristate "ATI Radeon"
-	depends on DRM
+	depends on DRM && PCI
 	help
 	  Choose this option if you have an ATI Radeon graphics card.  There
 	  are both PCI and AGP versions.  You don't need to choose this to
@@ -77,7 +78,7 @@ config DRM_SIS
 	tristate "SiS video cards"
 	depends on DRM && AGP
 	help
-	  Choose this option if you have a SiS 630 or compatibel video 
+	  Choose this option if you have a SiS 630 or compatible video 
           chipset. If M is selected the module will be called sis. AGP
           support is required for this driver to work.
 
Index: drivers/char/ipmi/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/char/ipmi/Kconfig,v
retrieving revision 1.2
diff -u -p -r1.2 Kconfig
--- drivers/char/ipmi/Kconfig	18 Oct 2003 00:23:06 -0000	1.2
+++ drivers/char/ipmi/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -3,6 +3,8 @@
 #
 
 menu "IPMI"
+	depends on X86 || IA64
+
 config IPMI_HANDLER
        tristate 'IPMI top-level message handler'
        help
Index: drivers/i2c/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/i2c/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- drivers/i2c/Kconfig	28 Sep 2003 04:05:21 -0000	1.4
+++ drivers/i2c/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -37,9 +37,9 @@ config I2C_CHARDEV
 	  This support is also available as a module.  If so, the module 
 	  will be called i2c-dev.
 
-	source drivers/i2c/algos/Kconfig
-	source drivers/i2c/busses/Kconfig
-	source drivers/i2c/chips/Kconfig
+source drivers/i2c/algos/Kconfig
+source drivers/i2c/busses/Kconfig
+source drivers/i2c/chips/Kconfig
 
 endmenu
 
Index: drivers/i2c/algos/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/i2c/algos/Kconfig,v
retrieving revision 1.2
diff -u -p -r1.2 Kconfig
--- drivers/i2c/algos/Kconfig	28 Sep 2003 04:05:21 -0000	1.2
+++ drivers/i2c/algos/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -3,6 +3,7 @@
 #
 
 menu "I2C Algorithms"
+	depends on I2C
 
 config I2C_ALGOBIT
 	tristate "I2C bit-banging interfaces"
Index: drivers/i2c/busses/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/i2c/busses/Kconfig,v
retrieving revision 1.6
diff -u -p -r1.6 Kconfig
--- drivers/i2c/busses/Kconfig	7 Jan 2004 21:30:18 -0000	1.6
+++ drivers/i2c/busses/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -3,6 +3,7 @@
 #
 
 menu "I2C Hardware Bus support"
+	depends on I2C
 
 config I2C_ALI1535
 	tristate "ALI 1535"
Index: drivers/i2c/chips/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/i2c/chips/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- drivers/i2c/chips/Kconfig	7 Jan 2004 21:30:18 -0000	1.4
+++ drivers/i2c/chips/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -3,6 +3,7 @@
 #
 
 menu "I2C Hardware Sensors Chip support"
+	depends on I2C
 
 config I2C_SENSOR
 	tristate
Index: drivers/media/dvb/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/media/dvb/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- drivers/media/dvb/Kconfig	7 Jan 2004 21:30:22 -0000	1.4
+++ drivers/media/dvb/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -3,6 +3,7 @@
 #
 
 menu "Digital Video Broadcasting Devices"
+	depends on PCI || USB
 
 config DVB
 	bool "DVB For Linux"
Index: drivers/message/fusion/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/message/fusion/Kconfig,v
retrieving revision 1.2
diff -u -p -r1.2 Kconfig
--- drivers/message/fusion/Kconfig	28 Sep 2003 04:05:32 -0000	1.2
+++ drivers/message/fusion/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -1,5 +1,6 @@
 
 menu "Fusion MPT device support"
+	depends on PCI
 
 config FUSION
 	tristate "Fusion MPT (base + ScsiHost) drivers"
Index: drivers/message/i2o/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/message/i2o/Kconfig,v
retrieving revision 1.2
diff -u -p -r1.2 Kconfig
--- drivers/message/i2o/Kconfig	28 Sep 2003 04:05:33 -0000	1.2
+++ drivers/message/i2o/Kconfig	14 Jan 2004 06:44:45 -0000
@@ -1,9 +1,9 @@
 
 menu "I2O device support"
+	depends on PCI
 
 config I2O
 	tristate "I2O support"
-	depends on PCI
 	---help---
 	  The Intelligent Input/Output (I2O) architecture allows hardware
 	  drivers to be split into two parts: an operating system specific
Index: drivers/parport/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/parport/Kconfig,v
retrieving revision 1.3
diff -u -p -r1.3 Kconfig
--- drivers/parport/Kconfig	28 Sep 2003 04:05:43 -0000	1.3
+++ drivers/parport/Kconfig	14 Jan 2004 06:44:46 -0000
@@ -34,27 +34,21 @@ config PARPORT
 
 config PARPORT_PC
 	tristate "PC-style hardware"
-	depends on PARPORT && (!SPARC64 || PCI)
+	depends on PARPORT && (!SPARC64 || PCI) && (!PARISC || SUPERIO) && (!M68K || Q40)
 	---help---
 	  You should say Y here if you have a PC-style parallel port. All
 	  IBM PC compatible computers and some Alphas have PC-style
 	  parallel ports.  PA-RISC owners should only say Y here if they
-	  have a SuperIO parallel port.
+	  have a SuperIO parallel port.  Q40 owners should say Y here.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called parport_pc.
 
 	  If unsure, say Y.
 
-config PARPORT_PC_CML1
-	tristate
-	depends on PARPORT!=n && PARPORT_PC!=n
-	default PARPORT_PC if SERIAL_8250=y
-	default m if SERIAL_8250=m
-
 config PARPORT_SERIAL
 	tristate "Multi-IO cards (parallel and serial)"
-	depends on SERIAL_8250!=n && PARPORT_PC_CML1
+	depends on SERIAL_8250 && PARPORT_PC
 	help
 	  This adds support for multi-IO PCI cards that have parallel and
 	  serial ports.  You should say Y or M here.  If you say M, the module
Index: drivers/pnp/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/pnp/Kconfig,v
retrieving revision 1.2
diff -u -p -r1.2 Kconfig
--- drivers/pnp/Kconfig	12 Aug 2003 19:11:11 -0000	1.2
+++ drivers/pnp/Kconfig	14 Jan 2004 06:44:46 -0000
@@ -3,6 +3,7 @@
 #
 
 menu "Plug and Play support"
+	depends X86 || ISA
 
 config PNP
 	bool "Plug and Play support"
@@ -32,7 +33,7 @@ comment "Protocols"
 
 config ISAPNP
 	bool "ISA Plug and Play support (EXPERIMENTAL)"
-	depends on PNP && EXPERIMENTAL
+	depends on ISA && PNP && EXPERIMENTAL
 	help
 	  Say Y here if you would like support for ISA Plug and Play devices.
 	  Some information is in <file:Documentation/isapnp.txt>.
@@ -41,7 +42,7 @@ config ISAPNP
 
 config PNPBIOS
 	bool "Plug and Play BIOS support (EXPERIMENTAL)"
-	depends on PNP && EXPERIMENTAL
+	depends on X86 && PNP && EXPERIMENTAL
 	---help---
 	  Linux uses the PNPBIOS as defined in "Plug and Play BIOS
 	  Specification Version 1.0A May 5, 1994" to autodetect built-in
Index: drivers/telephony/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/telephony/Kconfig,v
retrieving revision 1.3
diff -u -p -r1.3 Kconfig
--- drivers/telephony/Kconfig	28 Sep 2003 04:05:53 -0000	1.3
+++ drivers/telephony/Kconfig	14 Jan 2004 06:44:46 -0000
@@ -6,6 +6,7 @@ menu "Telephony Support"
 
 config PHONE
 	tristate "Linux telephony support"
+	depends on PCI || ISA || PCMCIA
 	---help---
 	  Say Y here if you have a telephony card, which for example allows
 	  you to use a regular phone for voice-over-IP applications.
@@ -18,7 +19,7 @@ config PHONE
 
 config PHONE_IXJ
 	tristate "QuickNet Internet LineJack/PhoneJack support"
-	depends on PHONE
+	depends on PHONE && (PCI || ISA)
 	---help---
 	  Say M if you have a telephony card manufactured by Quicknet
 	  Technologies, Inc.  These include the Internet PhoneJACK and
Index: drivers/video/console/Kconfig
=================================RCS file: /var/cvs/linux-2.6/drivers/video/console/Kconfig,v
retrieving revision 1.4
diff -u -p -r1.4 Kconfig
--- drivers/video/console/Kconfig	24 Nov 2003 03:16:20 -0000	1.4
+++ drivers/video/console/Kconfig	14 Jan 2004 06:44:46 -0000
@@ -44,6 +44,7 @@ config VIDEO_SELECT
 
 config MDA_CONSOLE
 	tristate "MDA text console (dual-headed) (EXPERIMENTAL)"
+	depends on X86
 	---help---
 	  Say Y here if you have an old MDA or monochrome Hercules graphics
 	  adapter in your system acting as a second head ( = video card). You

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
