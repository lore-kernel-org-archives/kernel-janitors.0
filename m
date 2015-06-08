From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 08 Jun 2015 12:53:19 +0000
Subject: [PATCH 2/3] lustre: lov: Drop unneeded set_oabufs and set_pga fields
Message-Id: <1433768000-30964-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The fields set_oabufs and set_pga fields in the lov_request_set structure
are never set, so drop them.  Drop also the corresponding test and free in
lov_finish_set.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lov/lov_internal.h |    2 --
 drivers/staging/lustre/lustre/lov/lov_request.c  |    5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_internal.h b/drivers/staging/lustre/lustre/lov/lov_internal.h
index f52a90c..e4e0cfd 100644
--- a/drivers/staging/lustre/lustre/lov/lov_internal.h
+++ b/drivers/staging/lustre/lustre/lov/lov_internal.h
@@ -102,8 +102,6 @@ struct lov_request_set {
 	struct llog_cookie		*set_cookies;
 	int				set_cookie_sent;
 	struct obd_trans_info		*set_oti;
-	u32				set_oabufs;
-	struct brw_page			*set_pga;
 	struct list_head			set_list;
 	wait_queue_head_t			set_waitq;
 	spinlock_t			set_lock;
diff --git a/drivers/staging/lustre/lustre/lov/lov_request.c b/drivers/staging/lustre/lustre/lov/lov_request.c
index 7769f14..ada0a3c 100644
--- a/drivers/staging/lustre/lustre/lov/lov_request.c
+++ b/drivers/staging/lustre/lustre/lov/lov_request.c
@@ -73,11 +73,6 @@ void lov_finish_set(struct lov_request_set *set)
 		kfree(req->rq_oi.oi_osfs);
 		kfree(req);
 	}
-
-	if (set->set_pga) {
-		int len = set->set_oabufs * sizeof(*set->set_pga);
-		OBD_FREE_LARGE(set->set_pga, len);
-	}
 	kfree(set);
 }
 

