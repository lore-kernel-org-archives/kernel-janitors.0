From: Domen Puncer <domen@coderock.org>
Date: Tue, 05 Jul 2005 14:06:15 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings (__nocast type)
Message-Id: <20050705140615.GC2257@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96372727633263144=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031848.19703.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031848.19703.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============96372727633263144==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/07/05 00:58 +0000, Victor Fusco wrote:
> Em Dom 03 Jul 2005 22:22, voc? escreveu:
> > On Sunday 03 July 2005 22:48, Victor Fusco wrote:
> > > --- linux-2.6-git.orig/mm/slab.c
> > > +++ linux-2.6-git/mm/slab.c
> > 
> > > -		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
> > > +		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);
> > 
> > > -void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
> > > +void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast 
> flags, int nodeid)
> > 
> > Everything except kmem_cache_alloc_node() annotations and 0u chunk is
> > already in -mm. 
> 
> Description:
> ????????Fix the sparse warning "implicit cast to nocast type"

Can you change "quote-printable" to 7bit, 8bit, plain text or something sane?

> ?
> File/Subsystem: mm/slab
> 
> Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
>  
> slab.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Index: linux-2.6-git/mm/slab.c
> ===================================================================
> --- linux-2.6-git.orig/mm/slab.c	2005-07-03 15:00:06.000000000 +0000
> +++ linux-2.6-git/mm/slab.c	2005-07-03 15:00:51.000000000 +0000
> @@ -1425,7 +1426,7 @@
>  	INIT_LIST_HEAD(&cachep->lists.slabs_free);
>  
>  	if (flags & CFLGS_OFF_SLAB)
> -		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
> +		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);
>  	cachep->ctor = ctor;
>  	cachep->dtor = dtor;
>  	cachep->name = name;
> @@ -2365,7 +2366,7 @@
>   * and can sleep. And it will allocate memory on the given node, which
>   * can improve the performance for cpu bound structures.
>   */
> -void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
> +void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast 
> flags, int nodeid)

Line wrapped.


--===============96372727633263144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96372727633263144==--
