From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:16 +0000
Subject: [PATCH 7/11] staging: lustre: mgc: Use kzalloc and kfree
Message-Id: <1430495482-933-6-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/mgc/mgc_request.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/mgc/mgc_request.c b/drivers/staging/lustre/lustre/mgc/mgc_request.c
--- a/drivers/staging/lustre/lustre/mgc/mgc_request.c
+++ b/drivers/staging/lustre/lustre/mgc/mgc_request.c
@@ -149,7 +149,7 @@ static void config_log_put(struct config
 			sptlrpc_conf_log_stop(cld->cld_logname);
 
 		class_export_put(cld->cld_mgcexp);
-		OBD_FREE(cld, sizeof(*cld) + strlen(cld->cld_logname) + 1);
+		kfree(cld);
 	}
 }
 
@@ -198,7 +198,7 @@ struct config_llog_data *do_config_log_a
 	CDEBUG(D_MGC, "do adding config log %s:%p\n", logname,
 	       cfg ? cfg->cfg_instance : NULL);
 
-	OBD_ALLOC(cld, sizeof(*cld) + strlen(logname) + 1);
+	cld = kzalloc(sizeof(*cld) + strlen(logname) + 1, GFP_NOFS);
 	if (!cld)
 		return ERR_PTR(-ENOMEM);
 
@@ -1129,14 +1129,14 @@ static int mgc_apply_recover_logs(struct
 	LASSERT(cfg->cfg_instance != NULL);
 	LASSERT(cfg->cfg_sb = cfg->cfg_instance);
 
-	OBD_ALLOC(inst, PAGE_CACHE_SIZE);
+	inst = kzalloc(PAGE_CACHE_SIZE, GFP_NOFS);
 	if (inst = NULL)
 		return -ENOMEM;
 
 	if (!IS_SERVER(lsi)) {
 		pos = snprintf(inst, PAGE_CACHE_SIZE, "%p", cfg->cfg_instance);
 		if (pos >= PAGE_CACHE_SIZE) {
-			OBD_FREE(inst, PAGE_CACHE_SIZE);
+			kfree(inst);
 			return -E2BIG;
 		}
 	} else {
@@ -1144,7 +1144,7 @@ static int mgc_apply_recover_logs(struct
 		rc = server_name2svname(lsi->lsi_svname, inst, NULL,
 					PAGE_CACHE_SIZE);
 		if (rc) {
-			OBD_FREE(inst, PAGE_CACHE_SIZE);
+			kfree(inst);
 			return -EINVAL;
 		}
 		pos = strlen(inst);
@@ -1302,7 +1302,7 @@ static int mgc_apply_recover_logs(struct
 		/* continue, even one with error */
 	}
 
-	OBD_FREE(inst, PAGE_CACHE_SIZE);
+	kfree(inst);
 	return rc;
 }
 
@@ -1336,7 +1336,7 @@ static int mgc_process_recover_log(struc
 	if (cfg->cfg_last_idx = 0) /* the first time */
 		nrpages = CONFIG_READ_NRPAGES_INIT;
 
-	OBD_ALLOC(pages, sizeof(*pages) * nrpages);
+	pages = kcalloc(nrpages, sizeof(*pages), GFP_NOFS);
 	if (pages = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1466,7 +1466,7 @@ out:
 				break;
 			__free_page(pages[i]);
 		}
-		OBD_FREE(pages, sizeof(*pages) * nrpages);
+		kfree(pages);
 	}
 	return rc;
 }
@@ -1494,7 +1494,7 @@ static int mgc_process_cfg_log(struct ob
 	if (cld->cld_cfg.cfg_sb)
 		lsi = s2lsi(cld->cld_cfg.cfg_sb);
 
-	OBD_ALLOC_PTR(env);
+	env = kzalloc(sizeof(*env), GFP_NOFS);
 	if (env = NULL)
 		return -ENOMEM;
 
@@ -1540,7 +1540,7 @@ out_pop:
 
 	lu_env_fini(env);
 out_free:
-	OBD_FREE_PTR(env);
+	kfree(env);
 	return rc;
 }
 

