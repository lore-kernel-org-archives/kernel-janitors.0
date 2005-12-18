From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 18 Dec 2005 23:24:44 +0000
Subject: Re: [KJ] [Patch 2/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <20051218232444.GQ23349@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32748994139988952=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946431.7394.7.camel@alice>
In-Reply-To: <1134946431.7394.7.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============32748994139988952==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 11:53:51PM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this removes LINUX_VERSION_CODE checks in irda/vlsi_ir.h
> 
> Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h.orig	2005-12-18 23:45:15.000000000 +0100
> +++ linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h	2005-12-18 23:46:10.000000000 +0100
> @@ -54,26 +54,9 @@ typedef void irqreturn_t;
>   */
>  #include <linux/version.h>
>  
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
> -
> -/* PDE() introduced in 2.5.4 */
> -#ifdef CONFIG_PROC_FS
> -#define PDE(inode) ((inode)->u.generic_ip)
> -#endif
> -
> -/* irda crc16 calculation exported in 2.5.42 */
> -#define irda_calc_crc16(fcs,buf,len)	(GOOD_FCS)
> -
> -/* we use this for unified pci device name access */
> -#define PCIDEV_NAME(pdev)	((pdev)->name)
> -
> -#else /* 2.5 or later */
> -
>  /* whatever we get from the associated struct device - bus:slot:dev.fn id */
>  #define PCIDEV_NAME(pdev)	(pci_name(pdev))
>  
> -#endif
>...

In this case, you could make the code more readable by expanding all 
uses of PCIDEV_NAME in vlsi_ir.c.

And the "#ifndef IRQ_RETVAL" block in vlsi_ir.h is also kernel 2.4 
compatibility stuff.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============32748994139988952==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32748994139988952==--
