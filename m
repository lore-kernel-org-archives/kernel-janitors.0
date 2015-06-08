From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 08 Jun 2015 12:53:20 +0000
Subject: [PATCH 3/3] lustre: lov: Drop rq_buflen field
Message-Id: <1433768000-30964-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The rq_buflen field of the lov_request structure is never initialized.  It
is only used in the free of req->rq_oi.oi_md in lov_finish_set.  But no
oi_md field is ever initialized to the result of calling OBD_ALLOC_LARGE.
So it seems that the call to OBD_FREE_LARGE in lov_finish_set and the
rq_buflen in the lov_request structure are simply not needed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lov/lov_internal.h |    1 -
 drivers/staging/lustre/lustre/lov/lov_request.c  |    2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_internal.h b/drivers/staging/lustre/lustre/lov/lov_internal.h
index e4e0cfd..dde9656 100644
--- a/drivers/staging/lustre/lustre/lov/lov_internal.h
+++ b/drivers/staging/lustre/lustre/lov/lov_internal.h
@@ -81,7 +81,6 @@ struct lov_request {
 	int		      rq_stripe;     /* stripe number */
 	int		      rq_complete;
 	int		      rq_rc;
-	int		      rq_buflen;     /* length of sub_md */
 
 	u32		      rq_oabufs;
 	u32		      rq_pgaidx;
diff --git a/drivers/staging/lustre/lustre/lov/lov_request.c b/drivers/staging/lustre/lustre/lov/lov_request.c
index ada0a3c..f4f2058 100644
--- a/drivers/staging/lustre/lustre/lov/lov_request.c
+++ b/drivers/staging/lustre/lustre/lov/lov_request.c
@@ -68,8 +68,6 @@ void lov_finish_set(struct lov_request_set *set)
 
 		if (req->rq_oi.oi_oa)
 			OBDO_FREE(req->rq_oi.oi_oa);
-		if (req->rq_oi.oi_md)
-			OBD_FREE_LARGE(req->rq_oi.oi_md, req->rq_buflen);
 		kfree(req->rq_oi.oi_osfs);
 		kfree(req);
 	}

