From: Matthew Dobson <colpatch@us.ibm.com>
Date: Fri, 11 Nov 2005 00:07:25 +0000
Subject: [KJ] [PATCH 9/9] Cleanup a loop in set_slab_attr()
Message-Id: <4373E0BD.7020709@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050707040201070202090208"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DD82.8010606@us.ibm.com>
In-Reply-To: <4373DD82.8010606@us.ibm.com>
To: kernel-janitors@lists.osdl.org
Cc: manfred@colorfullife.com, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------050707040201070202090208
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Last, but not least, fix a loop in set_slab_attr() to match the rest of the
functionally similar loops in mm/slab.c.

-Matt

--------------050707040201070202090208
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

Signed-off-by: Matthew Dobson <colpatch@us.ibm.com>

Index: linux-2.6.14+slab_cleanup/mm/slab.c
===================================================================
--- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-10 11:49:19.028840752 -0800
+++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-10 11:49:21.636444336 -0800
@@ -2157,11 +2157,11 @@ static void set_slab_attr(kmem_cache_t *
 
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

--------------050707040201070202090208
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050707040201070202090208--
