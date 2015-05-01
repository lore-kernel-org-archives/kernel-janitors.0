From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:13 +0000
Subject: [PATCH 10/11] staging: lustre: osc: Use kzalloc and kfree
Message-Id: <1430495482-933-3-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/osc/osc_dev.c     |    4 +-
 drivers/staging/lustre/lustre/osc/osc_request.c |   33 ++++++++++++------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/osc/osc_request.c b/drivers/staging/lustre/lustre/osc/osc_request.c
--- a/drivers/staging/lustre/lustre/osc/osc_request.c
+++ b/drivers/staging/lustre/lustre/osc/osc_request.c
@@ -110,7 +110,7 @@ static int osc_packmd(struct obd_export
 		return lmm_size;
 
 	if (*lmmp != NULL && lsm = NULL) {
-		OBD_FREE(*lmmp, lmm_size);
+		kfree(*lmmp);
 		*lmmp = NULL;
 		return 0;
 	} else if (unlikely(lsm != NULL && ostid_id(&lsm->lsm_oi) = 0)) {
@@ -118,7 +118,7 @@ static int osc_packmd(struct obd_export
 	}
 
 	if (*lmmp = NULL) {
-		OBD_ALLOC(*lmmp, lmm_size);
+		*lmmp = kzalloc(lmm_size, GFP_NOFS);
 		if (*lmmp = NULL)
 			return -ENOMEM;
 	}
@@ -157,19 +157,20 @@ static int osc_unpackmd(struct obd_expor
 		return lsm_size;
 
 	if (*lsmp != NULL && lmm = NULL) {
-		OBD_FREE((*lsmp)->lsm_oinfo[0], sizeof(struct lov_oinfo));
-		OBD_FREE(*lsmp, lsm_size);
+		kfree((*lsmp)->lsm_oinfo[0]);
+		kfree(*lsmp);
 		*lsmp = NULL;
 		return 0;
 	}
 
 	if (*lsmp = NULL) {
-		OBD_ALLOC(*lsmp, lsm_size);
+		*lsmp = kzalloc(lsm_size, GFP_NOFS);
 		if (unlikely(*lsmp = NULL))
 			return -ENOMEM;
-		OBD_ALLOC((*lsmp)->lsm_oinfo[0], sizeof(struct lov_oinfo));
+		(*lsmp)->lsm_oinfo[0] = kzalloc(sizeof(struct lov_oinfo),
+						GFP_NOFS);
 		if (unlikely((*lsmp)->lsm_oinfo[0] = NULL)) {
-			OBD_FREE(*lsmp, lsm_size);
+			kfree(*lsmp);
 			return -ENOMEM;
 		}
 		loi_init((*lsmp)->lsm_oinfo[0]);
@@ -962,7 +963,7 @@ int osc_shrink_grant_to_target(struct cl
 	}
 	client_obd_list_unlock(&cli->cl_loi_list_lock);
 
-	OBD_ALLOC_PTR(body);
+	body = kzalloc(sizeof(*body), GFP_NOFS);
 	if (!body)
 		return -ENOMEM;
 
@@ -984,7 +985,7 @@ int osc_shrink_grant_to_target(struct cl
 				sizeof(*body), body, NULL);
 	if (rc != 0)
 		__osc_update_grant(cli, body->oa.o_grant);
-	OBD_FREE_PTR(body);
+	kfree(body);
 	return rc;
 }
 
@@ -1748,7 +1749,7 @@ static void sort_brw_pages(struct brw_pa
 static void osc_release_ppga(struct brw_page **ppga, u32 count)
 {
 	LASSERT(ppga != NULL);
-	OBD_FREE(ppga, sizeof(*ppga) * count);
+	kfree(ppga);
 }
 
 static int brw_interpret(const struct lu_env *env,
@@ -1908,13 +1909,13 @@ int osc_build_rpc(const struct lu_env *e
 	if (mem_tight)
 		mpflag = cfs_memory_pressure_get_and_set();
 
-	OBD_ALLOC(crattr, sizeof(*crattr));
+	crattr = kzalloc(sizeof(*crattr), GFP_NOFS);
 	if (crattr = NULL) {
 		rc = -ENOMEM;
 		goto out;
 	}
 
-	OBD_ALLOC(pga, sizeof(*pga) * page_count);
+	pga = kcalloc(page_count, sizeof(*pga), GFP_NOFS);
 	if (pga = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -2055,7 +2056,7 @@ out:
 
 	if (crattr != NULL) {
 		capa_put(crattr->cra_capa);
-		OBD_FREE(crattr, sizeof(*crattr));
+		kfree(crattr);
 	}
 
 	if (rc != 0) {
@@ -2064,7 +2065,7 @@ out:
 		if (oa)
 			OBDO_FREE(oa);
 		if (pga)
-			OBD_FREE(pga, sizeof(*pga) * page_count);
+			kfree(pga);
 		/* this should happen rarely and is pretty bad, it makes the
 		 * pending list not follow the dirty order */
 		while (!list_empty(ext_list)) {
@@ -2617,7 +2618,7 @@ static int osc_getstripe(struct lov_stri
 	 * because lov_user_md_vX and lov_mds_md_vX have the same size */
 	if (lum.lmm_stripe_count > 0) {
 		lum_size = lov_mds_md_size(lum.lmm_stripe_count, lum.lmm_magic);
-		OBD_ALLOC(lumk, lum_size);
+		lumk = kzalloc(lum_size, GFP_NOFS);
 		if (!lumk)
 			return -ENOMEM;
 
@@ -2639,7 +2640,7 @@ static int osc_getstripe(struct lov_stri
 		rc = -EFAULT;
 
 	if (lumk != &lum)
-		OBD_FREE(lumk, lum_size);
+		kfree(lumk);
 
 	return rc;
 }
diff -u -p a/drivers/staging/lustre/lustre/osc/osc_dev.c b/drivers/staging/lustre/lustre/osc/osc_dev.c
--- a/drivers/staging/lustre/lustre/osc/osc_dev.c
+++ b/drivers/staging/lustre/lustre/osc/osc_dev.c
@@ -204,7 +204,7 @@ static struct lu_device *osc_device_free
 	struct osc_device *od = lu2osc_dev(d);
 
 	cl_device_fini(lu2cl_dev(d));
-	OBD_FREE_PTR(od);
+	kfree(od);
 	return NULL;
 }
 
@@ -217,7 +217,7 @@ static struct lu_device *osc_device_allo
 	struct obd_device *obd;
 	int rc;
 
-	OBD_ALLOC_PTR(od);
+	od = kzalloc(sizeof(*od), GFP_NOFS);
 	if (od = NULL)
 		return ERR_PTR(-ENOMEM);
 

