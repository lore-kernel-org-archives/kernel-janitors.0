From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 11 Jul 2005 10:16:41 +0000
Subject: Re: [KJ] [PATCH 10/20] Fix "nocast type" warnings
Message-Id: <200507111416.41333.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507102319.34713.victor@cetuc.puc-rio.br>
In-Reply-To: <200507102319.34713.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 11 July 2005 03:19, Victor Fusco wrote:
> --- linux-git.orig/drivers/pnp/pnpbios/core.c
> +++ linux-git/drivers/pnp/pnpbios/core.c

> -void *pnpbios_kmalloc(size_t size, int f)
> +void *pnpbios_kmalloc(size_t size, unsigned int __nocast flags)
>  {
> -	void *p = kmalloc( size, f );
> +	void *p = kmalloc( size, flags );
>  	if ( p = NULL )
>  		printk(KERN_ERR "PnPBIOS: kmalloc() failed\n");
>  	else
                memset(p, 0, size);
        return p;
   }

YA kcalloc(). sparse correctly warns you pnpbios_kmalloc() is a trivial
wrapper that should be removed. 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
