From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:49:02 +0000
Subject: Re: [KJ] [PATCH 2/18] drivers/atm/ remove pci_find_{device, subsys}
Message-Id: <20050214184902.GV7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12801583981358577=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141107.53021.amitg@calsoftinc.com>
In-Reply-To: <200502141107.53021.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============12801583981358577==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:07:50AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> 
> AG
> --
> May the source be with you
> 
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/drivers/atm/fore200e.c linux-2.6.11-rc3/drivers/atm/fore200e.c
> --- orig/drivers/atm/fore200e.c	2005-02-11 15:19:41.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/atm/fore200e.c	2005-02-14 05:14:27.000000000 +0530
> @@ -645,7 +645,7 @@ fore200e_pca_detect(const struct fore200
>      int              count = index;
>      
>      do {
> -	pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
> +	pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
>  	if (pci_dev == NULL)
>  	    return NULL;
>      } while (count--);
> 

No, this is incorrect, please do not apply.

greg k-h


--===============12801583981358577==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12801583981358577==--
