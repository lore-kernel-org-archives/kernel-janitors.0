From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:44:33 +0000
Subject: Re: [KJ] [PATCH 11/18] drivers/pnp/ remove pci_find_{device, subsys}
Message-Id: <20050214184433.GM7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79589406429849219=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141139.03854.amitg@calsoftinc.com>
In-Reply-To: <200502141139.03854.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============79589406429849219==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:39:02AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> 
> diff -uprN orig/drivers/pnp/resource.c linux-2.6.11-rc3/drivers/pnp/resource.c
> --- orig/drivers/pnp/resource.c	2005-01-20 20:06:26.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/pnp/resource.c	2005-02-14 05:18:39.000000000 +0530
> @@ -387,7 +387,7 @@ int pnp_check_irq(struct pnp_dev * dev, 
>  	/* check if the resource is being used by a pci device */
>  	if (!pnp_skip_pci_scan) {
>  		struct pci_dev * pci = NULL;
> -		while ((pci = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
> +		while ((pci = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
>  			if (pci->irq == *irq)
>  				return 0;
>  		}

No, this replacement is incorrect, please do not apply it.

thanks,

greg k-h

--===============79589406429849219==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79589406429849219==--
