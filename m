From: Don Mullis <dwm@meer.net>
Date: Wed, 04 Oct 2006 06:52:43 +0000
Subject: [KJ] [PATCH] Kconfig refactoring for better menu nesting
Message-Id: <1159944763.7669.6.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Refactor Kconfig content to maximize nesting of menus by menuconfig
and xconfig.  No functional changes.

Tested by simultaneously running `make xconfig` with and without
patch, and comparing displays.

Signed-off-by: Don Mullis <dwm@meer.net>

---
The claim is that this helps the user's understanding of options -- but
since options are reordered, experts on particular subsystems might
disagree in some instances.

Tested against 2.6.18-git20.

 drivers/net/wireless/Kconfig |   72 +++++++++++++++++++++----------------------
 drivers/parport/Kconfig      |   44 +++++++++++++-------------
 drivers/pci/hotplug/Kconfig  |    3 +
 drivers/serial/Kconfig       |   53 +++++++++++++++----------------
 lib/Kconfig.debug            |   56 ++++++++++++++++-----------------
 sound/core/Kconfig           |   28 ++++++++--------
 6 files changed, 128 insertions(+), 128 deletions(-)

Index: linux-2.6.18/lib/Kconfig.debug
=================================--- linux-2.6.18.orig/lib/Kconfig.debug
+++ linux-2.6.18/lib/Kconfig.debug
@@ -46,6 +46,34 @@ config UNUSED_SYMBOLS
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
@@ -301,16 +329,6 @@ config DEBUG_INFO
 
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
@@ -339,24 +357,6 @@ config FRAME_POINTER
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
Index: linux-2.6.18/drivers/net/wireless/Kconfig
=================================--- linux-2.6.18.orig/drivers/net/wireless/Kconfig
+++ linux-2.6.18/drivers/net/wireless/Kconfig
@@ -371,33 +371,6 @@ config PCI_HERMES
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
@@ -432,6 +405,42 @@ config PCMCIA_SPECTRUM
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
@@ -456,15 +465,6 @@ config AIRO_CS
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


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
