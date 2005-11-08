From: walter harms <wharms@bfs.de>
Date: Tue, 08 Nov 2005 09:43:12 +0000
Subject: Re: [KJ] [PATCH 7/8] Cleanup set_slab_attr()
Message-Id: <43707330.1030403@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF82E.1050004@us.ibm.com>
In-Reply-To: <436FF82E.1050004@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi Matthew,
a for() loop is easier to understand (for me).

page = virt_to_page(objp);

for(i=0;i< (1 << cachep->gfporder);i++)
{
	SET_PAGE_CACHE(page, cachep);
   	SET_PAGE_SLAB(page, slabp);
   	page++;
}

re,
     walter



Matthew Dobson wrote:
> Cleanup a loop in set_slab_attr().
> 
> mcd@arrakis:~/linux/source/linux-2.6.14+slab_cleanup/patches $ diffstat
> set_slab_attr.patch
>  slab.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> -Matt
> 
> 
> ------------------------------------------------------------------------
> 
> Change the
> 	do { ... } while (--i);
> loop in set_slab_attr to a
> 	while (i--) { ... }
> loop like the rest of the functions that do similar loops in mm/slab.c.
> 
> Index: linux-2.6.14+slab_cleanup/mm/slab.c
> =================================> --- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-07 16:00:09.005539608 -0800
> +++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-07 16:07:59.169063888 -0800
> @@ -2141,11 +2141,11 @@ static void set_slab_attr(kmem_cache_t *
>  
>  	i = 1 << cachep->gfporder;
>  	page = virt_to_page(objp);
> -	do {
> +	while (i--) {
>  		SET_PAGE_CACHE(page, cachep);
>  		SET_PAGE_SLAB(page, slabp);
>  		page++;
> -	} while (--i);
> +	}
>  }
>  
>  /*
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
