From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 05 Jul 2005 15:07:31 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings (__nocast type)
Message-Id: <200507051907.31823.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031848.19703.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031848.19703.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 05 July 2005 18:06, Domen Puncer wrote:
> On 04/07/05 00:58 +0000, Victor Fusco wrote:
> > --- linux-2.6-git.orig/mm/slab.c	2005-07-03 15:00:06.000000000 +0000
> > +++ linux-2.6-git/mm/slab.c	2005-07-03 15:00:51.000000000 +0000
> > @@ -1425,7 +1426,7 @@
> >  	INIT_LIST_HEAD(&cachep->lists.slabs_free);
> >  
> >  	if (flags & CFLGS_OFF_SLAB)
> > -		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
> > +		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);
> >  	cachep->ctor = ctor;
> >  	cachep->dtor = dtor;
> >  	cachep->name = name;
> > @@ -2365,7 +2366,7 @@
> >   * and can sleep. And it will allocate memory on the given node, which
> >   * can improve the performance for cpu bound structures.
> >   */
> > -void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
> > +void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast 
> > flags, int nodeid)
> 
> Line wrapped.

And doesn't change prototype.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
