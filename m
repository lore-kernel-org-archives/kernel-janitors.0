From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 00:58:22 +0000
Subject: [KJ] [PATCH 7/8] Cleanup set_slab_attr()
Message-Id: <436FF82E.1050004@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030909090309050809020606"
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com>
In-Reply-To: <436FF51D.8080509@us.ibm.com>
To: kernel-janitors@lists.osdl.org
Cc: Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------030909090309050809020606
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cleanup a loop in set_slab_attr().

mcd@arrakis:~/linux/source/linux-2.6.14+slab_cleanup/patches $ diffstat
set_slab_attr.patch
 slab.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-Matt

--------------030909090309050809020606
Content-Type: text/x-patch;
 name="set_slab_attr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="set_slab_attr.patch"

Change the
	do { ... } while (--i);
loop in set_slab_attr to a
	while (i--) { ... }
loop like the rest of the functions that do similar loops in mm/slab.c.

Index: linux-2.6.14+slab_cleanup/mm/slab.c
===================================================================
--- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-07 16:00:09.005539608 -0800
+++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-07 16:07:59.169063888 -0800
@@ -2141,11 +2141,11 @@ static void set_slab_attr(kmem_cache_t *
 
 	i = 1 << cachep->gfporder;
 	page = virt_to_page(objp);
-	do {
+	while (i--) {
 		SET_PAGE_CACHE(page, cachep);
 		SET_PAGE_SLAB(page, slabp);
 		page++;
-	} while (--i);
+	}
 }
 
 /*

--------------030909090309050809020606
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030909090309050809020606--
