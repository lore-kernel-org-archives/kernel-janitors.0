From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:42:55 +0000
Subject: Re: [KJ] [PATCH 14/18] drivers/video/ remove pci_find_{device, subsys}
Message-Id: <20050214184255.GJ7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1710655408414099=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141147.34802.amitg@calsoftinc.com>
In-Reply-To: <200502141147.34802.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============1710655408414099==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:47:31AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/drivers/video/igafb.c linux-2.6.11-rc3/drivers/video/igafb.c
> --- orig/drivers/video/igafb.c	2005-01-20 20:06:34.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/video/igafb.c	2005-02-14 01:14:30.000000000 +0530
> @@ -388,14 +388,14 @@ int __init igafb_init(void)
>          if (!con_is_present())
>                  return -ENXIO;
>  
> -        pdev = pci_find_device(PCI_VENDOR_ID_INTERG, 
> +        pdev = pci_get_device(PCI_VENDOR_ID_INTERG, 
>                                 PCI_DEVICE_ID_INTERG_1682, 0);
>  	if (pdev == NULL) {
>  		/*
>  		 * XXX We tried to use cyber2000fb.c for IGS 2000.
>  		 * But it does not initialize the chip in JavaStation-E, alas.
>  		 */
> -        	pdev = pci_find_device(PCI_VENDOR_ID_INTERG, 0x2000, 0);
> +        	pdev = pci_get_device(PCI_VENDOR_ID_INTERG, 0x2000, 0);
>          	if(pdev == NULL) {
>          	        return -ENXIO;
>  		}

No, this is incorrect.  Please do not apply.

thanks,

greg k-h

--===============1710655408414099==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1710655408414099==--
