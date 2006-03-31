From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 31 Mar 2006 13:29:29 +0000
Subject: Re: [KJ][Patch] fix kbuild warning in sisfb.o
Message-Id: <20060331132929.GE3893@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10306133013815422=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143810678.7834.13.camel@localhost.localdomain>
In-Reply-To: <1143810678.7834.13.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============10306133013815422==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 01, 2006 at 12:11:18AM +1100, Darren Jenkins" wrote:
> G'day list
> 
> This one was a lot harder to find, but much easier to fix.
> 
> WARNING: drivers/video/sis/sisfb.o - Section mismatch: reference
> to .init.data: from .data between 'sisfb_driver' (at offset 0xf8) and
> 'sisfb_ops'
> 
> 
> This is caused by the 'pci_driver struct' in sis_main.c having a pointer
> to a 'pci_device_id struct' in 'sis_main.h' that is marked as
> __devinitdata.
> 
> The patch below just removes the __devinitdata annotation from the
> 'pci_device_id struct', which seems like the best solution here.

ACK, this is a bug that should be fixed.

> Note: This driver also contains a lot of 
> 
> #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
> 
> which is in the TODO list
> - Code that depends on LINUX_VERSION_CODE & KERNEL_VERSION < 2.6 can be
>   deleted in most cases. (Mostly/all? done)
> 
> So I might follow with a patch that removes it.

AFAIR, Thomas (Cc'ed) does still share this code between kernel 2.4 and 
2.6, and the #ifdef's should therefore stay.

> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> --- linux-2.6.16-git13/drivers/video/sis/sis_main.h.orig	2006-03-31 23:33:50.000000000 +1100
> +++ linux-2.6.16-git13/drivers/video/sis/sis_main.h	2006-03-31 23:34:05.000000000 +1100
> @@ -125,7 +125,7 @@ static struct sisfb_chip_info {
>  	{ XGI_40,     SIS_315_VGA, 1, HW_CURSOR_AREA_SIZE_315 * 4, SIS_CRT2_WENABLE_315, "XGI V3XT/V5/V8" },
>  };
>  
> -static struct pci_device_id __devinitdata sisfb_pci_table[] = {
> +static struct pci_device_id sisfb_pci_table[] = {
>  #ifdef CONFIG_FB_SIS_300
>  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_300,     PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_540_VGA, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
> 
> 

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============10306133013815422==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10306133013815422==--
