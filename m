From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:18 +0000
Subject: [PATCH 5/11] staging: lustre: lmv: Use kzalloc and kfree
Message-Id: <1430495482-933-8-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/lmv/lmv_intent.c |    4 +--
 drivers/staging/lustre/lustre/lmv/lmv_obd.c    |   28 ++++++++++++-------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/lmv/lmv_obd.c b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
--- a/drivers/staging/lustre/lustre/lmv/lmv_obd.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
@@ -442,7 +442,7 @@ static void lmv_del_target(struct lmv_ob
 	if (lmv->tgts[index] = NULL)
 		return;
 
-	OBD_FREE_PTR(lmv->tgts[index]);
+	kfree(lmv->tgts[index]);
 	lmv->tgts[index] = NULL;
 	return;
 }
@@ -488,7 +488,7 @@ static int lmv_add_target(struct obd_dev
 
 		while (newsize < index + 1)
 			newsize <<= 1;
-		OBD_ALLOC(newtgts, sizeof(*newtgts) * newsize);
+		newtgts = kcalloc(newsize, sizeof(*newtgts), GFP_NOFS);
 		if (newtgts = NULL) {
 			lmv_init_unlock(lmv);
 			return -ENOMEM;
@@ -505,13 +505,13 @@ static int lmv_add_target(struct obd_dev
 		lmv->tgts_size = newsize;
 		smp_rmb();
 		if (old)
-			OBD_FREE(old, sizeof(*old) * oldsize);
+			kfree(old);
 
 		CDEBUG(D_CONFIG, "tgts: %p size: %d\n", lmv->tgts,
 		       lmv->tgts_size);
 	}
 
-	OBD_ALLOC_PTR(tgt);
+	tgt = kzalloc(sizeof(*tgt), GFP_NOFS);
 	if (!tgt) {
 		lmv_init_unlock(lmv);
 		return -ENOMEM;
@@ -750,7 +750,7 @@ repeat_fid2path:
 	/* sigh, has to go to another MDT to do path building further */
 	if (remote_gf = NULL) {
 		remote_gf_size = sizeof(*remote_gf) + PATH_MAX;
-		OBD_ALLOC(remote_gf, remote_gf_size);
+		remote_gf = kzalloc(remote_gf_size, GFP_NOFS);
 		if (remote_gf = NULL) {
 			rc = -ENOMEM;
 			goto out_fid2path;
@@ -781,7 +781,7 @@ repeat_fid2path:
 
 out_fid2path:
 	if (remote_gf != NULL)
-		OBD_FREE(remote_gf, remote_gf_size);
+		kfree(remote_gf);
 	return rc;
 }
 
@@ -984,7 +984,7 @@ static int lmv_iocontrol(unsigned int cm
 			return -EAGAIN;
 
 		LASSERT(tgt && tgt->ltd_exp);
-		OBD_ALLOC_PTR(oqctl);
+		oqctl = kzalloc(sizeof(*oqctl), GFP_NOFS);
 		if (!oqctl)
 			return -ENOMEM;
 
@@ -995,7 +995,7 @@ static int lmv_iocontrol(unsigned int cm
 			qctl->qc_valid = QC_MDTIDX;
 			qctl->obd_uuid = tgt->ltd_uuid;
 		}
-		OBD_FREE_PTR(oqctl);
+		kfree(oqctl);
 		break;
 	}
 	case OBD_IOC_CHANGELOG_SEND:
@@ -1327,7 +1327,7 @@ static int lmv_setup(struct obd_device *
 		return -EINVAL;
 	}
 
-	OBD_ALLOC(lmv->tgts, sizeof(*lmv->tgts) * 32);
+	lmv->tgts = kcalloc(32, sizeof(*lmv->tgts), GFP_NOFS);
 	if (lmv->tgts = NULL)
 		return -ENOMEM;
 	lmv->tgts_size = 32;
@@ -1380,7 +1380,7 @@ static int lmv_cleanup(struct obd_device
 				continue;
 			lmv_del_target(lmv, i);
 		}
-		OBD_FREE(lmv->tgts, sizeof(*lmv->tgts) * lmv->tgts_size);
+		kfree(lmv->tgts);
 		lmv->tgts_size = 0;
 	}
 	return 0;
@@ -1437,7 +1437,7 @@ static int lmv_statfs(const struct lu_en
 	if (rc)
 		return rc;
 
-	OBD_ALLOC(temp, sizeof(*temp));
+	temp = kzalloc(sizeof(*temp), GFP_NOFS);
 	if (temp = NULL)
 		return -ENOMEM;
 
@@ -1473,7 +1473,7 @@ static int lmv_statfs(const struct lu_en
 	}
 
 out_free_temp:
-	OBD_FREE(temp, sizeof(*temp));
+	kfree(temp);
 	return rc;
 }
 
@@ -1769,7 +1769,7 @@ lmv_enqueue_remote(struct obd_export *ex
 		goto out;
 	}
 
-	OBD_ALLOC_PTR(rdata);
+	rdata = kzalloc(sizeof(*rdata), GFP_NOFS);
 	if (rdata = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1780,7 +1780,7 @@ lmv_enqueue_remote(struct obd_export *ex
 
 	rc = md_enqueue(tgt->ltd_exp, einfo, it, rdata, lockh,
 			lmm, lmmsize, NULL, extra_lock_flags);
-	OBD_FREE_PTR(rdata);
+	kfree(rdata);
 out:
 	ldlm_lock_decref(&plock, pmode);
 	return rc;
diff -u -p a/drivers/staging/lustre/lustre/lmv/lmv_intent.c b/drivers/staging/lustre/lustre/lmv/lmv_intent.c
--- a/drivers/staging/lustre/lustre/lmv/lmv_intent.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_intent.c
@@ -99,7 +99,7 @@ static int lmv_intent_remote(struct obd_
 		goto out;
 	}
 
-	OBD_ALLOC_PTR(op_data);
+	op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
 	if (op_data = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -142,7 +142,7 @@ static int lmv_intent_remote(struct obd_
 	it->d.lustre.it_lock_mode = pmode;
 
 out_free_op_data:
-	OBD_FREE_PTR(op_data);
+	kfree(op_data);
 out:
 	if (rc && pmode)
 		ldlm_lock_decref(&plock, pmode);

