From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
Date: Mon, 02 Apr 2007 21:06:36 +0000
Subject: [KJ]  [PATCH] mm: spelling error in a comment
Message-Id: <20070402210636.GA14216@tux>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@lists.linux-foundation.org
Cc: linux-mm@kvack.org


Fix spelling in a comment in mm/slab.c.

Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>

---

Index: linux-2.6.21-rc5/mm/slab.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D--- linux-2.6.21-rc5.orig/mm/slab.c
+++ linux-2.6.21-rc5/mm/slab.c
@@ -451,7 +451,7 @@ struct kmem_cache {
=20
 #define BATCHREFILL_LIMIT	16
 /*
- * Optimization question: fewer reaps means less probability for unnessary
+ * Optimization question: fewer reaps means less probability for unnecessa=
ry
  * cpucache drain/refill cycles.
  *
  * OTOH the cpuarrays can contain lots of objects,

--=20
Charles Cl=E9ment.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
