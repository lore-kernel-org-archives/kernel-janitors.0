From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:22:55 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings (__nocast type)
Message-Id: <200507040222.56109.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031848.19703.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031848.19703.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:48, Victor Fusco wrote:
> --- linux-2.6-git.orig/mm/slab.c
> +++ linux-2.6-git/mm/slab.c

> -		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
> +		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);

> -void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
> +void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast flags, int nodeid)

Everything except kmem_cache_alloc_node() annotations and 0u chunk is already in -mm.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
