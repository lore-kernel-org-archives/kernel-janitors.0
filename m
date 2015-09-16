From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:22:20 +0000
Subject: [patch] IB/hfi1: checking for NULL instead of IS_ERR
Message-Id: <20150916062220.GC21542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

__get_txreq() returns an ERR_PTR() but this checks for NULL so it would
oops on failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rdma/hfi1/verbs.c b/drivers/staging/rdma/hfi1/verbs.c
index 53ac214..41bb59e 100644
--- a/drivers/staging/rdma/hfi1/verbs.c
+++ b/drivers/staging/rdma/hfi1/verbs.c
@@ -749,11 +749,13 @@ static inline struct verbs_txreq *get_txreq(struct hfi1_ibdev *dev,
 	struct verbs_txreq *tx;
 
 	tx = kmem_cache_alloc(dev->verbs_txreq_cache, GFP_ATOMIC);
-	if (!tx)
+	if (!tx) {
 		/* call slow path to get the lock */
 		tx =  __get_txreq(dev, qp);
-	if (tx)
-		tx->qp = qp;
+		if (IS_ERR(tx))
+			return tx;
+	}
+	tx->qp = qp;
 	return tx;
 }
 
