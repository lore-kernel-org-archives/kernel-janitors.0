From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 04 Oct 2006 17:47:56 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting
Message-Id: <20061004104756.301b4637.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 03 Oct 2006 23:52:43 -0700 Don Mullis wrote:

> Refactor Kconfig content to maximize nesting of menus by menuconfig
> and xconfig.  No functional changes.
> 
> Tested by simultaneously running `make xconfig` with and without
> patch, and comparing displays.
> 
> Signed-off-by: Don Mullis <dwm@meer.net>
> 
> ---
> The claim is that this helps the user's understanding of options -- but
> since options are reordered, experts on particular subsystems might
> disagree in some instances.

Yeah, there's plenty of room for rearranging some of these...
and for disagreeing about them.  :)


> Tested against 2.6.18-git20.
> 
>  drivers/net/wireless/Kconfig |   72 +++++++++++++++++++++----------------------
>  drivers/parport/Kconfig      |   44 +++++++++++++-------------
>  drivers/pci/hotplug/Kconfig  |    3 +
>  drivers/serial/Kconfig       |   53 +++++++++++++++----------------
>  lib/Kconfig.debug            |   56 ++++++++++++++++-----------------
>  sound/core/Kconfig           |   28 ++++++++--------
>  6 files changed, 128 insertions(+), 128 deletions(-)
> 
> Index: linux-2.6.18/lib/Kconfig.debug
> =================================> --- linux-2.6.18.orig/lib/Kconfig.debug
> +++ linux-2.6.18/lib/Kconfig.debug
> @@ -46,6 +46,34 @@ config UNUSED_SYMBOLS
>  	  you really need it, and what the merge plan to the mainline kernel for
>  	  your module is.
>  
> +config DEBUG_FS
> +	bool "Debug Filesystem"
> +	depends on SYSFS
> +	help
> +	  debugfs is a virtual file system that kernel developers use to put
> +	  debugging files into.  Enable this option to be able to read and
> +	  write to these files.
> +
> +	  If unsure, say N.
> +
> +config UNWIND_INFO
> +	bool "Compile the kernel with frame unwind information"
> +	depends on !IA64 && !PARISC
> +	depends on !MODULES || !(MIPS || PPC || SUPERH || V850)
> +	help
> +	  If you say Y here the resulting kernel image will be slightly larger
> +	  but not slower, and it will give very useful debugging information.
> +	  If you don't debug the kernel, you can say N, but we may not be able
> +	  to solve problems without frame unwind information or frame pointers.
> +
> +config STACK_UNWIND
> +	bool "Stack unwind support"
> +	depends on UNWIND_INFO
> +	depends on X86
> +	help
> +	  This enables more precise stack traces, omitting all unrelated
> +	  occurrences of pointers into kernel code from the dump.
> +

I suppose that those make sense since they don't depend on
DEBUG_KERNEL.

I think that the Linux Kernel Dump Test Tool Module also needs to
depend on DEBUG_KERNEL.  Either that or just move it up with these
other config items that you moved.  Would you do that too, please?


>  config DEBUG_KERNEL
>  	bool "Kernel debugging"
>  	help
> @@ -301,16 +329,6 @@ config DEBUG_INFO
>  
>  	  If unsure, say N.
>  
> -config DEBUG_FS
> -	bool "Debug Filesystem"
> -	depends on SYSFS
> -	help
> -	  debugfs is a virtual file system that kernel developers use to put
> -	  debugging files into.  Enable this option to be able to read and
> -	  write to these files.
> -
> -	  If unsure, say N.
> -
>  config DEBUG_VM
>  	bool "Debug VM"
>  	depends on DEBUG_KERNEL
> @@ -339,24 +357,6 @@ config FRAME_POINTER
>  	  some architectures or if you use external debuggers.
>  	  If you don't debug the kernel, you can say N.
>  
> -config UNWIND_INFO
> -	bool "Compile the kernel with frame unwind information"
> -	depends on !IA64 && !PARISC
> -	depends on !MODULES || !(MIPS || PPC || SUPERH || V850)
> -	help
> -	  If you say Y here the resulting kernel image will be slightly larger
> -	  but not slower, and it will give very useful debugging information.
> -	  If you don't debug the kernel, you can say N, but we may not be able
> -	  to solve problems without frame unwind information or frame pointers.
> -
> -config STACK_UNWIND
> -	bool "Stack unwind support"
> -	depends on UNWIND_INFO
> -	depends on X86
> -	help
> -	  This enables more precise stack traces, omitting all unrelated
> -	  occurrences of pointers into kernel code from the dump.
> -
>  config FORCED_INLINING
>  	bool "Force gcc to inline functions marked 'inline'"
>  	depends on DEBUG_KERNEL
> Index: linux-2.6.18/drivers/pci/hotplug/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/pci/hotplug/Kconfig
> +++ linux-2.6.18/drivers/pci/hotplug/Kconfig
> @@ -76,7 +76,8 @@ config HOTPLUG_PCI_IBM
>  
>  config HOTPLUG_PCI_ACPI
>  	tristate "ACPI PCI Hotplug driver"
> -	depends on (!ACPI_DOCK && ACPI && HOTPLUG_PCI) || (ACPI_DOCK && HOTPLUG_PCI)
> +	depends on HOTPLUG_PCI
> +	depends on (!ACPI_DOCK && ACPI) || (ACPI_DOCK)

Yep, much more readable to me.

>  	help
>  	  Say Y here if you have a system that supports PCI Hotplug using
>  	  ACPI.
> Index: linux-2.6.18/drivers/net/wireless/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/net/wireless/Kconfig
> +++ linux-2.6.18/drivers/net/wireless/Kconfig

IMO we want to leave all of the PCMCIA options grouped together
instead of moving them around by chipset.


> Index: linux-2.6.18/drivers/parport/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/parport/Kconfig
> +++ linux-2.6.18/drivers/parport/Kconfig
> @@ -82,6 +82,28 @@ config PARPORT_PC_PCMCIA

Hm, parport could use a little work.  What do you think
of the version below?


> Index: linux-2.6.18/drivers/serial/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/serial/Kconfig
> +++ linux-2.6.18/drivers/serial/Kconfig

This one is Good.  Should be merged.

> @@ -151,32 +151,6 @@ config SERIAL_8250_MANY_PORTS
>  	  say N here to save some memory. You can also say Y if you have an
>  	  "intelligent" multiport card such as Cyclades, Digiboards, etc.
>  
> -config SERIAL_8250_SHARE_IRQ
> -	bool "Support for sharing serial interrupts"
> -	depends on SERIAL_8250_EXTENDED
> -	help
> -	  Some serial boards have hardware support which allows multiple dumb
> -	  serial ports on the same board to share a single IRQ. To enable
> -	  support for this in the serial driver, say Y here.
> -
> -config SERIAL_8250_DETECT_IRQ
> -	bool "Autodetect IRQ on standard ports (unsafe)"
> -	depends on SERIAL_8250_EXTENDED
> -	help
> -	  Say Y here if you want the kernel to try to guess which IRQ
> -	  to use for your serial port.
> -
> -	  This is considered unsafe; it is far better to configure the IRQ in
> -	  a boot script using the setserial command.
> -
> -	  If unsure, say N.
> -
> -config SERIAL_8250_RSA
> -	bool "Support RSA serial ports"
> -	depends on SERIAL_8250_EXTENDED
> -	help
> -	  ::: To be written :::
> -
>  #
>  # Multi-port serial cards
>  #
> @@ -199,7 +173,6 @@ config SERIAL_8250_ACCENT
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called 8250_accent.
>  
> -
>  config SERIAL_8250_BOCA
>  	tristate "Support Boca cards"
>  	depends on SERIAL_8250 != n && ISA && SERIAL_8250_MANY_PORTS
> @@ -219,6 +192,32 @@ config SERIAL_8250_HUB6
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called 8250_hub6.
>  
> +config SERIAL_8250_SHARE_IRQ
> +	bool "Support for sharing serial interrupts"
> +	depends on SERIAL_8250_EXTENDED
> +	help
> +	  Some serial boards have hardware support which allows multiple dumb
> +	  serial ports on the same board to share a single IRQ. To enable
> +	  support for this in the serial driver, say Y here.
> +
> +config SERIAL_8250_DETECT_IRQ
> +	bool "Autodetect IRQ on standard ports (unsafe)"
> +	depends on SERIAL_8250_EXTENDED
> +	help
> +	  Say Y here if you want the kernel to try to guess which IRQ
> +	  to use for your serial port.
> +
> +	  This is considered unsafe; it is far better to configure the IRQ in
> +	  a boot script using the setserial command.
> +
> +	  If unsure, say N.
> +
> +config SERIAL_8250_RSA
> +	bool "Support RSA serial ports"
> +	depends on SERIAL_8250_EXTENDED
> +	help
> +	  ::: To be written :::
> +
>  config SERIAL_8250_MCA
>  	tristate "Support 8250-type ports on MCA buses"
>  	depends on SERIAL_8250 != n && MCA
> Index: linux-2.6.18/sound/core/Kconfig
> =================================> --- linux-2.6.18.orig/sound/core/Kconfig
> +++ linux-2.6.18/sound/core/Kconfig
> @@ -42,6 +42,20 @@ config SND_SEQ_DUMMY

Well... I like the OSS options grouped together, but others
may prefer the sequencer options grouped together.


---
Alternate parport Kconfig patch:


From: Randy Dunlap <rdunlap@xenotime.net>

Rearrange PARPORT config options so that the menu is not split up
unnecessarily.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
--- linux-2618-g21.orig/drivers/parport/Kconfig
+++ linux-2618-g21/drivers/parport/Kconfig
@@ -82,8 +82,33 @@ config PARPORT_PC_PCMCIA
 	  Say Y here if you need PCMCIA support for your PC-style parallel
 	  ports. If unsure, say N.
 
-config PARPORT_NOT_PC
-	bool
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
+config PARPORT_GSC
+	tristate
+	default GSC
+	depends on PARPORT
+	select PARPORT_NOT_PC
 
 config PARPORT_IP32
 	tristate "SGI IP32 builtin port (EXPERIMENTAL)"
@@ -121,12 +146,6 @@ config PARPORT_ATARI
 	  Atari machines. This code is also available as a module (say M),
 	  called parport_atari. If in doubt, saying N is the safe plan.
 
-config PARPORT_GSC
-	tristate
-	default GSC
-	depends on PARPORT
-	select PARPORT_NOT_PC
-
 config PARPORT_SUNBPP
 	tristate "Sparc hardware (EXPERIMENTAL)"
 	depends on SBUS && PARPORT && EXPERIMENTAL
@@ -136,27 +155,8 @@ config PARPORT_SUNBPP
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
+config PARPORT_NOT_PC
+	bool
 
 endmenu
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
