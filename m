From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:20 +0000
Subject: [PATCH 3/11] staging: lustre: lclient: Use kzalloc and kfree
Message-Id: <1430495482-933-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.

A simplified version of the semantic patch that makes these changes is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr,size; @@
- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@ expression ptr, size; @@
- OBD_FREE(ptr, size);
+ kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lclient/lcommon_cl.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/lclient/lcommon_cl.c b/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
--- a/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
+++ b/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
@@ -202,7 +202,7 @@ struct lu_device *ccc_device_alloc(const
 	struct cl_site    *site;
 	int rc;
 
-	OBD_ALLOC_PTR(vdv);
+	vdv = kzalloc(sizeof(*vdv), GFP_NOFS);
 	if (vdv = NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -211,7 +211,7 @@ struct lu_device *ccc_device_alloc(const
 	ccc2lu_dev(vdv)->ld_ops = luops;
 	vdv->cdv_cl.cd_ops = clops;
 
-	OBD_ALLOC_PTR(site);
+	site = kzalloc(sizeof(*site), GFP_NOFS);
 	if (site != NULL) {
 		rc = cl_site_init(site, &vdv->cdv_cl);
 		if (rc = 0)
@@ -219,7 +219,7 @@ struct lu_device *ccc_device_alloc(const
 		else {
 			LASSERT(lud->ld_site = NULL);
 			CERROR("Cannot init lu_site, rc %d.\n", rc);
-			OBD_FREE_PTR(site);
+			kfree(site);
 		}
 	} else
 		rc = -ENOMEM;
@@ -239,10 +239,10 @@ struct lu_device *ccc_device_free(const
 
 	if (d->ld_site != NULL) {
 		cl_site_fini(site);
-		OBD_FREE_PTR(site);
+		kfree(site);
 	}
 	cl_device_fini(lu2cl_dev(d));
-	OBD_FREE_PTR(vdv);
+	kfree(vdv);
 	return next;
 }
 

