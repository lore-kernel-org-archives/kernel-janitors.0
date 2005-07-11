From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 11 Jul 2005 10:03:59 +0000
Subject: Re: [KJ] [PATCH 09/20] Fix "nocast type" warnings
Message-Id: <200507111403.59428.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507102319.26284.victor@cetuc.puc-rio.br>
In-Reply-To: <200507102319.26284.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 11 July 2005 03:19, Victor Fusco wrote:
> --- linux-git.orig/drivers/pnp/pnpacpi/core.c
> +++ linux-git/drivers/pnp/pnpacpi/core.c

> -void *pnpacpi_kmalloc(size_t size, int f)
> +void *pnpacpi_kmalloc(size_t size, unsigned int __nocast flags)
>  {
> -	void *p = kmalloc(size, f);
> +	void *p = kmalloc(size, flags);
>  	if (p)
>  		memset(p, 0, size);
>  	return p;

This is kcalloc(). Just remove duplicated code.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
