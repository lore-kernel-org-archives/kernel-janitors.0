From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:48:33 +0000
Subject: Re: [KJ] [PATCH 3/18] drivers/char remove pci_find_{device, subsys}
Message-Id: <20050214184833.GT7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88562989740758757=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141111.08301.amitg@calsoftinc.com>
In-Reply-To: <200502141111.08301.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============88562989740758757==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:11:06AM +0530, Amit Gud wrote:
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
> diff -uprN orig/drivers/char/ip2main.c linux-2.6.11-rc3/drivers/char/ip2main.c
> --- orig/drivers/char/ip2main.c	2005-02-11 15:19:43.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/char/ip2main.c	2005-02-14 02:19:08.000000000 +0530
> @@ -595,7 +595,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
>  #ifdef CONFIG_PCI
>  			{
>  				struct pci_dev *pci_dev_i = NULL;
> -				pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
> +				pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
>  							  PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
>  				if (pci_dev_i != NULL) {
>  					unsigned int addr;

No, this is incorrect, please do not apply.

greg k-h

--===============88562989740758757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88562989740758757==--
