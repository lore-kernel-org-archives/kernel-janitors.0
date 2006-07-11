From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 11 Jul 2006 15:44:41 +0000
Subject: Re: [KJ] [PATCH] drivers/parisc/superio.c: check return values of
Message-Id: <20060711084441.b7c5969f.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060711020442.GA17650@chello.nl>
In-Reply-To: <20060711020442.GA17650@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 11 Jul 2006 04:04:42 +0200 Richard wrote:

> Check return values of request region and act accordingly
> 
> My second attempt to correct some request_region code. Any input is
> welcome.

OK...

>  drivers/parisc/superio.c |   31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> 
> --- linux-2.6/drivers/parisc/superio.c	2006-07-06 16:58:12.083348600 +0200
> +++ mytree/drivers/parisc/superio.c	2006-07-11 03:02:04.444958048 +0200
> @@ -189,9 +189,20 @@ superio_init(struct pci_dev *pcidev)
>  	sio->acpi_base &= ~1;
>  	printk(KERN_INFO PFX "ACPI at 0x%x\n", sio->acpi_base);
>  
> -	request_region (IC_PIC1, 0x1f, "pic1");
> -	request_region (IC_PIC2, 0x1f, "pic2");
> -	request_region (sio->acpi_base, 0x1f, "acpi");
> +	if (!(request_region (IC_PIC1, 0x1f, "pic1"))) {

Coding style:  no extra parens (like after !).
	no space after function name.

> +		printk(KERN_ERR "can't get I/O %x\n", IC_PIC1);
> +		goto err1;
> +	}
> +	
> +	if(!(request_region (IC_PIC2, 0x1f, "pic2"))) {

space after "if".  drop "!()" parens.
no space after function name.

> +		printk(KERN_ERR "can't get I/O %x\n", IC_PIC2);
> +		goto err2;
> +	}
> +	
> +	if(!(request_region (sio->acpi_base, 0x1f, "acpi"))) {

ditto

> +		printk(KERN_ERR "can't get I/O %x\n", sio->acpi_base);
> +		goto err3;
> +	}
>  
>  	/* Enable the legacy I/O function */
>  	pci_read_config_word (pdev, PCI_COMMAND, &word);
> @@ -276,10 +287,22 @@ superio_init(struct pci_dev *pcidev)
>  
>  		printk(KERN_ERR PFX "could not get irq\n");
>  		BUG();
> -		return;
> +		
> +		/*Free resources previously requested*/

See above /* comment for spacing.

> +		goto err3;
>  	}
>  
>  	sio->suckyio_irq_enabled = 1;
> +
> +	return;
> +
> +
> +err3:	release_region(IC_PIC2, 0x1f);
> +
> +err2:	release_region(IC_PIC1, 0x1f);
> +
> +err1:	return; 
> +
>  }

Put labels and statements on separate lines.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
