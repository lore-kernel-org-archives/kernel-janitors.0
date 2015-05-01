From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:21 +0000
Subject: [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/fld/fld_cache.c   |   16 ++++++++--------
 drivers/staging/lustre/lustre/fld/fld_request.c |    8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/fld/fld_request.c b/drivers/staging/lustre/lustre/fld/fld_request.c
--- a/drivers/staging/lustre/lustre/fld/fld_request.c
+++ b/drivers/staging/lustre/lustre/fld/fld_request.c
@@ -221,7 +221,7 @@ int fld_client_add_target(struct lu_clie
 	CDEBUG(D_INFO, "%s: Adding target %s (idx %llu)\n",
 			fld->lcf_name, name, tar->ft_idx);
 
-	OBD_ALLOC_PTR(target);
+	target = kzalloc(sizeof(*target), GFP_NOFS);
 	if (target = NULL)
 		return -ENOMEM;
 
@@ -229,7 +229,7 @@ int fld_client_add_target(struct lu_clie
 	list_for_each_entry(tmp, &fld->lcf_targets, ft_chain) {
 		if (tmp->ft_idx = tar->ft_idx) {
 			spin_unlock(&fld->lcf_lock);
-			OBD_FREE_PTR(target);
+			kfree(target);
 			CERROR("Target %s exists in FLD and known as %s:#%llu\n",
 			       name, fld_target_name(tmp), tmp->ft_idx);
 			return -EEXIST;
@@ -268,7 +268,7 @@ int fld_client_del_target(struct lu_clie
 			if (target->ft_exp != NULL)
 				class_export_put(target->ft_exp);
 
-			OBD_FREE_PTR(target);
+			kfree(target);
 			return 0;
 		}
 	}
@@ -396,7 +396,7 @@ void fld_client_fini(struct lu_client_fl
 		list_del(&target->ft_chain);
 		if (target->ft_exp != NULL)
 			class_export_put(target->ft_exp);
-		OBD_FREE_PTR(target);
+		kfree(target);
 	}
 	spin_unlock(&fld->lcf_lock);
 
diff -u -p a/drivers/staging/lustre/lustre/fld/fld_cache.c b/drivers/staging/lustre/lustre/fld/fld_cache.c
--- a/drivers/staging/lustre/lustre/fld/fld_cache.c
+++ b/drivers/staging/lustre/lustre/fld/fld_cache.c
@@ -69,7 +69,7 @@ struct fld_cache *fld_cache_init(const c
 	LASSERT(name != NULL);
 	LASSERT(cache_threshold < cache_size);
 
-	OBD_ALLOC_PTR(cache);
+	cache = kzalloc(sizeof(*cache), GFP_NOFS);
 	if (cache = NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -116,7 +116,7 @@ void fld_cache_fini(struct fld_cache *ca
 	CDEBUG(D_INFO, "  Cache reqs: %llu\n", cache->fci_stat.fst_cache);
 	CDEBUG(D_INFO, "  Cache hits: %llu%%\n", pct);
 
-	OBD_FREE_PTR(cache);
+	kfree(cache);
 }
 
 /**
@@ -128,7 +128,7 @@ void fld_cache_entry_delete(struct fld_c
 	list_del(&node->fce_list);
 	list_del(&node->fce_lru);
 	cache->fci_cache_count--;
-	OBD_FREE_PTR(node);
+	kfree(node);
 }
 
 /**
@@ -268,7 +268,7 @@ static void fld_cache_punch_hole(struct
 
 	OBD_ALLOC_GFP(fldt, sizeof(*fldt), GFP_ATOMIC);
 	if (!fldt) {
-		OBD_FREE_PTR(f_new);
+		kfree(f_new);
 		/* overlap is not allowed, so dont mess up list. */
 		return;
 	}
@@ -315,7 +315,7 @@ static void fld_cache_overlap_handle(str
 		f_curr->fce_range.lsr_end = max(f_curr->fce_range.lsr_end,
 						new_end);
 
-		OBD_FREE_PTR(f_new);
+		kfree(f_new);
 		fld_fix_new_list(cache);
 
 	} else if (new_start <= f_curr->fce_range.lsr_start &&
@@ -324,7 +324,7 @@ static void fld_cache_overlap_handle(str
 		 *	 e.g. whole range migrated. update fld cache entry */
 
 		f_curr->fce_range = *range;
-		OBD_FREE_PTR(f_new);
+		kfree(f_new);
 		fld_fix_new_list(cache);
 
 	} else if (f_curr->fce_range.lsr_start < new_start &&
@@ -364,7 +364,7 @@ struct fld_cache_entry
 
 	LASSERT(range_is_sane(range));
 
-	OBD_ALLOC_PTR(f_new);
+	f_new = kzalloc(sizeof(*f_new), GFP_NOFS);
 	if (!f_new)
 		return ERR_PTR(-ENOMEM);
 
@@ -440,7 +440,7 @@ int fld_cache_insert(struct fld_cache *c
 	rc = fld_cache_insert_nolock(cache, flde);
 	write_unlock(&cache->fci_lock);
 	if (rc)
-		OBD_FREE_PTR(flde);
+		kfree(flde);
 
 	return rc;
 }

