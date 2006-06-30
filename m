From: Greg KH <greg@kroah.com>
Date: Fri, 30 Jun 2006 16:46:51 +0000
Subject: Re: [KJ] [PATCH] pci_module_init() -> pci_register_driver() in
Message-Id: <20060630164651.GA3492@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A454A4.5010802@nachtwindheim.de>
In-Reply-To: <44A454A4.5010802@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2006 at 06:40:50PM +0200, Henne wrote:
> diff -ruN linux-2.6.17-git15/drivers/net/defxx.c linux/drivers/net/defxx.c
> --- linux-2.6.17-git15/drivers/net/defxx.c	2006-03-20 06:53:29.000000000 +0100
> +++ linux/drivers/net/defxx.c	2006-06-30 00:13:00.000000000 +0200
> @@ -3444,7 +3444,7 @@
>  {
>  	int rc_pci, rc_eisa;
> 
> -	rc_pci = pci_module_init(&dfx_driver);
> +	rc_pci = pci_register_driver(&dfx_driver);
>  	if (rc_pci >= 0) dfx_have_pci = 1;
>  	
>  	rc_eisa = dfx_eisa_init();

This is wrong, they are using the return value in an improper way.  It
will never be greater than 0.

> diff -ruN linux-2.6.17-git15/drivers/net/pcnet32.c linux/drivers/net/pcnet32.c
> --- linux-2.6.17-git15/drivers/net/pcnet32.c	2006-06-29 23:22:48.000000000 +0200
> +++ linux/drivers/net/pcnet32.c	2006-06-30 00:02:09.000000000 +0200
> @@ -2725,7 +2725,7 @@
>  		tx_start = tx_start_pt;
> 
>  	/* find the PCI devices */
> -	if (!pci_module_init(&pcnet32_driver))
> +	if (!pci_register_driver(&pcnet32_driver))
>  		pcnet32_have_pci = 1;
> 

Same thing here.  Just registering a driver does not mean that PCI is
present, or that there is a pci device in the system that is controlled
by this driver.


thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
