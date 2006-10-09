From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 09 Oct 2006 02:29:23 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting, v.2
Message-Id: <20061008192923.4a2157d0.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 08 Oct 2006 12:53:14 -0700 Don Mullis wrote:

> Refactor Kconfig content to maximize nesting of menus by menuconfig
> and xconfig.
> 
> Tested by simultaneously running `make xconfig` with and without
> patch, and comparing displays.
> 
> Signed-off-by: Don Mullis <dwm@meer.net>
> Cc: Randy Dunlap <rdunlap@xenotime.net>
> 
> ---
> The claim is that this helps the user's understanding of options -- but
> since options are reordered, experts on particular subsystems might
> disagree in some instances.
> 
> Patch and suggestions by Randy Dunlap incorporated into this version.
> 
> 
>  drivers/parport/Kconfig     |    6 ++--
>  drivers/pci/hotplug/Kconfig |    3 +-
>  drivers/serial/Kconfig      |   53 ++++++++++++++++++++---------------------
>  lib/Kconfig.debug           |   56 ++++++++++++++++++++++----------------------
>  sound/core/Kconfig          |   28 +++++++++++-----------
>  5 files changed, 73 insertions(+), 73 deletions(-)
> 
> Index: linux-2.6.18/lib/Kconfig.debug
> =================================> --- linux-2.6.18.orig/lib/Kconfig.debug
> +++ linux-2.6.18/lib/Kconfig.debug

That's fine, but the LKDTM module still breaks the menu
and needs to be moved or depend on DEBUG_KERNEL since items
after it depend on DEBUG_KERNEL.


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
>  	help
>  	  Say Y here if you have a system that supports PCI Hotplug using
>  	  ACPI.

OK.

> Index: linux-2.6.18/drivers/serial/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/serial/Kconfig
> +++ linux-2.6.18/drivers/serial/Kconfig

serial is still Good change.

> Index: linux-2.6.18/sound/core/Kconfig
> =================================> --- linux-2.6.18.orig/sound/core/Kconfig
> +++ linux-2.6.18/sound/core/Kconfig

I still don't care for this change.

> @@ -42,6 +42,20 @@ config SND_SEQ_DUMMY
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-seq-dummy.
>  
> +config SND_SEQUENCER_OSS
> +	bool "OSS Sequencer API"
> +	depends on SND && SND_SEQUENCER
> +	select SND_OSSEMUL
> +	help
> +	  Say Y here to enable OSS sequencer emulation (both
> +	  /dev/sequencer and /dev/music interfaces).
> +
> +	  Many programs still use the OSS API, so say Y.
> +
> +	  If you choose M in "Sequencer support" (SND_SEQUENCER),
> +	  this will be compiled as a module. The module will be called
> +	  snd-seq-oss.
> +
>  config SND_OSSEMUL
>  	bool
>  	depends on SND
> @@ -82,20 +96,6 @@ config SND_PCM_OSS_PLUGINS
>            support conversion of channels, formats and rates. It will
>            behave like most of new OSS/Free drivers in 2.4/2.6 kernels.
>  
> -config SND_SEQUENCER_OSS
> -	bool "OSS Sequencer API"
> -	depends on SND && SND_SEQUENCER
> -	select SND_OSSEMUL
> -	help
> -	  Say Y here to enable OSS sequencer emulation (both
> -	  /dev/sequencer and /dev/music interfaces).
> -
> -	  Many programs still use the OSS API, so say Y.
> -
> -	  If you choose M in "Sequencer support" (SND_SEQUENCER),
> -	  this will be compiled as a module. The module will be called
> -	  snd-seq-oss.
> -
>  config SND_RTCTIMER
>  	tristate "RTC Timer support"
>  	depends on SND && RTC
> Index: linux-2.6.18/drivers/parport/Kconfig
> =================================> --- linux-2.6.18.orig/drivers/parport/Kconfig
> +++ linux-2.6.18/drivers/parport/Kconfig
> @@ -82,9 +82,6 @@ config PARPORT_PC_PCMCIA
>  	  Say Y here if you need PCMCIA support for your PC-style parallel
>  	  ports. If unsure, say N.
>  
> -config PARPORT_NOT_PC
> -	bool
> -
>  config PARPORT_IP32
>  	tristate "SGI IP32 builtin port (EXPERIMENTAL)"
>  	depends on SGI_IP32 && PARPORT && EXPERIMENTAL
> @@ -158,5 +155,8 @@ config PARPORT_1284
>  	  transfer modes. Also say Y if you want device ID information to
>  	  appear in /proc/sys/dev/parport/*/autoprobe*. It is safe to say N.
>  
> +config PARPORT_NOT_PC
> +	bool
> +
>  endmenu

parport is Good.

Thanks.
---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
