From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 30 Oct 2006 04:16:35 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to
Message-Id: <45457CA3.8030103@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ethan A Burns wrote:
> From: Ethan A. Burns <burns.ethan@gmail.com>
>
> This change was necessary because pci_module_init is obsolete.
>
> Signed-off-by: Ethan A. Burns <eaburns@unh.edu>
> ---
>  drivers/ata/ata_generic.c        |    2 +-
>  drivers/ata/pata_pdc2027x.c      |    2 +-
>  drivers/char/ipmi/ipmi_si_intf.c |    2 +-
>  drivers/net/hp100.c              |    2 +-
>  drivers/net/tokenring/olympic.c  |    2 +-
>  drivers/scsi/megaraid.c          |    2 +-
>  drivers/scsi/tmscsim.c           |    2 +-
>  include/linux/pci.h              |    6 ------
>  8 files changed, 7 insertions(+), 13 deletions(-)
>   
<snip>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index e5cfb1f..fbfab65 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2483,7 +2483,7 @@ #ifdef CONFIG_ACPI
>  #endif
>
>  #ifdef CONFIG_PCI
> -	pci_module_init(&ipmi_pci_driver);
> +	pci_register_driver(&ipmi_pci_driver);
>  #endif
>   
Think you should remove #ifdef since pci_register_driver() returns 0 if 
undefined.
>  	if (si_trydefaults) {
> diff --git a/drivers/net/hp100.c b/drivers/net/hp100.c
> index 844c136..7dc5185 100644
> --- a/drivers/net/hp100.c
> +++ b/drivers/net/hp100.c
> @@ -3034,7 +3034,7 @@ #ifdef CONFIG_EISA
>  		goto out2;
>  #endif
>  #ifdef CONFIG_PCI
> -	err = pci_module_init(&hp100_pci_driver);
> +	err = pci_register_driver(&hp100_pci_driver);
>  	if (err && err != -ENODEV)
>  		goto out3;
>  #endif
>   
<snip>
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 09be0f8..70278cc 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -389,12 +389,6 @@ #define PCI_DEVICE_CLASS(dev_class,dev_c
>  	.vendor = PCI_ANY_ID, .device = PCI_ANY_ID, \
>  	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
>
> -/*
> - * pci_module_init is obsolete, this stays here till we fix up all usages of it
> - * in the tree.
> - */
> -#define pci_module_init	pci_register_driver
> -
>  /* these external functions are only available when PCI support is enabled */
>  #ifdef CONFIG_PCI
>
> --
>   
Is scheduled in Documentation/feature-removal-schedule.txt for January 
2007 ;).

Other then those, I liked it.

cu
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
