From: Dan Carpenter <error27@gmail.com>
Date: Sat, 17 Jul 2010 10:29:00 +0000
Subject: [patch] infiniband: cxgb3: fix signed bug
Message-Id: <20100717102900.GG17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Zago <fzago-klaOcWyJdxkshyMvu7JE4pqQE7yCjDx5@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"num_wrs" should be signed so that the "if (num_wrs <= 0)" checks work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/hw/cxgb3/iwch_qp.c b/drivers/infiniband/hw/cxgb3/iwch_qp.c
index ae47bfd..e90fb2d 100644
--- a/drivers/infiniband/hw/cxgb3/iwch_qp.c
+++ b/drivers/infiniband/hw/cxgb3/iwch_qp.c
@@ -357,7 +357,7 @@ int iwch_post_send(struct ib_qp *ibqp, struct ib_send_wr *wr,
 	struct iwch_qp *qhp;
 	u32 idx;
 	union t3_wr *wqe;
-	u32 num_wrs;
+	int num_wrs;
 	unsigned long flag;
 	struct t3_swsq *sqp;
 	int wr_cnt = 1;
@@ -535,7 +535,7 @@ int iwch_bind_mw(struct ib_qp *qp,
 	union t3_wr *wqe;
 	u32 pbl_addr;
 	u8 page_size;
-	u32 num_wrs;
+	int num_wrs;
 	unsigned long flag;
 	struct ib_sge sgl;
 	int err=0;
@@ -554,7 +554,7 @@ int iwch_bind_mw(struct ib_qp *qp,
 	}
 	num_wrs = Q_FREECNT(qhp->wq.sq_rptr, qhp->wq.sq_wptr,
 			    qhp->wq.sq_size_log2);
-	if ((num_wrs) <= 0) {
+	if (num_wrs <= 0) {
 		spin_unlock_irqrestore(&qhp->lock, flag);
 		return -ENOMEM;
 	}
