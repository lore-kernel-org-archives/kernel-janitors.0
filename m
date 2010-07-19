From: Dan Carpenter <error27@gmail.com>
Date: Mon, 19 Jul 2010 20:30:14 +0000
Subject: [patch v2] infiniband: cxgb3: clean up signed check
Message-Id: <20100719203014.GN17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100717102900.GG17585@bicker> <4C446509.3010400@opengridcomputing.com>
In-Reply-To: <4C446509.3010400-7bPotxP6k4+P2YhJcF5u+vpXobYPEAuW@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-7bPotxP6k4+P2YhJcF5u+vpXobYPEAuW@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Zago <fzago-klaOcWyJdxkshyMvu7JE4pqQE7yCjDx5@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Q_FREECNT() returns the number of spaces free.  This should never
be a negative amount.  Also the num_wrs is an unsigned int so it can
never be less than zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
In v1: I changed num_wrs to a signed int.

diff --git a/drivers/infiniband/hw/cxgb3/iwch_qp.c b/drivers/infiniband/hw/cxgb3/iwch_qp.c
index ae47bfd..6adc13f 100644
--- a/drivers/infiniband/hw/cxgb3/iwch_qp.c
+++ b/drivers/infiniband/hw/cxgb3/iwch_qp.c
@@ -371,7 +371,7 @@ int iwch_post_send(struct ib_qp *ibqp, struct ib_send_wr *wr,
 	}
 	num_wrs = Q_FREECNT(qhp->wq.sq_rptr, qhp->wq.sq_wptr,
 		  qhp->wq.sq_size_log2);
-	if (num_wrs <= 0) {
+	if (num_wrs = 0) {
 		spin_unlock_irqrestore(&qhp->lock, flag);
 		err = -ENOMEM;
 		goto out;
@@ -554,7 +554,7 @@ int iwch_bind_mw(struct ib_qp *qp,
 	}
 	num_wrs = Q_FREECNT(qhp->wq.sq_rptr, qhp->wq.sq_wptr,
 			    qhp->wq.sq_size_log2);
-	if ((num_wrs) <= 0) {
+	if (num_wrs = 0) {
 		spin_unlock_irqrestore(&qhp->lock, flag);
 		return -ENOMEM;
 	}
