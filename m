From: Don Mullis <dwm@meer.net>
Date: Mon, 25 Sep 2006 04:22:47 +0000
Subject: [KJ] [PATCH] Kconfig refactoring for indentation
Message-Id: <1159158168.2509.34.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Refactor Kconfig content for better indentation/nesting by menuconfig and 
xconfig.

Tested by rerunning `make xconfig` after changes and inspecting display.

Signed-off-by: Don Mullis <dwm@meer.net>

---
The claim is that this helps the user's understanding of options -- but
since options are reordered, experts on particular subsystems might
question this in some instances.


 drivers/infiniband/Kconfig    |    3 +
 drivers/net/wireless/Kconfig  |   72 +++++++++++++++++++++---------------------
 drivers/parport/Kconfig       |   44 ++++++++++++-------------
 drivers/pci/hotplug/Kconfig   |    3 +
 drivers/scsi/Kconfig          |   42 ++++++++++++------------
 drivers/serial/Kconfig        |   53 +++++++++++++++---------------
 drivers/video/console/Kconfig |   16 ++++-----
 lib/Kconfig.debug             |   57 ++++++++++++++++-----------------
 net/Kconfig                   |    9 ++---
 sound/core/Kconfig            |   28 ++++++++--------
 10 files changed, 164 insertions(+), 163 deletions(-)

Index: linux-2.6.18/lib/Kconfig.debug
=================================--- linux-2.6.18.orig/lib/Kconfig.debug
+++ linux-2.6.18/lib/Kconfig.debug
@@ -8,7 +8,6 @@ config PRINTK_TIME
 	  operations.  This is useful for identifying long delays
 	  in kernel startup.
 
-
 config MAGIC_SYSRQ
 	bool "Magic SysRq key"
 	depends on !UML
@@ -39,6 +38,34 @@ config UNUSED_SYMBOLS
 	  you really need it, and what the merge plan to the mainline kernel for
 	  your module is.
 
+config DEBUG_FS
+	bool "Debug Filesystem"
+	depends on SYSFS
+	help
+	  debugfs is a virtual file system that kernel developers use to put
+	  debugging files into.  Enable this option to be able to read and
+	  write to these files.
+
+	  If unsure, say N.
+
+config UNWIND_INFO
+	bool "Compile the kernel with frame unwind information"
+	depends on !IA64 && !PARISC
+	depends on !MODULES || !(MIPS || PPC || SUPERH || V850)
+	help
+	  If you say Y here the resulting kernel image will be slightly larger
+	  but not slower, and it will give very useful debugging information.
+	  If you don't debug the kernel, you can say N, but we may not be able
+	  to solve problems without frame unwind information or frame pointers.
+
+config STACK_UNWIND
+	bool "Stack unwind support"
+	depends on UNWIND_INFO
+	depends on X86
+	help
+	  This enables more precise stack traces, omitting all unrelated
+	  occurrences of pointers into kernel code from the dump.
+
 config DEBUG_KERNEL
 	bool "Kernel debugging"
 	help
@@ -294,16 +321,6 @@ config DEBUG_INFO
 
 	  If unsure, say N.
 
-config DEBUG_FS
-	bool "Debug Filesystem"
-	depends on SYSFS
-	help
-	  debugfs is a virtual file system that kernel developers use to put
-	  debugging files into.  Enable this option to be able to read and
-	  write to these files.
-
-	  If unsure, say N.
-
 config DEBUG_VM
 	bool "Debug VM"
 	depends on DEBUG_KERNEL
@@ -323,24 +340,6 @@ config FRAME_POINTER
 	  some architectures or if you use external debuggers.
 	  If you don't debug the kernel, you can say N.
 
-config UNWIND_INFO
-	bool "Compile the kernel with frame unwind information"
-	depends on !IA64 && !PARISC
-	depends on !MODULES || !(MIPS || PPC || SUPERH || V850)
-	help
-	  If you say Y here the resulting kernel image will be slightly larger
-	  but not slower, and it will give very useful debugging information.
-	  If you don't debug the kernel, you can say N, but we may not be able
-	  to solve problems without frame unwind information or frame pointers.
-
-config STACK_UNWIND
-	bool "Stack unwind support"
-	depends on UNWIND_INFO
-	depends on X86
-	help
-	  This enables more precise stack traces, omitting all unrelated
-	  occurrences of pointers into kernel code from the dump.
-
 config FORCED_INLINING
 	bool "Force gcc to inline functions marked 'inline'"
 	depends on DEBUG_KERNEL
Index: linux-2.6.18/drivers/pci/hotplug/Kconfig
=================================--- linux-2.6.18.orig/drivers/pci/hotplug/Kconfig
+++ linux-2.6.18/drivers/pci/hotplug/Kconfig
@@ -76,7 +76,8 @@ config HOTPLUG_PCI_IBM
 
 config HOTPLUG_PCI_ACPI
 	tristate "ACPI PCI Hotplug driver"
-	depends on (!ACPI_DOCK && ACPI && HOTPLUG_PCI) || (ACPI_DOCK && HOTPLUG_PCI)
+	depends on HOTPLUG_PCI
+	depends on (!ACPI_DOCK && ACPI) || (ACPI_DOCK)
 	help
 	  Say Y here if you have a system that supports PCI Hotplug using
 	  ACPI.
Index: linux-2.6.18/net/Kconfig
=================================--- linux-2.6.18.orig/net/Kconfig
+++ linux-2.6.18/net/Kconfig
@@ -36,7 +36,6 @@ config NETDEBUG
 
 source "net/packet/Kconfig"
 source "net/unix/Kconfig"
-source "net/xfrm/Kconfig"
 
 config INET
 	bool "TCP/IP networking"
@@ -66,6 +65,11 @@ source "net/ipv6/Kconfig"
 
 endif # if INET
 
+source "net/xfrm/Kconfig"
+source "net/dccp/Kconfig"
+source "net/sctp/Kconfig"
+source "net/tipc/Kconfig"
+
 config NETWORK_SECMARK
 	bool "Security Marking"
 	help
@@ -162,9 +166,6 @@ source "net/bridge/netfilter/Kconfig"
 
 endif
 
-source "net/dccp/Kconfig"
-source "net/sctp/Kconfig"
-source "net/tipc/Kconfig"
 source "net/atm/Kconfig"
 source "net/bridge/Kconfig"
 source "net/8021q/Kconfig"
Index: linux-2.6.18/drivers/net/wireless/Kconfig
=================================--- linux-2.6.18.orig/drivers/net/wireless/Kconfig
+++ linux-2.6.18/drivers/net/wireless/Kconfig
@@ -382,33 +382,6 @@ config PCI_HERMES
 	  common.  Some of the built-in wireless adaptors in laptops are of
 	  this variety.
 
-config ATMEL
-      tristate "Atmel at76c50x chipset  802.11b support"
-      depends on NET_RADIO && (PCI || PCMCIA)
-      select FW_LOADER
-      select CRC32
-       ---help---
-        A driver 802.11b wireless cards based on the Atmel fast-vnet
-        chips. This driver supports standard Linux wireless extensions. 
- 
-        Many  cards based on this chipset do not have flash memory
-        and need their firmware loaded at start-up. If yours is 
-        one of these, you will need to provide a firmware image
-        to be loaded into the card by the driver. The Atmel
-        firmware package can be downloaded from
-        <http://www.thekelleys.org.uk/atmel>
-
-config PCI_ATMEL
-      tristate "Atmel at76c506 PCI cards"
-      depends on ATMEL && PCI
-       ---help---
-        Enable support for PCI and mini-PCI cards containing the
-        Atmel at76c506 chip.
-
-# If Pcmcia is compiled in, offer Pcmcia cards...
-comment "Wireless 802.11b Pcmcia/Cardbus cards support"
-	depends on NET_RADIO && PCMCIA
-
 config PCMCIA_HERMES
 	tristate "Hermes PCMCIA card support"
 	depends on NET_RADIO && PCMCIA && HERMES
@@ -443,6 +416,42 @@ config PCMCIA_SPECTRUM
 	  for downloading Symbol firmware are available at
 	  <http://sourceforge.net/projects/orinoco/>
 
+config ATMEL
+      tristate "Atmel at76c50x chipset  802.11b support"
+      depends on NET_RADIO && (PCI || PCMCIA)
+      select FW_LOADER
+      select CRC32
+       ---help---
+        A driver 802.11b wireless cards based on the Atmel fast-vnet
+        chips. This driver supports standard Linux wireless extensions.
+
+        Many  cards based on this chipset do not have flash memory
+        and need their firmware loaded at start-up. If yours is
+        one of these, you will need to provide a firmware image
+        to be loaded into the card by the driver. The Atmel
+        firmware package can be downloaded from
+        <http://www.thekelleys.org.uk/atmel>
+
+config PCI_ATMEL
+      tristate "Atmel at76c506 PCI cards"
+      depends on ATMEL && PCI
+       ---help---
+        Enable support for PCI and mini-PCI cards containing the
+        Atmel at76c506 chip.
+
+config PCMCIA_ATMEL
+	tristate "Atmel at76c502/at76c504 PCMCIA cards"
+	depends on NET_RADIO && ATMEL && PCMCIA
+	select FW_LOADER
+	select CRC32
+	---help---
+	  Enable support for PCMCIA cards containing the
+	  Atmel at76c502 and at76c504 chips.
+
+# If Pcmcia is compiled in, offer Pcmcia cards...
+comment "Wireless 802.11b Pcmcia/Cardbus cards support"
+	depends on NET_RADIO && PCMCIA
+
 config AIRO_CS
 	tristate "Cisco/Aironet 34X/35X/4500/4800 PCMCIA cards"
 	depends on NET_RADIO && PCMCIA && (BROKEN || !M32R)
@@ -467,15 +476,6 @@ config AIRO_CS
 	  for location).  You also want to check out the PCMCIA-HOWTO,
 	  available from <http://www.tldp.org/docs.html#howto>.
 
-config PCMCIA_ATMEL
-	tristate "Atmel at76c502/at76c504 PCMCIA cards"
-	depends on NET_RADIO && ATMEL && PCMCIA
-	select FW_LOADER
-	select CRC32
-	---help---
-	  Enable support for PCMCIA cards containing the
-	  Atmel at76c502 and at76c504 chips.
-
 config PCMCIA_WL3501
       tristate "Planet WL3501 PCMCIA cards"
       depends on NET_RADIO && EXPERIMENTAL && PCMCIA
Index: linux-2.6.18/drivers/parport/Kconfig
=================================--- linux-2.6.18.orig/drivers/parport/Kconfig
+++ linux-2.6.18/drivers/parport/Kconfig
@@ -82,6 +82,28 @@ config PARPORT_PC_PCMCIA
 	  Say Y here if you need PCMCIA support for your PC-style parallel
 	  ports. If unsure, say N.
 
+config PARPORT_AX88796
+	tristate "AX88796 Parallel Port"
+	depends on PARPORT
+	select PARPORT_NOT_PC
+	help
+	  Say Y here if you need support for the parallel port hardware on
+	  the AX88796 network controller chip. This code is also available
+	  as a module (say M), called parport_ax88796.
+
+	  The driver is not dependant on the AX88796 network driver, and
+	  should not interfere with the networking functions of the chip.
+
+config PARPORT_1284
+	bool "IEEE 1284 transfer modes"
+	depends on PARPORT
+	help
+	  If you have a printer that supports status readback or device ID, or
+	  want to use a device that uses enhanced parallel port transfer modes
+	  such as EPP and ECP, say Y here to enable advanced IEEE 1284
+	  transfer modes. Also say Y if you want device ID information to
+	  appear in /proc/sys/dev/parport/*/autoprobe*. It is safe to say N.
+
 config PARPORT_NOT_PC
 	bool
 
@@ -136,27 +158,5 @@ config PARPORT_SUNBPP
 	  found on many Sun machines. Note that many of the newer Ultras
 	  actually have pc style hardware instead.
 
-config PARPORT_AX88796
-	tristate "AX88796 Parallel Port"
-	depends on PARPORT
-	select PARPORT_NOT_PC
-	help
-	  Say Y here if you need support for the parallel port hardware on
-	  the AX88796 network controller chip. This code is also available
-	  as a module (say M), called parport_ax88796.
-
-	  The driver is not dependant on the AX88796 network driver, and
-	  should not interfere with the networking functions of the chip.
-
-config PARPORT_1284
-	bool "IEEE 1284 transfer modes"
-	depends on PARPORT
-	help
-	  If you have a printer that supports status readback or device ID, or
-	  want to use a device that uses enhanced parallel port transfer modes
-	  such as EPP and ECP, say Y here to enable advanced IEEE 1284
-	  transfer modes. Also say Y if you want device ID information to
-	  appear in /proc/sys/dev/parport/*/autoprobe*. It is safe to say N.
-
 endmenu
 
Index: linux-2.6.18/drivers/scsi/Kconfig
=================================--- linux-2.6.18.orig/drivers/scsi/Kconfig
+++ linux-2.6.18/drivers/scsi/Kconfig
@@ -471,6 +471,16 @@ config SCSI_IN2000
 
 source "drivers/scsi/megaraid/Kconfig.megaraid"
 
+config SCSI_HPTIOP
+	tristate "HighPoint RocketRAID 3xxx Controller support"
+	depends on SCSI && PCI
+	help
+	  This option enables support for HighPoint RocketRAID 3xxx
+	  controllers.
+
+	  To compile this driver as a module, choose M here; the module
+	  will be called hptiop. If unsure, say N.
+
 config SCSI_SATA
 	tristate "Serial ATA (SATA) support"
 	depends on SCSI
@@ -532,16 +542,6 @@ config SCSI_PDC_ADMA
 
 	  If unsure, say N.
 
-config SCSI_HPTIOP
-	tristate "HighPoint RocketRAID 3xxx Controller support"
-	depends on SCSI && PCI
-	help
-	  This option enables support for HighPoint RocketRAID 3xxx
-	  controllers.
-
-	  To compile this driver as a module, choose M here; the module
-	  will be called hptiop. If unsure, say N.
-
 config SCSI_SATA_QSTOR
 	tristate "Pacific Digital SATA QStor support"
 	depends on SCSI_SATA && PCI
@@ -792,6 +792,17 @@ config SCSI_GENERIC_NCR5380
 	  To compile this driver as a module, choose M here: the
 	  module will be called g_NCR5380.
 
+config SCSI_GENERIC_NCR53C400
+	bool "Enable NCR53c400 extensions"
+	depends on SCSI_GENERIC_NCR5380
+	help
+	  This enables certain optimizations for the NCR53c400 SCSI cards.
+	  You might as well try it out.  Note that this driver will only probe
+	  for the Trantor T130B in its default configuration; you might have
+	  to pass a command line option to the kernel at boot time if it does
+	  not detect your card.  See the file
+	  <file:Documentation/scsi/g_NCR5380.txt> for details.
+
 config SCSI_GENERIC_NCR5380_MMIO
 	tristate "Generic NCR5380/53c400 SCSI MMIO support"
 	depends on ISA && SCSI
@@ -807,17 +818,6 @@ config SCSI_GENERIC_NCR5380_MMIO
 	  To compile this driver as a module, choose M here: the
 	  module will be called g_NCR5380_mmio.
 
-config SCSI_GENERIC_NCR53C400
-	bool "Enable NCR53c400 extensions"
-	depends on SCSI_GENERIC_NCR5380
-	help
-	  This enables certain optimizations for the NCR53c400 SCSI cards.
-	  You might as well try it out.  Note that this driver will only probe
-	  for the Trantor T130B in its default configuration; you might have
-	  to pass a command line option to the kernel at boot time if it does
-	  not detect your card.  See the file
-	  <file:Documentation/scsi/g_NCR5380.txt> for details.
-
 config SCSI_IBMMCA
 	tristate "IBMMCA SCSI support"
 	depends on MCA_LEGACY && SCSI
Index: linux-2.6.18/drivers/serial/Kconfig
=================================--- linux-2.6.18.orig/drivers/serial/Kconfig
+++ linux-2.6.18/drivers/serial/Kconfig
@@ -151,32 +151,6 @@ config SERIAL_8250_MANY_PORTS
 	  say N here to save some memory. You can also say Y if you have an
 	  "intelligent" multiport card such as Cyclades, Digiboards, etc.
 
-config SERIAL_8250_SHARE_IRQ
-	bool "Support for sharing serial interrupts"
-	depends on SERIAL_8250_EXTENDED
-	help
-	  Some serial boards have hardware support which allows multiple dumb
-	  serial ports on the same board to share a single IRQ. To enable
-	  support for this in the serial driver, say Y here.
-
-config SERIAL_8250_DETECT_IRQ
-	bool "Autodetect IRQ on standard ports (unsafe)"
-	depends on SERIAL_8250_EXTENDED
-	help
-	  Say Y here if you want the kernel to try to guess which IRQ
-	  to use for your serial port.
-
-	  This is considered unsafe; it is far better to configure the IRQ in
-	  a boot script using the setserial command.
-
-	  If unsure, say N.
-
-config SERIAL_8250_RSA
-	bool "Support RSA serial ports"
-	depends on SERIAL_8250_EXTENDED
-	help
-	  ::: To be written :::
-
 #
 # Multi-port serial cards
 #
@@ -199,7 +173,6 @@ config SERIAL_8250_ACCENT
 	  To compile this driver as a module, choose M here: the module
 	  will be called 8250_accent.
 
-
 config SERIAL_8250_BOCA
 	tristate "Support Boca cards"
 	depends on SERIAL_8250 != n && ISA && SERIAL_8250_MANY_PORTS
@@ -219,6 +192,32 @@ config SERIAL_8250_HUB6
 	  To compile this driver as a module, choose M here: the module
 	  will be called 8250_hub6.
 
+config SERIAL_8250_SHARE_IRQ
+	bool "Support for sharing serial interrupts"
+	depends on SERIAL_8250_EXTENDED
+	help
+	  Some serial boards have hardware support which allows multiple dumb
+	  serial ports on the same board to share a single IRQ. To enable
+	  support for this in the serial driver, say Y here.
+
+config SERIAL_8250_DETECT_IRQ
+	bool "Autodetect IRQ on standard ports (unsafe)"
+	depends on SERIAL_8250_EXTENDED
+	help
+	  Say Y here if you want the kernel to try to guess which IRQ
+	  to use for your serial port.
+
+	  This is considered unsafe; it is far better to configure the IRQ in
+	  a boot script using the setserial command.
+
+	  If unsure, say N.
+
+config SERIAL_8250_RSA
+	bool "Support RSA serial ports"
+	depends on SERIAL_8250_EXTENDED
+	help
+	  ::: To be written :::
+
 config SERIAL_8250_MCA
 	tristate "Support 8250-type ports on MCA buses"
 	depends on SERIAL_8250 != n && MCA
Index: linux-2.6.18/drivers/video/console/Kconfig
=================================--- linux-2.6.18.orig/drivers/video/console/Kconfig
+++ linux-2.6.18/drivers/video/console/Kconfig
@@ -217,6 +217,14 @@ config FONT_MINI_4x6
 	bool "Mini 4x6 font"
 	depends on !SPARC && FONTS
 
+config FONT_10x18
+	bool "console 10x18 font (not supported by all drivers)" if FONTS
+	depends on FRAMEBUFFER_CONSOLE
+	help
+	  This is a high resolution console font for machines with very
+	  big letters. It fits between the sun 12x22 and the normal 8x16 font.
+	  If other fonts are too big or too small for you, say Y, otherwise say N.
+
 config FONT_SUN8x16
 	bool "Sparc console 8x16 font"
 	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
@@ -231,13 +239,5 @@ config FONT_SUN12x22
 	  big letters (like the letters used in the SPARC PROM). If the
 	  standard font is unreadable for you, say Y, otherwise say N.
 
-config FONT_10x18
-	bool "console 10x18 font (not supported by all drivers)" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
-	help
-	  This is a high resolution console font for machines with very
-	  big letters. It fits between the sun 12x22 and the normal 8x16 font.
-	  If other fonts are too big or too small for you, say Y, otherwise say N.
-
 endmenu
 
Index: linux-2.6.18/sound/core/Kconfig
=================================--- linux-2.6.18.orig/sound/core/Kconfig
+++ linux-2.6.18/sound/core/Kconfig
@@ -42,6 +42,20 @@ config SND_SEQ_DUMMY
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-seq-dummy.
 
+config SND_SEQUENCER_OSS
+	bool "OSS Sequencer API"
+	depends on SND && SND_SEQUENCER
+	select SND_OSSEMUL
+	help
+	  Say Y here to enable OSS sequencer emulation (both
+	  /dev/sequencer and /dev/music interfaces).
+
+	  Many programs still use the OSS API, so say Y.
+
+	  If you choose M in "Sequencer support" (SND_SEQUENCER),
+	  this will be compiled as a module. The module will be called
+	  snd-seq-oss.
+
 config SND_OSSEMUL
 	bool
 	depends on SND
@@ -82,20 +96,6 @@ config SND_PCM_OSS_PLUGINS
           support conversion of channels, formats and rates. It will
           behave like most of new OSS/Free drivers in 2.4/2.6 kernels.
 
-config SND_SEQUENCER_OSS
-	bool "OSS Sequencer API"
-	depends on SND && SND_SEQUENCER
-	select SND_OSSEMUL
-	help
-	  Say Y here to enable OSS sequencer emulation (both
-	  /dev/sequencer and /dev/music interfaces).
-
-	  Many programs still use the OSS API, so say Y.
-
-	  If you choose M in "Sequencer support" (SND_SEQUENCER),
-	  this will be compiled as a module. The module will be called
-	  snd-seq-oss.
-
 config SND_RTCTIMER
 	tristate "RTC Timer support"
 	depends on SND && RTC
Index: linux-2.6.18/drivers/infiniband/Kconfig
=================================--- linux-2.6.18.orig/drivers/infiniband/Kconfig
+++ linux-2.6.18/drivers/infiniband/Kconfig
@@ -35,7 +35,6 @@ config INFINIBAND_ADDR_TRANS
 	default y
 
 source "drivers/infiniband/hw/mthca/Kconfig"
-source "drivers/infiniband/hw/ipath/Kconfig"
 
 source "drivers/infiniband/ulp/ipoib/Kconfig"
 
@@ -43,4 +42,6 @@ source "drivers/infiniband/ulp/srp/Kconf
 
 source "drivers/infiniband/ulp/iser/Kconfig"
 
+source "drivers/infiniband/hw/ipath/Kconfig"
+
 endmenu


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
