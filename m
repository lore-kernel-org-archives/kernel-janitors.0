From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:14 +0000
Subject: [PATCH 9/11] staging: lustre: obdecho: Use kzalloc and kfree
Message-Id: <1430495482-933-4-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdecho/echo_client.c |   42 ++++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/obdecho/echo_client.c b/drivers/staging/lustre/lustre/obdecho/echo_client.c
--- a/drivers/staging/lustre/lustre/obdecho/echo_client.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo_client.c
@@ -479,13 +479,13 @@ static int echo_alloc_memmd(struct echo_
 	lsm_size = lov_stripe_md_size(1);
 
 	LASSERT(*lsmp = NULL);
-	OBD_ALLOC(*lsmp, lsm_size);
+	*lsmp = kzalloc(lsm_size, GFP_NOFS);
 	if (*lsmp = NULL)
 		return -ENOMEM;
 
-	OBD_ALLOC((*lsmp)->lsm_oinfo[0], sizeof(struct lov_oinfo));
+	(*lsmp)->lsm_oinfo[0] = kzalloc(sizeof(struct lov_oinfo), GFP_NOFS);
 	if ((*lsmp)->lsm_oinfo[0] = NULL) {
-		OBD_FREE(*lsmp, lsm_size);
+		kfree(*lsmp);
 		return -ENOMEM;
 	}
 
@@ -507,8 +507,8 @@ static int echo_free_memmd(struct echo_d
 	lsm_size = lov_stripe_md_size(1);
 
 	LASSERT(*lsmp != NULL);
-	OBD_FREE((*lsmp)->lsm_oinfo[0], sizeof(struct lov_oinfo));
-	OBD_FREE(*lsmp, lsm_size);
+	kfree((*lsmp)->lsm_oinfo[0]);
+	kfree(*lsmp);
 	*lsmp = NULL;
 	return 0;
 }
@@ -700,7 +700,7 @@ static struct lu_device *echo_device_all
 	int rc;
 	int cleanup = 0;
 
-	OBD_ALLOC_PTR(ed);
+	ed = kzalloc(sizeof(*ed), GFP_NOFS);
 	if (ed = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -798,7 +798,7 @@ out:
 	case 2:
 		cl_device_fini(&ed->ed_cl);
 	case 1:
-		OBD_FREE_PTR(ed);
+		kfree(ed);
 	case 0:
 	default:
 		break;
@@ -895,7 +895,7 @@ static struct lu_device *echo_device_fre
 	LASSERT(ed->ed_site = lu2cl_site(d->ld_site));
 	echo_site_fini(env, ed);
 	cl_device_fini(&ed->ed_cl);
-	OBD_FREE_PTR(ed);
+	kfree(ed);
 
 	return NULL;
 }
@@ -1577,13 +1577,13 @@ static int echo_client_kbrw(struct echo_
 	if (rw = OBD_BRW_WRITE)
 		brw_flags = OBD_BRW_ASYNC;
 
-	OBD_ALLOC(pga, npages * sizeof(*pga));
+	pga = kcalloc(npages, sizeof(*pga), GFP_NOFS);
 	if (pga = NULL)
 		return -ENOMEM;
 
-	OBD_ALLOC(pages, npages * sizeof(*pages));
+	pages = kcalloc(npages, sizeof(*pages), GFP_NOFS);
 	if (pages = NULL) {
-		OBD_FREE(pga, npages * sizeof(*pga));
+		kfree(pga);
 		return -ENOMEM;
 	}
 
@@ -1632,8 +1632,8 @@ static int echo_client_kbrw(struct echo_
 		}
 		OBD_PAGE_FREE(pgp->pg);
 	}
-	OBD_FREE(pga, npages * sizeof(*pga));
-	OBD_FREE(pages, npages * sizeof(*pages));
+	kfree(pga);
+	kfree(pages);
 	return rc;
 }
 
@@ -1659,8 +1659,8 @@ static int echo_client_prep_commit(const
 	npages = batch >> PAGE_CACHE_SHIFT;
 	tot_pages = count >> PAGE_CACHE_SHIFT;
 
-	OBD_ALLOC(lnb, npages * sizeof(struct niobuf_local));
-	OBD_ALLOC(rnb, npages * sizeof(struct niobuf_remote));
+	lnb = kcalloc(npages, sizeof(struct niobuf_local), GFP_NOFS);
+	rnb = kcalloc(npages, sizeof(struct niobuf_remote), GFP_NOFS);
 
 	if (lnb = NULL || rnb = NULL) {
 		ret = -ENOMEM;
@@ -1738,9 +1738,9 @@ static int echo_client_prep_commit(const
 
 out:
 	if (lnb)
-		OBD_FREE(lnb, npages * sizeof(struct niobuf_local));
+		kfree(lnb);
 	if (rnb)
-		OBD_FREE(rnb, npages * sizeof(struct niobuf_remote));
+		kfree(rnb);
 	return ret;
 }
 
@@ -1879,7 +1879,7 @@ echo_client_iocontrol(unsigned int cmd,
 	if (rc < 0)
 		return rc;
 
-	OBD_ALLOC_PTR(env);
+	env = kzalloc(sizeof(*env), GFP_NOFS);
 	if (env = NULL)
 		return -ENOMEM;
 
@@ -2010,7 +2010,7 @@ echo_client_iocontrol(unsigned int cmd,
 
 out:
 	lu_env_fini(env);
-	OBD_FREE_PTR(env);
+	kfree(env);
 
 	/* XXX this should be in a helper also called by target_send_reply */
 	for (ack_lock = dummy_oti.oti_ack_locks, i = 0; i < 4;
@@ -2050,7 +2050,7 @@ static int echo_client_setup(const struc
 	ec->ec_unique = 0;
 	ec->ec_nstripes = 0;
 
-	OBD_ALLOC(ocd, sizeof(*ocd));
+	ocd = kzalloc(sizeof(*ocd), GFP_NOFS);
 	if (ocd = NULL) {
 		CERROR("Can't alloc ocd connecting to %s\n",
 		       lustre_cfg_string(lcfg, 1));
@@ -2074,7 +2074,7 @@ static int echo_client_setup(const struc
 		spin_unlock(&tgt->obd_dev_lock);
 	}
 
-	OBD_FREE(ocd, sizeof(*ocd));
+	kfree(ocd);
 
 	if (rc != 0) {
 		CERROR("fail to connect to device %s\n",

