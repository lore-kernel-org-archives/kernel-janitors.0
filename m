From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:19 +0000
Subject: [PATCH 4/11] staging: lustre: ldlm: Use kzalloc and kfree
Message-Id: <1430495482-933-9-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/ldlm/ldlm_lib.c      |    6 +++---
 drivers/staging/lustre/lustre/ldlm/ldlm_lock.c     |   10 +++++-----
 drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c    |   14 +++++++-------
 drivers/staging/lustre/lustre/ldlm/ldlm_pool.c     |   10 +++++-----
 drivers/staging/lustre/lustre/ldlm/ldlm_resource.c |    8 ++++----
 5 files changed, 24 insertions(+), 24 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c b/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
@@ -590,7 +590,7 @@ struct ldlm_namespace *ldlm_namespace_ne
 			break;
 	}
 
-	OBD_ALLOC_PTR(ns);
+	ns = kzalloc(sizeof(*ns), GFP_NOFS);
 	if (!ns)
 		goto out_ref;
 
@@ -657,7 +657,7 @@ out_proc:
 out_hash:
 	cfs_hash_putref(ns->ns_rs_hash);
 out_ns:
-	OBD_FREE_PTR(ns);
+	kfree(ns);
 out_ref:
 	ldlm_put_ref();
 	return NULL;
@@ -904,7 +904,7 @@ void ldlm_namespace_free_post(struct ldl
 	 * this will cause issues related to using freed \a ns in poold
 	 * thread. */
 	LASSERT(list_empty(&ns->ns_list_chain));
-	OBD_FREE_PTR(ns);
+	kfree(ns);
 	ldlm_put_ref();
 }
 
@@ -1138,7 +1138,7 @@ ldlm_resource_get(struct ldlm_namespace
 			       ns->ns_obd->obd_name, name->name[0],
 			       name->name[1], rc);
 			if (res->lr_lvb_data) {
-				OBD_FREE(res->lr_lvb_data, res->lr_lvb_len);
+				kfree(res->lr_lvb_data);
 				res->lr_lvb_data = NULL;
 			}
 			res->lr_lvb_len = rc;
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c b/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_pool.c
@@ -746,7 +746,7 @@ static int ldlm_pool_proc_init(struct ld
 	char *var_name = NULL;
 	int rc = 0;
 
-	OBD_ALLOC(var_name, MAX_STRING_SIZE + 1);
+	var_name = kzalloc(MAX_STRING_SIZE + 1, GFP_NOFS);
 	if (!var_name)
 		return -ENOMEM;
 
@@ -828,7 +828,7 @@ static int ldlm_pool_proc_init(struct ld
 	rc = lprocfs_register_stats(pl->pl_proc_dir, "stats", pl->pl_stats);
 
 out_free_name:
-	OBD_FREE(var_name, MAX_STRING_SIZE + 1);
+	kfree(var_name);
 	return rc;
 }
 
@@ -1383,7 +1383,7 @@ static int ldlm_pools_thread_start(void)
 	if (ldlm_pools_thread != NULL)
 		return -EALREADY;
 
-	OBD_ALLOC_PTR(ldlm_pools_thread);
+	ldlm_pools_thread = kzalloc(sizeof(*ldlm_pools_thread), GFP_NOFS);
 	if (ldlm_pools_thread = NULL)
 		return -ENOMEM;
 
@@ -1394,7 +1394,7 @@ static int ldlm_pools_thread_start(void)
 			   "ldlm_poold");
 	if (IS_ERR(task)) {
 		CERROR("Can't start pool thread, error %ld\n", PTR_ERR(task));
-		OBD_FREE(ldlm_pools_thread, sizeof(*ldlm_pools_thread));
+		kfree(ldlm_pools_thread);
 		ldlm_pools_thread = NULL;
 		return PTR_ERR(task);
 	}
@@ -1417,7 +1417,7 @@ static void ldlm_pools_thread_stop(void)
 	 * in pools thread.
 	 */
 	wait_for_completion(&ldlm_pools_comp);
-	OBD_FREE_PTR(ldlm_pools_thread);
+	kfree(ldlm_pools_thread);
 	ldlm_pools_thread = NULL;
 }
 
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c
@@ -220,7 +220,7 @@ static void ldlm_handle_cp_callback(stru
 						     * variable length */
 			void *lvb_data;
 
-			OBD_ALLOC(lvb_data, lvb_len);
+			lvb_data = kzalloc(lvb_len, GFP_NOFS);
 			if (lvb_data = NULL) {
 				LDLM_ERROR(lock, "No memory: %d.\n", lvb_len);
 				rc = -ENOMEM;
@@ -448,7 +448,7 @@ static int ldlm_bl_to_thread(struct ldlm
 	if (cancel_flags & LCF_ASYNC) {
 		struct ldlm_bl_work_item *blwi;
 
-		OBD_ALLOC(blwi, sizeof(*blwi));
+		blwi = kzalloc(sizeof(*blwi), GFP_NOFS);
 		if (blwi = NULL)
 			return -ENOMEM;
 		init_blwi(blwi, ns, ld, cancels, count, lock, cancel_flags);
@@ -849,7 +849,7 @@ static int ldlm_bl_thread_main(void *arg
 			memory_pressure_clr();
 
 		if (blwi->blwi_flags & LCF_ASYNC)
-			OBD_FREE(blwi, sizeof(*blwi));
+			kfree(blwi);
 		else
 			complete(&blwi->blwi_comp);
 	}
@@ -1012,7 +1012,7 @@ static int ldlm_setup(void)
 	if (ldlm_state != NULL)
 		return -EALREADY;
 
-	OBD_ALLOC(ldlm_state, sizeof(*ldlm_state));
+	ldlm_state = kzalloc(sizeof(*ldlm_state), GFP_NOFS);
 	if (ldlm_state = NULL)
 		return -ENOMEM;
 
@@ -1059,7 +1059,7 @@ static int ldlm_setup(void)
 	}
 
 
-	OBD_ALLOC(blp, sizeof(*blp));
+	blp = kzalloc(sizeof(*blp), GFP_NOFS);
 	if (blp = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1129,7 +1129,7 @@ static int ldlm_cleanup(void)
 			wait_for_completion(&blp->blp_comp);
 		}
 
-		OBD_FREE(blp, sizeof(*blp));
+		kfree(blp);
 	}
 
 	if (ldlm_state->ldlm_cb_service != NULL)
@@ -1138,7 +1138,7 @@ static int ldlm_cleanup(void)
 	ldlm_proc_cleanup();
 
 
-	OBD_FREE(ldlm_state, sizeof(*ldlm_state));
+	kfree(ldlm_state);
 	ldlm_state = NULL;
 
 	return 0;
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
@@ -209,7 +209,7 @@ void ldlm_lock_put(struct ldlm_lock *loc
 		}
 
 		if (lock->l_lvb_data != NULL)
-			OBD_FREE(lock->l_lvb_data, lock->l_lvb_len);
+			kfree(lock->l_lvb_data);
 
 		ldlm_interval_free(ldlm_interval_detach(lock));
 		lu_ref_fini(&lock->l_reference);
@@ -1527,7 +1527,7 @@ struct ldlm_lock *ldlm_lock_create(struc
 
 	if (lvb_len) {
 		lock->l_lvb_len = lvb_len;
-		OBD_ALLOC(lock->l_lvb_data, lvb_len);
+		lock->l_lvb_data = kzalloc(lvb_len, GFP_NOFS);
 		if (lock->l_lvb_data = NULL)
 			goto out;
 	}
@@ -1791,7 +1791,7 @@ int ldlm_work_gl_ast_lock(struct ptlrpc_
 	LDLM_LOCK_RELEASE(lock);
 
 	if ((gl_work->gl_flags & LDLM_GL_WORK_NOFREE) = 0)
-		OBD_FREE_PTR(gl_work);
+		kfree(gl_work);
 
 	return rc;
 }
@@ -1812,7 +1812,7 @@ int ldlm_run_ast_work(struct ldlm_namesp
 	if (list_empty(rpc_list))
 		return 0;
 
-	OBD_ALLOC_PTR(arg);
+	arg = kzalloc(sizeof(*arg), GFP_NOFS);
 	if (arg = NULL)
 		return -ENOMEM;
 
@@ -1857,7 +1857,7 @@ int ldlm_run_ast_work(struct ldlm_namesp
 	rc = atomic_read(&arg->restart) ? -ERESTART : 0;
 	goto out;
 out:
-	OBD_FREE_PTR(arg);
+	kfree(arg);
 	return rc;
 }
 
diff -u -p a/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
@@ -73,7 +73,7 @@ static int import_set_conn(struct obd_im
 	}
 
 	if (create) {
-		OBD_ALLOC(imp_conn, sizeof(*imp_conn));
+		imp_conn = kzalloc(sizeof(*imp_conn), GFP_NOFS);
 		if (!imp_conn) {
 			rc = -ENOMEM;
 			goto out_put;
@@ -120,7 +120,7 @@ static int import_set_conn(struct obd_im
 	return 0;
 out_free:
 	if (imp_conn)
-		OBD_FREE(imp_conn, sizeof(*imp_conn));
+		kfree(imp_conn);
 out_put:
 	ptlrpc_connection_put(ptlrpc_conn);
 	return rc;
@@ -179,7 +179,7 @@ int client_import_del_conn(struct obd_im
 
 		list_del(&imp_conn->oic_item);
 		ptlrpc_connection_put(imp_conn->oic_conn);
-		OBD_FREE(imp_conn, sizeof(*imp_conn));
+		kfree(imp_conn);
 		CDEBUG(D_HA, "imp %p@%s: remove connection %s\n",
 		       imp, imp->imp_obd->obd_name, uuid->uuid);
 		rc = 0;

