From: Judith Lebzelter <judith@osdl.org>
Date: Sat, 02 Oct 2004 05:35:53 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 pci_bus_cvlink.c]
Message-Id: <Pine.LNX.4.33.0410011514220.4332-100000@osdlab.pdx.osdl.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1115441919303064=="
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <112570000.1096654254@w-hlinder.beaverton.ibm.com>
References: <20040923225035.GB14274@kroah.com>
In-Reply-To: <20040923225035.GB14274@kroah.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, kernel-janitors@lists.osdl.org, Judith Lebzelter <judith@osdl.org>, davidm@hpl.hp.com, jbarnes@sgi.com

--===============1115441919303064==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 1 Oct 2004, Hanna Linder wrote:

> As pci_find_device is going away soon I have replaced the call with pci_get_device.
> Judith, could you run these 3 ia64 ones through PLM, please?

All 3 patches are included in PLM in patch ID 3357:

http://www.osdl.org/plm-cgi/plm?module=patch_info&patch_id=3357

It shows no _additional_ errors or warnings compared to 2.6.9-rc2.  The
ia64 filter is comp-regress which runs quite a bit more than just the
defconfig.  Result summaries follow:

Kernel version: 2.6.9-rc2-mm4 ( with 3 pci_get patches)
Kernel build:
   Making vmlinux (defconfig): 20 warnings, 0 errors
   Making modules (defconfig): 9 warnings, 0 errors
   Making vmlinux (allnoconfig): 14 warnings, 5 errors
   Making vmlinux (allyesconfig): 506 warnings, 27 errors
   Making modules (allyesconfig): 16 warnings, 0 errors
   Making vmlinux (allmodconfig): 19 warnings, 9 errors
   Making modules (allmodconfig): 498 warnings, 11 errors

Compared to 2.6.9-rc2-mm4, PLM ID 3342
http://www.osdl.org/plm-cgi/plm?module=patch_info&patch_id=3342:

Kernel version: 2.6.9-rc2-mm4
Kernel build:
   Making vmlinux (defconfig): 20 warnings, 0 errors
   Making modules (defconfig): 9 warnings, 0 errors
   Making vmlinux (allnoconfig): 14 warnings, 5 errors
   Making vmlinux (allyesconfig): 506 warnings, 27 errors
   Making modules (allyesconfig): 16 warnings, 0 errors
   Making vmlinux (allmodconfig): 19 warnings, 9 errors
   Making modules (allmodconfig): 498 warnings, 11 errors


Judith

>
> Thanks a lot.
>
> Hanna Linder
> IBM Linux Technology Center
>
> Signed-off-by: Hanna Linder <hannal@us.ibm.com>
>
> ---
>
> diff -Nrup linux-2.6.9-rc2-mm4cln/arch/ia64/sn/io/machvec/pci_bus_cvlink.c linux-2.6.9-rc2-mm4patch2/arch/ia64/sn/io/machvec/pci_bus_cvlink.c
> --- linux-2.6.9-rc2-mm4cln/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-09-28 14:58:07.000000000 -0700
> +++ linux-2.6.9-rc2-mm4patch2/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-09-30 16:56:57.454516072 -0700
> @@ -904,7 +904,7 @@ sn_pci_init (void)
>  	/*
>  	 * Initialize the device vertex in the pci_dev struct.
>  	 */
> -	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
> +	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
>  		ret = sn_pci_fixup_slot(pci_dev);
>  		if ( ret ) {
>  			printk(KERN_WARNING
>




--===============1115441919303064==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1115441919303064==--
