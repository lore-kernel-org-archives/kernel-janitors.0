From: Francois Romieu <romieu@fr.zoreil.com>
Date: Sat, 23 Sep 2006 12:43:59 +0000
Subject: Re: [KJ] ioremap balanced with iounmap for drivers/mtd subsystem
Message-Id: <20060923124359.GA17408@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200609222101.k8ML1oW5019174@hera.kernel.org>
In-Reply-To: <200609222101.k8ML1oW5019174@hera.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Linux Kernel Mailing List <linux-kernel@vger.kernel.org> :
> commit 25f0c659fe64832d8ee06aa623fffaad708dcf8b
[...]
> diff --git a/drivers/mtd/maps/arctic-mtd.c b/drivers/mtd/maps/arctic-mtd.c
> index d95ae58..642d96b 100644
> --- a/drivers/mtd/maps/arctic-mtd.c
> +++ b/drivers/mtd/maps/arctic-mtd.c
> @@ -96,6 +96,8 @@ static struct mtd_partition arctic_parti
>  static int __init
>  init_arctic_mtd(void)
>  {
> +	int err = 0;

Unneeded initialization.

> @@ -109,12 +111,20 @@ init_arctic_mtd(void)
>  	printk("%s: probing %d-bit flash bus\n", NAME, BUSWIDTH * 8);
>  	arctic_mtd = do_map_probe("cfi_probe", &arctic_mtd_map);
>  
> -	if (!arctic_mtd)
> +	if (!arctic_mtd) {
> +		iounmap((void *) arctic_mtd_map.virt);

Useless cast.

These two patterns are repeated all over the patch.

A grep for iounmap in drivers/mtd/nand would not hurt.

-- 
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
