From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 26 May 2006 11:51:58 +0000
Subject: Re: [KJ] [PATCH] printk : arch/arm/mach-omap1/id.c
Message-Id: <20060526115158.GA7267@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 26, 2006 at 12:35:17PM +0200, Christophe Lucas wrote:
> Description:
> printk should include appropriate KERN_* constant (of course
> only at beginning of lines).

> --- linux-2.6.16.16.orig/arch/arm/mach-omap1/id.c
> +++ linux-2.6.16.16/arch/arm/mach-omap1/id.c
> @@ -123,17 +123,17 @@
>  	omap_id = omap_readl(OMAP32_ID_0);
>  
>  #ifdef DEBUG
> -	printk("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
> -	printk("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
> +	printk(KERN_DEBUG "OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));

That would be pr_debug(), no? And you can drop #ifdef too.

> +	printk(KERN_DEBUG "OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
>  		omap_readl(OMAP_DIE_ID_1),
>  	       (omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
> -	printk("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
> -	printk("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
> +	printk(KERN_DEBUG "OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
> +	printk(KERN_DEBUG "OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
>  		omap_readl(OMAP_PRODUCTION_ID_1),
>  		omap_readl(OMAP_PRODUCTION_ID_1) & 0xffff);
> -	printk("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
> -	printk("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
> -	printk("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
> +	printk(KERN_DEBUG "OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
> +	printk(KERN_DEBUG "OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
> +	printk(KERN_DEBUG "JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
>  #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
