From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 02 Aug 2006 19:45:26 +0000
Subject: Re: [KJ] [PATCH 2] drivers/char/watchdog/alim*.c:
Message-Id: <20060802194526.GA31448@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060801070946.GB20012@texi.yes.nu>
In-Reply-To: <20060801070946.GB20012@texi.yes.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2006-08-01 at 09:09:46 +0200, Patrik Kullman <patrik@yes.nu> wrote:
> Remade the patch as instructed by Domen Puncer and Henne.
> 
> Although I don't know which way would be the best way for erroring out..
> 
> 1. The current form with different gotos depending on what needs to be reversed (I saw other drivers doing it this way, most effective?)
> 
> 2. Same goto (err_out) for all errors, depending on pci_dev_put()'s "if (dev)" to check if the device = NULL
> 
> 3. Same goto (err_out) for all errors, with "if (dev) { pci_dev_put(dev); }" (Maybe more fault tolerant?)
> 
> However I'm sure you will tell me! ;)
> 
> 
> Signed-off-by: Patrik Kullman <patrik@yes.nu>
> --- linux-2.6.17/drivers/char/watchdog/alim1535_wdt.c	2006-06-18 03:49:35.000000000 +0200
> +++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-08-01 07:25:21.000000000 +0200
> @@ -312,7 +312,7 @@
>   */
>  
>  static struct pci_device_id ali_pci_tbl[] = {
> -	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
> +	{PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535)},

Space between {}'s and content.

>  	{ 0, },
>  };
>  MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
> @@ -330,17 +330,19 @@
>  	u32 wdog;
>  
>  	/* Check for a 1535 series bridge */
> -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
> -	if(pdev = NULL)
> +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, NULL);
> +	if(!pdev)

Space between 'if' and '('

>  		return -ENODEV;
>  
>  	/* Check for the a 7101 PMU */
> -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
> -	if(pdev = NULL)
> +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);
> +	if(!pdev)

Ditto

>  		return -ENODEV;
>  
> -	if(pci_enable_device(pdev))
> +	if(pci_enable_device(pdev)) {

Ditto

Cheers, Tobias
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
