From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Nov 2016 11:00:05 +0000
Subject: [patch] IB/rxe: Remove unneeded cast in rxe_srq_from_attr()
Message-Id: <20161117110005.GB32143@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moni Shoua <monis-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

It makes me nervous when we cast pointer parameters.  I would estimate
that around 50% of the time, it indicates a bug.  Here the cast is not
needed becaue u32 and and unsigned int are the same thing.  Removing the
cast makes the code more robust and future proof in case any of the
types change.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/sw/rxe/rxe_srq.c b/drivers/infiniband/sw/rxe/rxe_srq.c
index 2a6e3cd..efc832a 100644
--- a/drivers/infiniband/sw/rxe/rxe_srq.c
+++ b/drivers/infiniband/sw/rxe/rxe_srq.c
@@ -169,7 +169,7 @@ int rxe_srq_from_attr(struct rxe_dev *rxe, struct rxe_srq *srq,
 			}
 		}
 
-		err = rxe_queue_resize(q, (unsigned int *)&attr->max_wr,
+		err = rxe_queue_resize(q, &attr->max_wr,
 				       rcv_wqe_size(srq->rq.max_sge),
 				       srq->rq.queue->ip ?
 						srq->rq.queue->ip->context :
