From: Domen Puncer <domen@coderock.org>
Date: Wed, 02 Feb 2005 10:26:11 +0000
Subject: Re: [KJ] [PATCH] pci_*() for drivers/media/radio/
Message-Id: <20050202102611.GA4463@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57910014503205742=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050202082305.GB24725@rhum.iomeda.fr>
In-Reply-To: <20050202082305.GB24725@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============57910014503205742==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/02/05 09:23 +0100, Christophe Lucas wrote:
> Hi,
> 
> Description:
> >From : http://kerneljanitors.org/TODO
> >- delete all pci_find_* functions from the kernel tree.
> >  Instead of pci_find_device use pci_get_device()..
> >-  convert from pci_module_init to pci_register_driver
> 
> Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
> -- 
> Christophe
...

> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c
> --- linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c	2005-01-26 08:31:14.000000000 +0100
> +++ linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c	2005-01-26 10:30:27.000000000 +0100
> @@ -265,11 +265,11 @@ static int __init maestro_radio_init(voi
>  {
>  	register __u16 found=0;
>  	struct pci_dev *pcidev = NULL;
> -	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS, 
> +	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS, 
>  						  PCI_DEVICE_ID_ESS_ESS1968,
>  						  pcidev)))

I recall from Hanna Linder patches that this is not a search and replace,
pci_get_device implements refcounting, so you have to put (pci_dev_put?)
on error and exit paths.


	Domen

--===============57910014503205742==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57910014503205742==--
