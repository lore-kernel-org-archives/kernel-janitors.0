From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 27 Nov 2005 17:20:30 +0000
Subject: Re: [KJ] pci-sh7751.c request_region return value check
Message-Id: <20051127172030.GC9695@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============090289465503150979=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511262000.12480.carlos@embedded.cl>
In-Reply-To: <200511262000.12480.carlos@embedded.cl>
To: kernel-janitors@vger.kernel.org

--===============090289465503150979==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27.11.2005 [14:09:49 -0300], Carlos Manuel Duclos Vergara wrote:
> Ok, thanks for your corrections. Attached is the new patch.
> 
> -- 
> Carlos Manuel Duclos Vergara
> http://www.toolchains.com/personal/blog

> --- Builds/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-24 19:10:21.000000000 -0300
> +++ Devel/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-27 14:07:39.000000000 -0300

-p1 applicable patches, please.

> @@ -126,6 +126,7 @@
>  static int __init pci_check_direct(void)
>  {
>  	unsigned int tmp, id;
> +	struct resource *r = NULL;
>  
>  	/* check for SH7751/SH7751R hardware */
>  	id = inl(SH7751_PCIREG_BASE+SH7751_PCICONF0);
> @@ -144,7 +145,16 @@
>  		if (inl (PCI_REG(SH7751_PCIPAR)) == 0x80000000) {
>  			outl (tmp, PCI_REG(SH7751_PCIPAR));
>  			printk(KERN_INFO "PCI: Using configuration type 1\n");
> -			request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
> +			r = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
> +			/*
> +			 * Murphy's law....
> +			 * (ENODEV or EINVAL in case of problems?)
> +			 */
> +			if( !r )
> +			{

	if (!r) {

as Matthew already pointed out.

Please read Documentation/CodingStyle.

Thanks,
Nish

--===============090289465503150979==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============090289465503150979==--
