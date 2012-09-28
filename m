From: Christoph Lameter <cl@linux.com>
Date: Fri, 28 Sep 2012 17:25:39 +0000
Subject: Re: [glommer-memcg:slab-common/kmalloc 19/30] mm/slab_common.c:206:6: warning: format '%ld' expects
Message-Id: <0000013a0de98901-6a46f645-edb7-4312-b4b8-e8fa5a4bd6f8-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928101501.GA29691@localhost>
In-Reply-To: <20120928101501.GA29691@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 28 Sep 2012, Fengguang Wu wrote:

> mm/slab_common.c: In function 'create_boot_cache':
> mm/slab_common.c:206:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' [-Wformat]

The following fix will be applied to the next release of the patchset:

Index: linux/mm/slab_common.c
=================================--- linux.orig/mm/slab_common.c	2012-09-28 12:25:00.614139749 -0500
+++ linux/mm/slab_common.c	2012-09-28 12:24:53.153984094 -0500
@@ -203,7 +203,7 @@ void __init create_boot_cache(struct kme
 	err = __kmem_cache_create(s, flags);

 	if (err)
-		panic("Creation of kmalloc slab %s size=%ld failed. Reason %d\n",
+		panic("Creation of kmalloc slab %s size=%td failed. Reason %d\n",
 					name, size, err);

 	list_add(&s->list, &slab_caches);
