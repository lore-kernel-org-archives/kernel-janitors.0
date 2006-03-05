From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 20:55:53 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in  lib/
Message-Id: <1141592153.17717.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29684607501852689=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141548097.6426.9.camel@alice>
In-Reply-To: <1141548097.6426.9.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============29684607501852689==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> > --- linux-2.6.16-rc5-mm1/lib/genalloc.c.orig
> > +++ linux-2.6.16-rc5-mm1/lib/genalloc.c
> > @@ -47,20 +47,17 @@ struct gen_pool *gen_pool_create(int nr_
> >  	if (!max_chunk_shift)
> >  		max_chunk_shift = PAGE_SHIFT;
> >
> > -	poolp = kmalloc(sizeof(struct gen_pool), GFP_KERNEL);
> > +	poolp = kzalloc(sizeof(struct gen_pool), GFP_KERNEL);
> >  	if (!poolp)
> >  		return NULL;
> > -	memset(poolp, 0, sizeof(struct gen_pool));
> > -	poolp->h = kmalloc(sizeof(struct gen_pool_link) *
> > -			   (max_chunk_shift - ALLOC_MIN_SHIFT + 1),
> > -			   GFP_KERNEL);
> > +	poolp->h = kcalloc((max_chunk_shift - ALLOC_MIN_SHIFT + ),
> 
> This will screw ia64.

attached patch below. Is there something like a cross compiler live cd,
so one can put time where concentration is missing to catch such stuff?

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/lib/genalloc.c.orig	2006-03-04 21:55:53.000000000 +0100
+++ linux-2.6.16-rc5-mm1/lib/genalloc.c	2006-03-04 21:57:03.000000000 +0100
@@ -47,20 +47,17 @@ struct gen_pool *gen_pool_create(int nr_
 	if (!max_chunk_shift)
 		max_chunk_shift = PAGE_SHIFT;
 
-	poolp = kmalloc(sizeof(struct gen_pool), GFP_KERNEL);
+	poolp = kzalloc(sizeof(struct gen_pool), GFP_KERNEL);
 	if (!poolp)
 		return NULL;
-	memset(poolp, 0, sizeof(struct gen_pool));
-	poolp->h = kmalloc(sizeof(struct gen_pool_link) *
-			   (max_chunk_shift - ALLOC_MIN_SHIFT + 1),
-			   GFP_KERNEL);
+	poolp->h = kcalloc((max_chunk_shift - ALLOC_MIN_SHIFT + 1),
+				sizeof(struct gen_pool_link), 
+				GFP_KERNEL);
 	if (!poolp->h) {
 		printk(KERN_WARNING "gen_pool_alloc() failed to allocate\n");
 		kfree(poolp);
 		return NULL;
 	}
-	memset(poolp->h, 0, sizeof(struct gen_pool_link) *
-	       (max_chunk_shift - ALLOC_MIN_SHIFT + 1));
 
 	spin_lock_init(&poolp->lock);
 	poolp->get_new_chunk = fp;
--- linux-2.6.16-rc5-mm1/lib/kobject.c.orig	2006-03-04 21:57:14.000000000 +0100
+++ linux-2.6.16-rc5-mm1/lib/kobject.c	2006-03-04 21:57:23.000000000 +0100
@@ -111,10 +111,9 @@ char *kobject_get_path(struct kobject *k
 	len = get_kobj_path_length(kobj);
 	if (len == 0)
 		return NULL;
-	path = kmalloc(len, gfp_mask);
+	path = kzalloc(len, gfp_mask);
 	if (!path)
 		return NULL;
-	memset(path, 0x00, len);
 	fill_kobj_path(kobj, path, len);
 
 	return path;



--===============29684607501852689==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29684607501852689==--
