From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:47:18 +0000
Subject: Re: [KJ] [PATCH 5/18] drivers/isdn/ remove pci_find_{device, subsys}
Message-Id: <20050214184718.GR7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58805647741729361=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141114.27588.amitg@calsoftinc.com>
In-Reply-To: <200502141114.27588.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============58805647741729361==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:14:25AM +0530, Amit Gud wrote:
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
> diff -uprN orig/drivers/isdn/hisax/avm_pci.c linux-2.6.11-rc3/drivers/isdn/hisax/avm_pci.c
> --- orig/drivers/isdn/hisax/avm_pci.c	2005-01-20 20:06:20.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/isdn/hisax/avm_pci.c	2005-02-14 02:28:53.000000000 +0530
> @@ -792,7 +792,7 @@ setup_avm_pcipnp(struct IsdnCard *card)
>  	}
>  #endif
>  #ifdef CONFIG_PCI
> -	if ((dev_avm = pci_find_device(PCI_VENDOR_ID_AVM,
> +	if ((dev_avm = pci_get_device(PCI_VENDOR_ID_AVM,
>  		PCI_DEVICE_ID_AVM_A1,  dev_avm))) {
>  		if (pci_enable_device(dev_avm))
>  			return(0);

No, this is incorrect, please do not apply.

thanks,

greg k-h

--===============58805647741729361==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58805647741729361==--
