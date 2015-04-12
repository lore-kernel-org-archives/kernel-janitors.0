From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 12 Apr 2015 21:19:49 +0000
Subject: [PATCH] staging: lustre: drop uses of some OBD alloc and free functions
Message-Id: <1428873589-15241-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428873589-15241-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428873589-15241-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
kzalloc or calloc, as appropriate.

Replace OBD_FREE and OBD_FREE_PTR by kfree.

A simplified version of the semantic patch that makes these changes in the
OBD_ALLOC/FREE case is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,e1,e2;
@@
- OBD_ALLOC(ptr,sizeof e1 * e2)
+ ptr = kcalloc(e2, sizeof e1, GFP_NOFS)

@@
expression ptr,size;
@@
- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@
expression ptr, size;
@@
- OBD_FREE(ptr, size);
+ kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lov/lov_dev.c     |   18 ++++++------
 drivers/staging/lustre/lustre/lov/lov_io.c      |    5 ++-
 drivers/staging/lustre/lustre/lov/lov_obd.c     |   21 +++++++-------
 drivers/staging/lustre/lustre/lov/lov_pool.c    |   18 ++++++------
 drivers/staging/lustre/lustre/lov/lov_request.c |   34 ++++++++++++------------
 drivers/staging/lustre/lustre/lov/lovsub_dev.c  |    4 +-
 6 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_dev.c b/drivers/staging/lustre/lustre/lov/lov_dev.c
index 711b837..63db87a 100644
--- a/drivers/staging/lustre/lustre/lov/lov_dev.c
+++ b/drivers/staging/lustre/lustre/lov/lov_dev.c
@@ -285,10 +285,10 @@ static void lov_emerg_free(struct lov_device_emerg **emrg, int nr)
 			LASSERT(em->emrg_page_list.pl_nr = 0);
 			if (em->emrg_env != NULL)
 				cl_env_put(em->emrg_env, &em->emrg_refcheck);
-			OBD_FREE_PTR(em);
+			kfree(em);
 		}
 	}
-	OBD_FREE(emrg, nr * sizeof(emrg[0]));
+	kfree(emrg);
 }
 
 static struct lu_device *lov_device_free(const struct lu_env *env,
@@ -299,10 +299,10 @@ static struct lu_device *lov_device_free(const struct lu_env *env,
 
 	cl_device_fini(lu2cl_dev(d));
 	if (ld->ld_target != NULL)
-		OBD_FREE(ld->ld_target, nr * sizeof(ld->ld_target[0]));
+		kfree(ld->ld_target);
 	if (ld->ld_emrg != NULL)
 		lov_emerg_free(ld->ld_emrg, nr);
-	OBD_FREE_PTR(ld);
+	kfree(ld);
 	return NULL;
 }
 
@@ -323,13 +323,13 @@ static struct lov_device_emerg **lov_emerg_alloc(int nr)
 	int i;
 	int result;
 
-	OBD_ALLOC(emerg, nr * sizeof(emerg[0]));
+	emerg = kcalloc(nr, sizeof(emerg[0]), GFP_NOFS);
 	if (emerg = NULL)
 		return ERR_PTR(-ENOMEM);
 	for (result = i = 0; i < nr && result = 0; i++) {
 		struct lov_device_emerg *em;
 
-		OBD_ALLOC_PTR(em);
+		em = kzalloc(sizeof(*em), GFP_NOFS);
 		if (em != NULL) {
 			emerg[i] = em;
 			cl_page_list_init(&em->emrg_page_list);
@@ -369,12 +369,12 @@ static int lov_expand_targets(const struct lu_env *env, struct lov_device *dev)
 		if (IS_ERR(emerg))
 			return PTR_ERR(emerg);
 
-		OBD_ALLOC(newd, tgt_size * sz);
+		newd = kcalloc(tgt_size, sz, GFP_NOFS);
 		if (newd != NULL) {
 			mutex_lock(&dev->ld_mutex);
 			if (sub_size > 0) {
 				memcpy(newd, dev->ld_target, sub_size * sz);
-				OBD_FREE(dev->ld_target, sub_size * sz);
+				kfree(dev->ld_target);
 			}
 			dev->ld_target    = newd;
 			dev->ld_target_nr = tgt_size;
@@ -478,7 +478,7 @@ static struct lu_device *lov_device_alloc(const struct lu_env *env,
 	struct obd_device *obd;
 	int rc;
 
-	OBD_ALLOC_PTR(ld);
+	ld = kzalloc(sizeof(*ld), GFP_NOFS);
 	if (ld = NULL)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_io.c b/drivers/staging/lustre/lustre/lov/lov_io.c
index cf96e0d..a043df0 100644
--- a/drivers/staging/lustre/lustre/lov/lov_io.c
+++ b/drivers/staging/lustre/lustre/lov/lov_io.c
@@ -70,7 +70,7 @@ static void lov_io_sub_fini(const struct lu_env *env, struct lov_io *lio,
 		if (sub->sub_stripe = lio->lis_single_subio_index)
 			lio->lis_single_subio_index = -1;
 		else if (!sub->sub_borrowed)
-			OBD_FREE_PTR(sub->sub_io);
+			kfree(sub->sub_io);
 		sub->sub_io = NULL;
 	}
 	if (sub->sub_env != NULL && !IS_ERR(sub->sub_env)) {
@@ -179,7 +179,8 @@ static int lov_io_sub_init(const struct lu_env *env, struct lov_io *lio,
 				sub->sub_io = &lio->lis_single_subio;
 				lio->lis_single_subio_index = stripe;
 			} else {
-				OBD_ALLOC_PTR(sub->sub_io);
+				sub->sub_io = kzalloc(sizeof(*sub->sub_io),
+						      GFP_NOFS);
 				if (sub->sub_io = NULL)
 					result = -ENOMEM;
 			}
diff --git a/drivers/staging/lustre/lustre/lov/lov_obd.c b/drivers/staging/lustre/lustre/lov/lov_obd.c
index 0278157..7e12538 100644
--- a/drivers/staging/lustre/lustre/lov/lov_obd.c
+++ b/drivers/staging/lustre/lustre/lov/lov_obd.c
@@ -554,7 +554,7 @@ static int lov_add_target(struct obd_device *obd, struct obd_uuid *uuidp,
 		newsize = max_t(__u32, lov->lov_tgt_size, 2);
 		while (newsize < index + 1)
 			newsize <<= 1;
-		OBD_ALLOC(newtgts, sizeof(*newtgts) * newsize);
+		newtgts = kcalloc(newsize, sizeof(*newtgts), GFP_NOFS);
 		if (newtgts = NULL) {
 			mutex_unlock(&lov->lov_lock);
 			return -ENOMEM;
@@ -571,13 +571,13 @@ static int lov_add_target(struct obd_device *obd, struct obd_uuid *uuidp,
 		lov->lov_tgt_size = newsize;
 		smp_rmb();
 		if (old)
-			OBD_FREE(old, sizeof(*old) * oldsize);
+			kfree(old);
 
 		CDEBUG(D_CONFIG, "tgts: %p size: %d\n",
 		       lov->lov_tgts, lov->lov_tgt_size);
 	}
 
-	OBD_ALLOC_PTR(tgt);
+	tgt = kzalloc(sizeof(*tgt), GFP_NOFS);
 	if (!tgt) {
 		mutex_unlock(&lov->lov_lock);
 		return -ENOMEM;
@@ -586,7 +586,7 @@ static int lov_add_target(struct obd_device *obd, struct obd_uuid *uuidp,
 	rc = lov_ost_pool_add(&lov->lov_packed, index, lov->lov_tgt_size);
 	if (rc) {
 		mutex_unlock(&lov->lov_lock);
-		OBD_FREE_PTR(tgt);
+		kfree(tgt);
 		return rc;
 	}
 
@@ -712,7 +712,7 @@ static void __lov_del_obd(struct obd_device *obd, struct lov_tgt_desc *tgt)
 	if (tgt->ltd_exp)
 		lov_disconnect_obd(obd, tgt);
 
-	OBD_FREE_PTR(tgt);
+	kfree(tgt);
 
 	/* Manual cleanup - no cleanup logs to clean up the osc's.  We must
 	   do it ourselves. And we can't do it from lov_cleanup,
@@ -903,8 +903,7 @@ static int lov_cleanup(struct obd_device *obd)
 			lov_del_target(obd, i, NULL, 0);
 		}
 		obd_putref(obd);
-		OBD_FREE(lov->lov_tgts, sizeof(*lov->lov_tgts) *
-			 lov->lov_tgt_size);
+		kfree(lov->lov_tgts);
 		lov->lov_tgt_size = 0;
 	}
 	return 0;
@@ -994,7 +993,7 @@ static int lov_recreate(struct obd_export *exp, struct obdo *src_oa,
 	LASSERT(src_oa->o_valid & OBD_MD_FLFLAGS &&
 		src_oa->o_flags & OBD_FL_RECREATE_OBJS);
 
-	OBD_ALLOC(obj_mdp, sizeof(*obj_mdp));
+	obj_mdp = kzalloc(sizeof(*obj_mdp), GFP_NOFS);
 	if (obj_mdp = NULL)
 		return -ENOMEM;
 
@@ -1032,7 +1031,7 @@ static int lov_recreate(struct obd_export *exp, struct obdo *src_oa,
 	rc = obd_create(NULL, lov->lov_tgts[ost_idx]->ltd_exp,
 			src_oa, &obj_mdp, oti);
 out:
-	OBD_FREE(obj_mdp, sizeof(*obj_mdp));
+	kfree(obj_mdp);
 	return rc;
 }
 
@@ -1532,7 +1531,7 @@ static int lov_iocontrol(unsigned int cmd, struct obd_export *exp, int len,
 			return -EAGAIN;
 
 		LASSERT(tgt && tgt->ltd_exp);
-		OBD_ALLOC_PTR(oqctl);
+		oqctl = kzalloc(sizeof(*oqctl), GFP_NOFS);
 		if (!oqctl)
 			return -ENOMEM;
 
@@ -1543,7 +1542,7 @@ static int lov_iocontrol(unsigned int cmd, struct obd_export *exp, int len,
 			qctl->qc_valid = QC_OSTIDX;
 			qctl->obd_uuid = tgt->ltd_uuid;
 		}
-		OBD_FREE_PTR(oqctl);
+		kfree(oqctl);
 		break;
 	}
 	default: {
diff --git a/drivers/staging/lustre/lustre/lov/lov_pool.c b/drivers/staging/lustre/lustre/lov/lov_pool.c
index d96163d..75301fa 100644
--- a/drivers/staging/lustre/lustre/lov/lov_pool.c
+++ b/drivers/staging/lustre/lustre/lov/lov_pool.c
@@ -67,7 +67,7 @@ void lov_pool_putref(struct pool_desc *pool)
 		LASSERT(pool->pool_proc_entry = NULL);
 		lov_ost_pool_free(&(pool->pool_rr.lqr_pool));
 		lov_ost_pool_free(&(pool->pool_obds));
-		OBD_FREE_PTR(pool);
+		kfree(pool);
 	}
 }
 
@@ -210,7 +210,7 @@ static void *pool_proc_start(struct seq_file *s, loff_t *pos)
 		return NULL;
 	}
 
-	OBD_ALLOC_PTR(iter);
+	iter = kzalloc(sizeof(*iter), GFP_NOFS);
 	if (!iter)
 		return ERR_PTR(-ENOMEM);
 	iter->magic = POOL_IT_MAGIC;
@@ -246,7 +246,7 @@ static void pool_proc_stop(struct seq_file *s, void *v)
 		 * will work */
 		s->private = iter->pool;
 		lov_pool_putref(iter->pool);
-		OBD_FREE_PTR(iter);
+		kfree(iter);
 	}
 	return;
 }
@@ -327,7 +327,7 @@ int lov_ost_pool_init(struct ost_pool *op, unsigned int count)
 	op->op_count = 0;
 	init_rwsem(&op->op_rw_sem);
 	op->op_size = count;
-	OBD_ALLOC(op->op_array, op->op_size * sizeof(op->op_array[0]));
+	op->op_array = kcalloc(op->op_size, sizeof(op->op_array[0]), GFP_NOFS);
 	if (op->op_array = NULL) {
 		op->op_size = 0;
 		return -ENOMEM;
@@ -347,13 +347,13 @@ int lov_ost_pool_extend(struct ost_pool *op, unsigned int min_count)
 		return 0;
 
 	new_size = max(min_count, 2 * op->op_size);
-	OBD_ALLOC(new, new_size * sizeof(op->op_array[0]));
+	new = kcalloc(new_size, sizeof(op->op_array[0]), GFP_NOFS);
 	if (new = NULL)
 		return -ENOMEM;
 
 	/* copy old array to new one */
 	memcpy(new, op->op_array, op->op_size * sizeof(op->op_array[0]));
-	OBD_FREE(op->op_array, op->op_size * sizeof(op->op_array[0]));
+	kfree(op->op_array);
 	op->op_array = new;
 	op->op_size = new_size;
 	return 0;
@@ -411,7 +411,7 @@ int lov_ost_pool_free(struct ost_pool *op)
 
 	down_write(&op->op_rw_sem);
 
-	OBD_FREE(op->op_array, op->op_size * sizeof(op->op_array[0]));
+	kfree(op->op_array);
 	op->op_array = NULL;
 	op->op_count = 0;
 	op->op_size = 0;
@@ -432,7 +432,7 @@ int lov_pool_new(struct obd_device *obd, char *poolname)
 	if (strlen(poolname) > LOV_MAXPOOLNAME)
 		return -ENAMETOOLONG;
 
-	OBD_ALLOC_PTR(new_pool);
+	new_pool = kzalloc(sizeof(*new_pool), GFP_NOFS);
 	if (new_pool = NULL)
 		return -ENOMEM;
 
@@ -498,7 +498,7 @@ out_err:
 	lov_ost_pool_free(&new_pool->pool_rr.lqr_pool);
 out_free_pool_obds:
 	lov_ost_pool_free(&new_pool->pool_obds);
-	OBD_FREE_PTR(new_pool);
+	kfree(new_pool);
 	return rc;
 }
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_request.c b/drivers/staging/lustre/lustre/lov/lov_request.c
index 933e2d1..0a8cdbe 100644
--- a/drivers/staging/lustre/lustre/lov/lov_request.c
+++ b/drivers/staging/lustre/lustre/lov/lov_request.c
@@ -71,9 +71,8 @@ void lov_finish_set(struct lov_request_set *set)
 		if (req->rq_oi.oi_md)
 			OBD_FREE_LARGE(req->rq_oi.oi_md, req->rq_buflen);
 		if (req->rq_oi.oi_osfs)
-			OBD_FREE(req->rq_oi.oi_osfs,
-				 sizeof(*req->rq_oi.oi_osfs));
-		OBD_FREE(req, sizeof(*req));
+			kfree(req->rq_oi.oi_osfs);
+		kfree(req);
 	}
 
 	if (set->set_pga) {
@@ -83,7 +82,7 @@ void lov_finish_set(struct lov_request_set *set)
 	if (set->set_lockh)
 		lov_llh_put(set->set_lockh);
 
-	OBD_FREE(set, sizeof(*set));
+	kfree(set);
 }
 
 int lov_set_finished(struct lov_request_set *set, int idempotent)
@@ -286,7 +285,7 @@ int lov_prep_getattr_set(struct obd_export *exp, struct obd_info *oinfo,
 	struct lov_obd *lov = &exp->exp_obd->u.lov;
 	int rc = 0, i;
 
-	OBD_ALLOC(set, sizeof(*set));
+	set = kzalloc(sizeof(*set), GFP_NOFS);
 	if (set = NULL)
 		return -ENOMEM;
 	lov_init_set(set);
@@ -312,7 +311,7 @@ int lov_prep_getattr_set(struct obd_export *exp, struct obd_info *oinfo,
 			continue;
 		}
 
-		OBD_ALLOC(req, sizeof(*req));
+		req = kzalloc(sizeof(*req), GFP_NOFS);
 		if (req = NULL) {
 			rc = -ENOMEM;
 			goto out_set;
@@ -323,7 +322,7 @@ int lov_prep_getattr_set(struct obd_export *exp, struct obd_info *oinfo,
 
 		OBDO_ALLOC(req->rq_oi.oi_oa);
 		if (req->rq_oi.oi_oa = NULL) {
-			OBD_FREE(req, sizeof(*req));
+			kfree(req);
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -369,7 +368,7 @@ int lov_prep_destroy_set(struct obd_export *exp, struct obd_info *oinfo,
 	struct lov_obd *lov = &exp->exp_obd->u.lov;
 	int rc = 0, i;
 
-	OBD_ALLOC(set, sizeof(*set));
+	set = kzalloc(sizeof(*set), GFP_NOFS);
 	if (set = NULL)
 		return -ENOMEM;
 	lov_init_set(set);
@@ -395,7 +394,7 @@ int lov_prep_destroy_set(struct obd_export *exp, struct obd_info *oinfo,
 			continue;
 		}
 
-		OBD_ALLOC(req, sizeof(*req));
+		req = kzalloc(sizeof(*req), GFP_NOFS);
 		if (req = NULL) {
 			rc = -ENOMEM;
 			goto out_set;
@@ -406,7 +405,7 @@ int lov_prep_destroy_set(struct obd_export *exp, struct obd_info *oinfo,
 
 		OBDO_ALLOC(req->rq_oi.oi_oa);
 		if (req->rq_oi.oi_oa = NULL) {
-			OBD_FREE(req, sizeof(*req));
+			kfree(req);
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -488,7 +487,7 @@ int lov_prep_setattr_set(struct obd_export *exp, struct obd_info *oinfo,
 	struct lov_obd *lov = &exp->exp_obd->u.lov;
 	int rc = 0, i;
 
-	OBD_ALLOC(set, sizeof(*set));
+	set = kzalloc(sizeof(*set), GFP_NOFS);
 	if (set = NULL)
 		return -ENOMEM;
 	lov_init_set(set);
@@ -511,7 +510,7 @@ int lov_prep_setattr_set(struct obd_export *exp, struct obd_info *oinfo,
 			continue;
 		}
 
-		OBD_ALLOC(req, sizeof(*req));
+		req = kzalloc(sizeof(*req), GFP_NOFS);
 		if (req = NULL) {
 			rc = -ENOMEM;
 			goto out_set;
@@ -521,7 +520,7 @@ int lov_prep_setattr_set(struct obd_export *exp, struct obd_info *oinfo,
 
 		OBDO_ALLOC(req->rq_oi.oi_oa);
 		if (req->rq_oi.oi_oa = NULL) {
-			OBD_FREE(req, sizeof(*req));
+			kfree(req);
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -716,7 +715,7 @@ int lov_prep_statfs_set(struct obd_device *obd, struct obd_info *oinfo,
 	struct lov_obd *lov = &obd->u.lov;
 	int rc = 0, i;
 
-	OBD_ALLOC(set, sizeof(*set));
+	set = kzalloc(sizeof(*set), GFP_NOFS);
 	if (set = NULL)
 		return -ENOMEM;
 	lov_init_set(set);
@@ -742,15 +741,16 @@ int lov_prep_statfs_set(struct obd_device *obd, struct obd_info *oinfo,
 			continue;
 		}
 
-		OBD_ALLOC(req, sizeof(*req));
+		req = kzalloc(sizeof(*req), GFP_NOFS);
 		if (req = NULL) {
 			rc = -ENOMEM;
 			goto out_set;
 		}
 
-		OBD_ALLOC(req->rq_oi.oi_osfs, sizeof(*req->rq_oi.oi_osfs));
+		req->rq_oi.oi_osfs = kzalloc(sizeof(*req->rq_oi.oi_osfs),
+					     GFP_NOFS);
 		if (req->rq_oi.oi_osfs = NULL) {
-			OBD_FREE(req, sizeof(*req));
+			kfree(req);
 			rc = -ENOMEM;
 			goto out_set;
 		}
diff --git a/drivers/staging/lustre/lustre/lov/lovsub_dev.c b/drivers/staging/lustre/lustre/lov/lovsub_dev.c
index 42336f1..90d9ec3 100644
--- a/drivers/staging/lustre/lustre/lov/lovsub_dev.c
+++ b/drivers/staging/lustre/lustre/lov/lovsub_dev.c
@@ -136,7 +136,7 @@ static struct lu_device *lovsub_device_free(const struct lu_env *env,
 		lu_site_print(env, d->ld_site, &msgdata, lu_cdebug_printer);
 	}
 	cl_device_fini(lu2cl_dev(d));
-	OBD_FREE_PTR(lsd);
+	kfree(lsd);
 	return next;
 }
 
@@ -172,7 +172,7 @@ static struct lu_device *lovsub_device_alloc(const struct lu_env *env,
 	struct lu_device     *d;
 	struct lovsub_device *lsd;
 
-	OBD_ALLOC_PTR(lsd);
+	lsd = kzalloc(sizeof(*lsd), GFP_NOFS);
 	if (lsd != NULL) {
 		int result;
 

