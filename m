From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 08 Jun 2015 12:53:18 +0000
Subject: [PATCH 1/3] lustre: lov: Drop lov_lock_handles structure
Message-Id: <1433768000-30964-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The lov_lock_handles structure is only used as the type of the field
set_lockh in the lov_request_set structure, and this field is never set to
any value.  Drop a test and free of this field in lov_finish_set.  This
change enables also removing the functions lov_handle2llh and lov_llh_put
that manipulate values of type lov_lock_handles, but are now never called.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lov/lov_internal.h |   34 -----------------------
 drivers/staging/lustre/lustre/lov/lov_request.c  |    3 --
 2 files changed, 37 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_internal.h b/drivers/staging/lustre/lustre/lov/lov_internal.h
index 5e8bcc6..f52a90c 100644
--- a/drivers/staging/lustre/lustre/lov/lov_internal.h
+++ b/drivers/staging/lustre/lustre/lov/lov_internal.h
@@ -71,13 +71,6 @@
 })
 #endif
 
-struct lov_lock_handles {
-	struct portals_handle   llh_handle;
-	atomic_t	    llh_refcount;
-	int		     llh_stripe_count;
-	struct lustre_handle    llh_handles[0];
-};
-
 struct lov_request {
 	struct obd_info	  rq_oi;
 	struct lov_request_set  *rq_rqset;
@@ -111,7 +104,6 @@ struct lov_request_set {
 	struct obd_trans_info		*set_oti;
 	u32				set_oabufs;
 	struct brw_page			*set_pga;
-	struct lov_lock_handles		*set_lockh;
 	struct list_head			set_list;
 	wait_queue_head_t			set_waitq;
 	spinlock_t			set_lock;
@@ -136,32 +128,6 @@ static inline void lov_put_reqset(struct lov_request_set *set)
 		lov_finish_set(set);
 }
 
-static inline struct lov_lock_handles *
-lov_handle2llh(struct lustre_handle *handle)
-{
-	LASSERT(handle != NULL);
-	return class_handle2object(handle->cookie);
-}
-
-static inline void lov_llh_put(struct lov_lock_handles *llh)
-{
-	CDEBUG(D_INFO, "PUTting llh %p : new refcount %d\n", llh,
-	       atomic_read(&llh->llh_refcount) - 1);
-	LASSERT(atomic_read(&llh->llh_refcount) > 0 &&
-		atomic_read(&llh->llh_refcount) < 0x5a5a);
-	if (atomic_dec_and_test(&llh->llh_refcount)) {
-		class_handle_unhash(&llh->llh_handle);
-		/* The structure may be held by other threads because RCU.
-		 *   -jxiong */
-		if (atomic_read(&llh->llh_refcount))
-			return;
-
-		OBD_FREE_RCU(llh, sizeof(*llh) +
-			     sizeof(*llh->llh_handles) * llh->llh_stripe_count,
-			     &llh->llh_handle);
-	}
-}
-
 #define lov_uuid2str(lv, index) \
 	(char *)((lv)->lov_tgts[index]->ltd_uuid.uuid)
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_request.c b/drivers/staging/lustre/lustre/lov/lov_request.c
index f6e1314..7769f14 100644
--- a/drivers/staging/lustre/lustre/lov/lov_request.c
+++ b/drivers/staging/lustre/lustre/lov/lov_request.c
@@ -78,9 +78,6 @@ void lov_finish_set(struct lov_request_set *set)
 		int len = set->set_oabufs * sizeof(*set->set_pga);
 		OBD_FREE_LARGE(set->set_pga, len);
 	}
-	if (set->set_lockh)
-		lov_llh_put(set->set_lockh);
-
 	kfree(set);
 }
 

