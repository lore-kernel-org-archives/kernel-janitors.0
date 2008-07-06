From: Oliver Endriss <o.endriss@gmx.de>
Date: Sun, 06 Jul 2008 01:15:50 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <200807060315.51736@orion.escape-edv.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
In-Reply-To: <1214139259.2994.8.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-dvb@linuxtv.org
Cc: Jaswinder Singh <jaswinder@infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>, Mauro Carvalho Chehab <mchehab@infradead.org>

Jaswinder Singh wrote:
> There's no point in this, since the user can use the BUILTIN_FIRMWARE
> option to include arbitrary firmware files directly in the kernel image.

NAK! This option allows to compile the firmware into the _driver_,
which is very useful if you want to test various driver/firmware
combinations. Having the firmware in the _kernel_ does not help!

Well, I am tired to fight for this option in the kernel every other
month. :-(

@Mauro:
Is there a way to strip this stuff from Kconfig/Makefile/av7110*.[ch]
for submission to the kernel? Basically I don't care whether and how
they cripple the driver in the kernel. But I would like to keep the code
'as is' in the linuxtv repositories.

CU
Oliver

>
> Thanks to David Woodhouse for help.
> 
> Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
> --
> drivers/media/dvb/ttpci/Kconfig  |   23 +++----------------
> drivers/media/dvb/ttpci/Makefile |    9 -------
> drivers/media/dvb/ttpci/av7110.c |   16 -------------
> drivers/media/dvb/ttpci/fdump.c    |   44 -------------------------------------
> 4 files changed, 4 insertions(+), 88 deletions(-)
> diff --git a/drivers/media/dvb/ttpci/Kconfig b/drivers/media/dvb/ttpci/Kconfig
> index e0bbcaf..6b7a586 100644
> --- a/drivers/media/dvb/ttpci/Kconfig
> +++ b/drivers/media/dvb/ttpci/Kconfig
> @@ -6,7 +6,7 @@ config DVB_AV7110
>  	tristate "AV7110 cards"
>  	depends on DVB_CORE && PCI && I2C
>  	depends on HOTPLUG
> -	select FW_LOADER if !DVB_AV7110_FIRMWARE
> +	select FW_LOADER
>  	select TTPCI_EEPROM
>  	select VIDEO_SAA7146_VV
>  	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
> @@ -30,6 +30,9 @@ config DVB_AV7110
>  	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
>  	  or /lib/firmware (depending on configuration of firmware hotplug).
>  
> +	  Alternatively, you can download the file and use the 
> +	  BUILTIN_FIRMWARE option to build it into your kernel image.
> +
>  	  Say Y if you own such a card and want to use it.
>  
>  config DVB_AV7110_BOOTCODE
> @@ -39,24 +42,6 @@ config DVB_AV7110_BOOTCODE
>  	  This includes firmware for AV7110 bootcode
>  	  Say 'N' and let it get loaded from userspace on demand 
>  
> -config DVB_AV7110_FIRMWARE
> -	bool "Compile AV7110 firmware into the driver"
> -	depends on DVB_AV7110 && !STANDALONE
> -	default y if DVB_AV7110=y
> -	help
> -	  The AV7110 firmware is normally loaded by the firmware hotplug manager.
> -	  If you want to compile the firmware into the driver you need to say
> -	  Y here and provide the correct path of the firmware. You need this
> -	  option if you want to compile the whole driver statically into the
> -	  kernel.
> -
> -	  All other people say N.
> -
> -config DVB_AV7110_FIRMWARE_FILE
> -	string "Full pathname of av7110 firmware file"
> -	depends on DVB_AV7110_FIRMWARE
> -	default "/usr/lib/hotplug/firmware/dvb-ttpci-01.fw"
> -
>  config DVB_AV7110_OSD
>  	bool "AV7110 OSD support"
>  	depends on DVB_AV7110
> diff --git a/drivers/media/dvb/ttpci/Makefile b/drivers/media/dvb/ttpci/Makefile
> index d7483f1..a7ff3cd 100644
> --- a/drivers/media/dvb/ttpci/Makefile
> +++ b/drivers/media/dvb/ttpci/Makefile
> @@ -14,12 +14,3 @@ obj-$(CONFIG_DVB_BUDGET_PATCH) += budget-patch.o
>  obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
>  
>  EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core/ -Idrivers/media/dvb/frontends/
> -
> -hostprogs-y	:= fdump
> -
> -ifeq ($(CONFIG_DVB_AV7110_FIRMWARE),y)
> -$(obj)/av7110.o: $(obj)/av7110_firm.h
> -
> -$(obj)/av7110_firm.h: $(obj)/fdump
> -	$(obj)/fdump $(CONFIG_DVB_AV7110_FIRMWARE_FILE) dvb_ttpci_fw $@
> -endif
> diff --git a/drivers/media/dvb/ttpci/av7110.c b/drivers/media/dvb/ttpci/av7110.c
> index 747e7f1..c11a13c 100644
> --- a/drivers/media/dvb/ttpci/av7110.c
> +++ b/drivers/media/dvb/ttpci/av7110.c
> ...

-- 
----------------------------------------------------------------
VDR Remote Plugin 0.4.0: http://www.escape-edv.de/endriss/vdr/
----------------------------------------------------------------
