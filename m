From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 30 Oct 2006 17:15:46 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to
Message-Id: <45463342.9020809@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ethan A Burns wrote:
> Richard,
> 	New patch is at the bottom.  I was unaware of 
> Documentation/feature-removal-schedule.txt.  Since this is already schedueled
> for removal, does this mean that this is an unneeded patch?  This item was on
> the TODO list, which is why I decided to take a stab at it.
>
> 	--Ethan
>
>   
(please don't top-post ;) )

The cleaning up of the drivers is needed, it is just the removal of 
pci_module_init() that needs to be left out (just to minimize the risk 
of people complaining it was removed ahead of time). And if you don't 
find anything more to do, I would appreciate any help to replace the 
#define FALSE/TRUE-mess we currently have in the tree with the newly (in 
linus-tree just before 2.6.19-rc1) added false/true (is defined in 
include/linux/stddef.h).
> Subject: [PATCH] Changed all calls to pci_module_init to be pci_register_device.
>
> This change was necessary because pci_module_init is obsolete.
>
> Signed-off-by: Ethan A. Burns <burns.ethan@gmail.com>
> ---
>  drivers/ata/ata_generic.c        |    2 +-
>  drivers/ata/pata_pdc2027x.c      |    2 +-
>  drivers/char/ipmi/ipmi_si_intf.c |    4 +---
>  drivers/net/hp100.c              |    4 +---
>  drivers/scsi/megaraid.c          |    2 +-
>  drivers/scsi/tmscsim.c           |    2 +-
>  include/linux/pci.h              |    6 ------
>  7 files changed, 6 insertions(+), 16 deletions(-)
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
>   
Except for the above, I 'ack' it.

cu around
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
