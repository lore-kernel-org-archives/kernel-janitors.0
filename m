From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Feb 2018 09:35:57 +0000
Subject: [PATCH] Coccinelle: zalloc-simple: Delete function "kmem_cache_alloc" from SmPL rules
Message-Id: <6bee0e11-59ef-b7b1-886e-7abaa30887f2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
In-Reply-To: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Feb 2018 10:20:47 +0100

The deletion for a call of the function "memset" depends on
the specification that a size determination is passed by
the expression "E1".
The function "kmem_cache_alloc" was specified despite of the technical
detail that this function does not get a parameter passed which would
correspond to such a size information.

Thus remove it from the first two SmPL rules and omit the rule "r4".

Link: https://elixir.free-electrons.com/linux/v4.15/source/tools/testing/ra=
dix-tree/linux/slab.h#L14
Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/tools/testing/radix-tree/linux/slab.h?id=F26e52e08ab8e56f528ac14aa7929b=
3477de5616#n14
Fixes: 5e2d9da5b9ba350a4f13bd3b255be046bcf86465 ("Coccinelle: kzalloc-simpl=
e: Add all zero allocating functions")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/alloc/zalloc-simple.cocci | 41 +-------------------=
----
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coc=
cinelle/api/alloc/zalloc-simple.cocci
index 92b20913055f..3bee6cdd99ea 100644
--- a/scripts/coccinelle/api/alloc/zalloc-simple.cocci
+++ b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
@@ -34,7 +34,7 @@ statement S;
 @@
=20
 * x =3D (T)\(kmalloc(E1, ...)\|vmalloc(E1)\|dma_alloc_coherent(...,E1,...)=
\|
-  kmalloc_node(E1, ...)\|kmem_cache_alloc(...)\|kmem_alloc(E1, ...)\|
+  kmalloc_node(E1, ...)\|kmem_alloc(E1, ...)\|
   devm_kmalloc(...,E1,...)\|kvmalloc(E1, ...)\|pci_alloc_consistent(...,E1=
,...)\|
   kvmalloc_node(E1,...)\);
   if ((x=3DNULL) || ...) S
@@ -88,15 +88,6 @@ statement S;
 - x =3D (T)kmalloc_node(E1,E2,E3);
 + x =3D (T)kzalloc_node(E1,E2,E3);
 |
-- x =3D kmem_cache_alloc(E3,E4);
-+ x =3D kmem_cache_zalloc(E3,E4);
-|
-- x =3D (T *)kmem_cache_alloc(E3,E4);
-+ x =3D kmem_cache_zalloc(E3,E4);
-|
-- x =3D (T)kmem_cache_alloc(E3,E4);
-+ x =3D (T)kmem_cache_zalloc(E3,E4);
-|
 - x =3D kmem_alloc(E1,E2);
 + x =3D kmem_zalloc(E1,E2);
 |
@@ -268,36 +259,6 @@ x << r3.x;
 msg=3D"WARNING: kzalloc_node should be used for %s, instead of kmalloc_nod=
e/memset" % (x)
 coccilib.report.print_report(p[0], msg)
=20
-//-----------------------------------------------------------------
-@r4 depends on org || report@
-type T, T2;
-expression x;
-expression E1,E2,E3;
-statement S;
-position p;
-@@
-
- x =3D (T)kmem_cache_alloc@p(E2,E3);
- if ((x=3DNULL) || ...) S
- memset((T2)x,0,E1);
-
-@script:python depends on org@
-p << r4.p;
-x << r4.x;
-@@
-
-msg=3D"%s" % (x)
-msg_safe=3Dmsg.replace("[","@(").replace("]",")")
-coccilib.org.print_todo(p[0], msg_safe)
-
-@script:python depends on report@
-p << r4.p;
-x << r4.x;
-@@
-
-msg=3D"WARNING: kmem_cache_zalloc should be used for %s, instead of kmem_c=
ache_alloc/memset" % (x)
-coccilib.report.print_report(p[0], msg)
-
 //-----------------------------------------------------------------
 @r5 depends on org || report@
 type T, T2;
--=20
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
