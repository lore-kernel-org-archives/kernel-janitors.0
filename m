From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Mon, 23 Feb 2004 03:27:00 +0000
Subject: [Kernel-janitors] [PATCH] Documentation/00-INDEX update.
Message-Id: <E1Av6kG-0007J7-00.adobriyan-mail-ru@f13.mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Mostly added descriptions of files in Documentation/ that were not listed in Documentation/00-INDEX.

Alexey

--- a/Documentation/00-INDEX	2004-02-18 06:57:20.000000000 +0300
+++ b/Documentation/00-INDEX	2004-02-23 06:03:32.000000000 +0300
@@ -1,7 +1,7 @@
 
 This is a brief list of all the files in ./linux/Documentation and what
-they contain. If you add a documentation file, please list it here in 
-alphabetical order as well, or risk being hunted down like a rabid dog. 
+they contain. If you add a documentation file, please list it here in
+alphabetical order as well, or risk being hunted down like a rabid dog.
 Please try and keep the descriptions small enough to fit on one line.
 							 Thanks -- Paul G.
 
@@ -26,10 +26,14 @@
 	- directory with DocBook templates etc. for kernel documentation.
 IO-mapping.txt
 	- how to access I/O mapped memory from within device drivers.
+IPMI.txt
+	- info on Linux Intelligent Platform Management Interface (IPMI) Driver.
 IRQ-affinity.txt
 	- how to select which CPU(s) handle which interrupt events on SMP.
+MSI-HOWTO.txt
+	- the Message Signaled Interrupts (MSI) Driver Guide HOWTO and FAQ.
 README.DAC960
-	- info on Mylex DAC960/DAC1100 PCI RAID Controller Driver for Linux
+	- info on Mylex DAC960/DAC1100 PCI RAID Controller Driver for Linux.
 README.moxa
 	- release notes for Moxa mutiport serial card.
 SAK.txt
@@ -42,6 +46,10 @@
 	- how to change your VGA cursor from a blinking underscore.
 arm/
 	- directory with info about Linux on the ARM architecture.
+as-iosched.txt
+	- info on anticipatory IO scheduler.
+basic_profiling.txt
+	- basic instructions for those who wants to profile Linux kernel.
 binfmt_misc.txt
 	- info on the kernel support for extra binary formats.
 block/
@@ -53,25 +61,31 @@
 cdrom/
 	- directory with information on the CD-ROM drivers that Linux has.
 computone.txt
-	- info on Computone Intelliport II/Plus Multiport Serial Driver
+	- info on Computone Intelliport II/Plus Multiport Serial Driver.
 cpqarray.txt
 	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
 cpufreq/
-	- info on CPU frequency and voltage scaling
+	- info on CPU frequency and voltage scaling.
 cris/
 	- directory with info about Linux on CRIS architecture.
+debugging-modules.txt
+	- some notes on debugging modules after Linux 2.6.3.
 devices.txt
-	- plain ASCII listing of all the nodes in /dev/ with major minor #'s
+	- plain ASCII listing of all the nodes in /dev/ with major minor #'s.
 digiboard.txt
 	- info on the Digiboard PC/X{i,e,eve} multiport boards.
 digiepca.txt
 	- info on Digi Intl. {PC,PCI,EISA}Xx and Xem series cards.
 dnotify.txt
 	- info about directory notification in Linux.
-driver-model.txt
-	- info about Linux driver model.
+driver-model/
+	- directory with info about Linux driver model.
+dvb/
+	- info on Linux Digital Video Broadcast (DVB) subsystem.
 early-userspace/
 	- info about initramfs, klibc, and userspace early during boot.
+eisa.txt
+	- info on EISA bus support.
 exception.txt
 	- how Linux v2.2 handles exceptions without verify_area etc.
 fb/
@@ -81,47 +95,51 @@
 floppy.txt
 	- notes and driver options for the floppy disk driver.
 ftape.txt
-	- notes about the floppy tape device driver
+	- notes about the floppy tape device driver.
 hayes-esp.txt
 	- info on using the Hayes ESP serial driver.
 highuid.txt
 	- notes on the change from 16 bit to 32 bit user/group IDs.
+hw_random.txt
+	- info on Linux support for random number generator in i8xx chipsets.
 i2c/
-	- directory with info about the I2C bus/protocol (2 wire, kHz speed)
+	- directory with info about the I2C bus/protocol (2 wire, kHz speed).
 i386/
-	- directory with info about Linux on intel 32 bit architecture.
-i810_rng.txt
-	- info on Linux support for random number generator in i8xx chipsets.
+	- directory with info about Linux on Intel 32 bit architecture.
 ia64/
-	- directory with info about Linux on intel 64 bit architecture.
+	- directory with info about Linux on Intel 64 bit architecture.
 ide.txt
-	- important info for users of ATA devices (IDE/EIDE disks and CD-ROMS)
+	- important info for users of ATA devices (IDE/EIDE disks and CD-ROMS).
 initrd.txt
 	- how to use the RAM disk as an initial/temporary root filesystem.
 input/
 	- info on Linux input device support.
 ioctl-number.txt
 	- how to implement and register device/driver ioctl calls.
+iostats.txt
+	- info on I/O statistics Linux kernel provides.
 isapnp.txt
-	- info on Linux ISA Plug & Play support
+	- info on Linux ISA Plug & Play support.
 isdn/
 	- directory with info on the Linux ISDN support, and supported cards.
 java.txt
-	- info on the in-kernel binary support for Java(tm)
+	- info on the in-kernel binary support for Java(tm).
 kbuild/
-	- directory with info about the kernel build process
+	- directory with info about the kernel build process.
 kernel-doc-nano-HOWTO.txt
 	- mini HowTo on generation and location of kernel documentation files.
 kernel-docs.txt
 	- listing of various WWW + books that document kernel internals.
 kernel-parameters.txt
 	- summary listing of command line / boot prompt args for the kernel.
+kobject.txt
+	- info of the kobject infrastructure of the Linux kernel.
 ldm.txt
 	- a brief description of LDM (Windows Dynamic Disks).
 locks.txt
 	- info on file locking implementations, flock() vs. fcntl(), etc.
 logo.gif
-	- Full colour GIF image of Linux logo (penguin)
+	- Full colour GIF image of Linux logo (penguin).
 logo.txt
 	- Info on creator of above logo & site to get additional images from.
 m68k/
@@ -133,27 +151,27 @@
 mca.txt
 	- info on supporting Micro Channel Architecture (e.g. PS/2) systems.
 md.txt
-	- info on boot arguments for the multiple devices driver
+	- info on boot arguments for the multiple devices driver.
 memory.txt
 	- info on typical Linux memory problems.
 mips/
 	- directory with info about Linux on MIPS architecture.
 mkdev.cciss
-	- script to make /dev entries for SMART controllers (see cciss.txt)
+	- script to make /dev entries for SMART controllers (see cciss.txt).
 mkdev.ida
 	- script to make /dev entries for Intelligent Disk Array Controllers.
 moxa-smartio
 	- info on installing/using Moxa multiport serial driver.
 mtrr.txt
-	- how to use PPro Memory Type Range Registers to increase performance
+	- how to use PPro Memory Type Range Registers to increase performance.
 nbd.txt
 	- info on a TCP implementation of a network block device.
 networking/
 	- directory with info on various aspects of networking with Linux.
 nfsroot.txt
-	- short guide on setting up a diskless box with NFS root filesystem
+	- short guide on setting up a diskless box with NFS root filesystem.
 nmi_watchdog.txt
-	- info on NMI watchdog for SMP systems
+	- info on NMI watchdog for SMP systems.
 oops-tracing.txt
 	- how to decode those nasty internal kernel error dump messages.
 paride.txt
@@ -165,11 +183,11 @@
 parport-lowlevel.txt
 	- description and usage of the low level parallel port functions.
 pci.txt
-	- info on the PCI subsystem for device driver authors
-pcwd-watchdog.txt
-	- info and sample code for using with the PC Watchdog reset card.
+	- info on the PCI subsystem for device driver authors.
 pm.txt
 	- info on Linux power management support.
+pnp.txt
+	- Linux Plug and Play documentation.
 power/
 	- directory with info on Linux PCI power management.
 powerpc/
@@ -181,29 +199,31 @@
 riscom8.txt
 	- notes on using the RISCom/8 multi-port serial driver.
 rocket.txt
-	- info on installing/using the Comtrol RocketPort multiport serial driver
+	- info on installing/using the Comtrol RocketPort multiport serial driver.
+rpc-cache.txt
+	- introduction to the caching mechanisms in the sunrpc layer.
 rtc.txt
 	- notes on how to use the Real Time Clock (aka CMOS clock) driver.
 s390/
 	- directory with info on using Linux on the IBM S390.
-sh/
-	- directory with info on porting Linux to a new architecture.
+sched-design.txt
+	- goals, design and implementation of the Linux O(1) scheduler.
 scsi/
 	- directory with info on Linux scsi support.
 serial-console.txt
 	- how to set up Linux with a serial line console as the default.
 sgi-visws.txt
 	- short blurb on the SGI Visual Workstations.
+sh/
+	- directory with info on porting Linux to a new architecture.
 smart-config.txt
 	- description of the Smart Config makefile feature.
-smp.tex
-	- LaTeX document describing implementation of Multiprocessor Linux
 smp.txt
-	- a few more notes on symmetric multi-processing
+	- a few notes on symmetric multi-processing.
 sonypi.txt
 	- info on Linux Sony Programmable I/O Device support.
 sound/
-	- directory with info on sound card support
+	- directory with info on sound card support.
 sparc/
 	- directory with info on using Linux on Sparc architecture.
 specialix.txt
@@ -217,9 +237,9 @@
 sx.txt
 	- info on the Specialix SX/SI multiport serial driver.
 sysctl/
-	- directory with info on the /proc/sys/* files
+	- directory with info on the /proc/sys/* files.
 sysrq.txt
-	- info on the magic SysRq key
+	- info on the magic SysRq key.
 telephony/
 	- directory with info on telephony (e.g. voice over IP) support.
 unicode.txt
@@ -230,7 +250,7 @@
 	- directory with info regarding video/TV/radio cards and linux.
 vm/
 	- directory with info on the Linux vm code.
-watchdog.txt
+watchdog/
 	- how to auto-reboot Linux if it has "fallen and can't get up". ;-)
 x86_64/
 	- directory with info on Linux support for AMD x86-64 (Hammer) machines.
@@ -238,4 +258,3 @@
 	- XPM image of penguin logo (see logo.txt) sitting on an xterm.
 zorro.txt
 	- info on writing drivers for Zorro bus devices found on Amigas.
-

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
