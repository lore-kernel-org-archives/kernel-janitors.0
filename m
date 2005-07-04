From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Mon, 04 Jul 2005 00:58:05 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings (__nocast type)
Message-Id: <200507040058.05875.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031848.19703.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031848.19703.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Dom 03 Jul 2005 22:22, voc=EA escreveu:
> On Sunday 03 July 2005 22:48, Victor Fusco wrote:
> > --- linux-2.6-git.orig/mm/slab.c
> > +++ linux-2.6-git/mm/slab.c
>=20
> > -		cachep->slabp_cache =3D kmem_find_general_cachep(slab_size,0);
> > +		cachep->slabp_cache =3D kmem_find_general_cachep(slab_size, 0u);
>=20
> > -void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodei=
d)
> > +void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocas=
t=20
flags, int nodeid)
>=20
> Everything except kmem_cache_alloc_node() annotations and 0u chunk is
> already in -mm.=20

Description:
=A0=A0=A0=A0=A0=A0=A0=A0Fix the sparse warning "implicit cast to nocast typ=
e"
=A0
File/Subsystem: mm/slab

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
=20
slab.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


Index: linux-2.6-git/mm/slab.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D--- linux-2.6-git.orig/mm/slab.c	2005-07-03 15:00:0=
6.000000000 +0000
+++ linux-2.6-git/mm/slab.c	2005-07-03 15:00:51.000000000 +0000
@@ -1425,7 +1426,7 @@
 	INIT_LIST_HEAD(&cachep->lists.slabs_free);
=20
 	if (flags & CFLGS_OFF_SLAB)
-		cachep->slabp_cache =3D kmem_find_general_cachep(slab_size,0);
+		cachep->slabp_cache =3D kmem_find_general_cachep(slab_size, 0u);
 	cachep->ctor =3D ctor;
 	cachep->dtor =3D dtor;
 	cachep->name =3D name;
@@ -2365,7 +2366,7 @@
  * and can sleep. And it will allocate memory on the given node, which
  * can improve the performance for cpu bound structures.
  */
-void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
+void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast=20
flags, int nodeid)
 {
 	int loop;
 	void *objp;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
