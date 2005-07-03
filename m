From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:29:46 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 4/17] fix sparse warnings (__nocast type)
Message-Id: <200507040229.47256.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031850.57491.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031850.57491.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:50, Victor Fusco wrote:
> --- linux-2.6-git.orig/drivers/pnp/pnpacpi/core.c
> +++ linux-2.6-git/drivers/pnp/pnpacpi/core.c

> -void *pnpacpi_kmalloc(size_t size, int f)
> +void *pnpacpi_kmalloc(size_t size, unsigned int __nocast flags)
>  {
> -	void *p = kmalloc(size, f);
> +	void *p = kmalloc(size, flags);
>  	if (p)
>  		memset(p, 0, size);
>  	return p;
   }

Sparse correctly reminds you that pnpacpi_kmalloc() is kcalloc() and should be
removed completely.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
