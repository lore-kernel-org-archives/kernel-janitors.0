From: Domen Puncer <domen@coderock.org>
Date: Mon, 31 Jul 2006 05:16:39 +0000
Subject: Re: [KJ] [PATCH]
Message-Id: <20060731051639.GD4969@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1154104265.2785.23.camel@localhost>
In-Reply-To: <1154104265.2785.23.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28/07/06 18:31 +0200, Patrik Kullman wrote:
> This is my first try to submit a patch here, so go gentle on me.. ;)
> At least patch-tester@coderock.org thought it seemed ok..
> 
> This little patch moves from pci_find_device() in alim1535_wdt.c and alim7101_wdt.c to pci_get_device()/pci_dev_put()
> I also found that alim1535.c uses 0x1535/0x7101 instead of the PCI_DEVICE_ID_AL_* defines.
> 
> I compared my usage of pci_dev_put() with other drivers and I hope that I've understood it right.
> 
> Signed-off-by: Patrik Kullman <patrik@yes.nu>
> --- linux-2.6.17/drivers/char/watchdog/alim1535_wdt.c	2006-06-18 03:49:35.000000000 +0200
> +++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-07-28 07:15:00.000000000 +0200
> @@ -312,7 +312,7 @@
>   */
>  
>  static struct pci_device_id ali_pci_tbl[] = {
> -	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
> +	{ PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, PCI_ANY_ID, PCI_ANY_ID,},
>  	{ 0, },
>  };
>  MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
> @@ -330,17 +330,25 @@
>  	u32 wdog;
>  
>  	/* Check for a 1535 series bridge */
> -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
> -	if(pdev = NULL)
> +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, NULL);
> +	if(!pdev) {
> +		pci_dev_put(pdev);

pci_dev_put(NULL)?

>  		return -ENODEV;
> +	} else {
> +		pci_dev_put(pdev);
> +	}
>  
>  	/* Check for the a 7101 PMU */
> -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
> -	if(pdev = NULL)
> +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);

What if the previous _and_ this one succeed?

> +	if(!pdev) {
> +		pci_dev_put(pdev);
>  		return -ENODEV;
> +	}
>  
> -	if(pci_enable_device(pdev))
> +	if(pci_enable_device(pdev)) {
> +		pci_dev_put(pdev);
>  		return -EIO;
> +	}
>  
>  	ali_pci = pdev;
>  
> @@ -447,6 +455,7 @@
>  	/* Deregister */
>  	unregister_reboot_notifier(&ali_notifier);
>  	misc_deregister(&ali_miscdev);
> +	pci_dev_put(ali_pci);
>  }
>  
>  module_init(watchdog_init);
> --- linux-2.6.17/drivers/char/watchdog/alim7101_wdt.c	2006-06-18 03:49:35.000000000 +0200
> +++ linux/drivers/char/watchdog/alim7101_wdt.c	2006-07-28 18:19:52.000000000 +0200
> @@ -332,6 +332,7 @@
>  	wdt_turnoff();
>  	/* Deregister */
>  	misc_deregister(&wdt_miscdev);
> +	pci_dev_put(alim7101_pmu);
>  	unregister_reboot_notifier(&wdt_notifier);
>  }
>  
> @@ -342,17 +343,20 @@
>  	char tmp;
>  
>  	printk(KERN_INFO PFX "Steve Hill <steve@navaho.co.uk>.\n");
> -	alim7101_pmu = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
> +	alim7101_pmu = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
>  	if (!alim7101_pmu) {
>  		printk(KERN_INFO PFX "ALi M7101 PMU not present - WDT not set\n");
> +		pci_dev_put(alim7101_pmu);
>  		return -EBUSY;
>  	}
>  
>  	/* Set the WDT in the PMU to 1 second */
>  	pci_write_config_byte(alim7101_pmu, ALI_7101_WDT, 0x02);
>  
> -	ali1543_south = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
> +	ali1543_south = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
>  	if (!ali1543_south) {
> +		pci_dev_put(ali1543_south);
pci_dev_put(NULL)

> +		pci_dev_put(alim7101_pmu);

Goto err_out (or something appropriate).

>  		printk(KERN_INFO PFX "ALi 1543 South-Bridge not present - WDT not set\n");
>  		return -EBUSY;
>  	}
> @@ -360,11 +364,15 @@
>  	if ((tmp & 0x1e) = 0x00) {
>  		if (!use_gpio) {
>  			printk(KERN_INFO PFX "Detected old alim7101 revision 'a1d'.  If this is a cobalt board, set the 'use_gpio' module parameter.\n");
> +			pci_dev_put(ali1543_south);
> +			pci_dev_put(alim7101_pmu);

ditto

>  			return -EBUSY;
>  		} 
>  		nowayout = 1;
>  	} else if ((tmp & 0x1e) != 0x12 && (tmp & 0x1e) != 0x00) {
>  		printk(KERN_INFO PFX "ALi 1543 South-Bridge does not have the correct revision number (???1001?) - WDT not set\n");
> +		pci_dev_put(ali1543_south);
> +		pci_dev_put(alim7101_pmu);

ditto

>  		return -EBUSY;
>  	}
>  
> @@ -397,6 +405,7 @@
>  		__module_get(THIS_MODULE);
>  	}
>  
> +	pci_dev_put(ali1543_south);
>  	printk(KERN_INFO PFX "WDT driver for ALi M7101 initialised. timeout=%d sec (nowayout=%d)\n",
>  		timeout, nowayout);
>  	return 0;
> @@ -404,6 +413,8 @@
>  err_out_miscdev:
>  	misc_deregister(&wdt_miscdev);
>  err_out:
> +	pci_dev_put(alim7101_pmu);
> +	pci_dev_put(ali1543_south);
>  	return rc;
>  }
>  
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
