From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Tue, 03 Aug 2010 16:11:20 +0000
Subject: Re: [PATCH 07/11] parisc: superio: do not use PCI resources before
Message-Id: <1280851880.2774.36.camel@mulgrave.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280850253-6128-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280850253-6128-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Frans Pop <elendil@planet.nl>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2010-08-03 at 19:44 +0400, Kulikov Vasiliy wrote:
>  drivers/parisc/superio.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
> index f7806d8..c8a36a2 100644
> --- a/drivers/parisc/superio.c
> +++ b/drivers/parisc/superio.c
> @@ -169,8 +169,6 @@ superio_init(struct pci_dev *pcidev)
>  	/* ...then properly fixup the USB to point at suckyio PIC */
>  	sio->usb_pdev->irq = superio_fixup_irq(sio->usb_pdev);
>  
> -	printk(KERN_INFO PFX "Found NS87560 Legacy I/O device at %s (IRQ %i)\n",
> -	       pci_name(pdev), pdev->irq);
>  
>  	pci_read_config_dword (pdev, SIO_SP1BAR, &sio->sp1_base);
>  	sio->sp1_base &= ~1;
> @@ -204,6 +202,9 @@ superio_init(struct pci_dev *pcidev)
>  	ret = pci_enable_device(pdev);
>  	BUG_ON(ret < 0);	/* not too much we can do about this... */
>  
> +	printk(KERN_INFO PFX "Found NS87560 Legacy I/O device at %s (IRQ %i)\n",
> +	       pci_name(pdev), pdev->irq);
> +
>  	/*
>  	 * Next project is programming the onboard interrupt controllers.
>  	 * PDC hasn't done this for us, since it's using polled I/O.

This really makes no sense; we want the information printed before we
start all the discovery prints, not after.  I assume lots of
initialisers want this too, so it looks particularly silly not to have
pci_name() returning the correct value until enable time.

If this is just the name initially assigned may change, this definitely
isn't true for parisc, and even for other things, it would be better to
print something than nothing.

James


