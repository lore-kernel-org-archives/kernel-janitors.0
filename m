From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2012 06:14:47 +0000
Subject: [patch 2/2] RDMA/ocrdma: tiny locking cleanup
Message-Id: <20120502061447.GB28894@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Parav Pandit <parav.pandit-laKkSmNT4hbQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We only need to disable the IRQs one time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index 0d1872f..df7836d 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -1431,7 +1431,7 @@ int ocrdma_destroy_qp(struct ib_qp *ibqp)
 	struct ocrdma_dev *dev;
 	struct ib_qp_attr attrs;
 	int attr_mask = IB_QP_STATE;
-	unsigned long wq_flags = 0, rq_flags = 0;
+	unsigned long wq_flags;
 
 	qp = get_ocrdma_qp(ibqp);
 	dev = qp->dev;
@@ -1455,12 +1455,12 @@ int ocrdma_destroy_qp(struct ib_qp *ibqp)
 	 */
 	spin_lock_irqsave(&qp->sq_cq->cq_lock, wq_flags);
 	if (qp->rq_cq && (qp->rq_cq != qp->sq_cq))
-		spin_lock_irqsave(&qp->rq_cq->cq_lock, rq_flags);
+		spin_lock(&qp->rq_cq->cq_lock);
 
 	ocrdma_del_qpn_map(dev, qp);
 
 	if (qp->rq_cq && (qp->rq_cq != qp->sq_cq))
-		spin_unlock_irqrestore(&qp->rq_cq->cq_lock, rq_flags);
+		spin_unlock(&qp->rq_cq->cq_lock);
 	spin_unlock_irqrestore(&qp->sq_cq->cq_lock, wq_flags);
 
 	if (!pd->uctx) {
