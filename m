From: Don Mullis <dwm@meer.net>
Date: Sun, 08 Oct 2006 19:53:14 +0000
Subject: [KJ]  [PATCH] Kconfig refactoring for better menu nesting, v.2
Message-Id: <1160337194.7669.68.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Refactor Kconfig content to maximize nesting of menus by menuconfig
and xconfig.

Tested by simultaneously running `make xconfig` with and without
patch, and comparing displays.

Signed-off-by: Don Mullis <dwm@meer.net>
Cc: Randy Dunlap <rdunlap@xenotime.net>

---
The claim is that this helps the user's understanding of options -- but
since options are reordered, experts on particular subsystems might
disagree in some instances.

Patch and suggestions by Randy Dunlap incorporated into this version.


 drivers/parport/Kconfig     |    6 ++--
 drivers/pci/hotplug/Kconfig |    3 +-
 drivers/serial/Kconfig      |   53 ++++++++++++++++++++---------------------
 lib/Kconfig.debug           |   56 ++++++++++++++++++++++----------------------
 sound/core/Kconfig          |   28 +++++++++++-----------
 5 files changed, 73 insertions(+), 73 deletions(-)

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
Index: linux-2.6.18/drivers/parport/Kconfig
=================================--- linux-2.6.18.orig/drivers/parport/Kconfig
+++ linux-2.6.18/drivers/parport/Kconfig
@@ -82,9 +82,6 @@ config PARPORT_PC_PCMCIA
 	  Say Y here if you need PCMCIA support for your PC-style parallel
 	  ports. If unsure, say N.
 
-config PARPORT_NOT_PC
-	bool
-
 config PARPORT_IP32
 	tristate "SGI IP32 builtin port (EXPERIMENTAL)"
 	depends on SGI_IP32 && PARPORT && EXPERIMENTAL
@@ -158,5 +155,8 @@ config PARPORT_1284
 	  transfer modes. Also say Y if you want device ID information to
 	  appear in /proc/sys/dev/parport/*/autoprobe*. It is safe to say N.
 
+config PARPORT_NOT_PC
+	bool
+
 endmenu
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
