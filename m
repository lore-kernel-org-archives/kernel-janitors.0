From: Greg KH <greg@kroah.com>
Date: Wed, 17 May 2006 00:19:42 +0000
Subject: Re: [KJ] [PATCH] drivers/char/ip2/ip2main.c : change pci_find_device
Message-Id: <20060517001942.GD6355@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============056873048533311543=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4AA3.7090202@zarb.org>
In-Reply-To: <446A4AA3.7090202@zarb.org>
To: kernel-janitors@vger.kernel.org

--===============056873048533311543==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 16, 2006 at 11:56:51PM +0200, trem wrote:
> From: trem <tremyfr@yahoo.fr>
> 
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated. pci_dev_put has been added to decrement
> the counter, so unload could be done.
> 
> Signed-Off-By: trem <tremyfr@yahoo.fr>
> ---
> 

> diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
> index 03db1cb..2acdfb2 100644
> --- a/drivers/char/ip2/ip2main.c
> +++ b/drivers/char/ip2/ip2main.c
> @@ -594,7 +594,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
>  #ifdef CONFIG_PCI
>  			{
>  				struct pci_dev *pci_dev_i = NULL;
> -				pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
> +				pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
>  							  PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
>  				if (pci_dev_i != NULL) {
>  					unsigned int addr;
> @@ -622,6 +622,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
>  //						pci_irq = 0;
>  //					}
>  					ip2config.irq[i] = pci_dev_i->irq;
> +					pci_dev_put(pci_dev_i);

Nope, you saved a reference and yet just released it.  Not acceptable.

Please note that making these changes is very difficult.  Numerous
people have tried it in the past and generally just given up.  See the
archives for details on how to get it correct, and to keep from doing
the same things that others did.

thanks,

greg k-h

--===============056873048533311543==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============056873048533311543==--
