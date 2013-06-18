From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2013 07:27:38 +0000
Subject: [patch] RDMA/cxgb3: timeout condition is never true
Message-Id: <20130618072738.GB12329@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a static checker fix.  "count" is unsigned so it's never -1.
Since "count" is 16 bits and the addition operation is implicitly
casted to int then there is no wrapping here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb3/iwch_qp.c b/drivers/infiniband/hw/cxgb3/iwch_qp.c
index e5649e8..b57c0be 100644
--- a/drivers/infiniband/hw/cxgb3/iwch_qp.c
+++ b/drivers/infiniband/hw/cxgb3/iwch_qp.c
@@ -883,7 +883,8 @@ u16 iwch_rqes_posted(struct iwch_qp *qhp)
 {
 	union t3_wr *wqe = qhp->wq.queue;
 	u16 count = 0;
-	while ((count+1) != 0 && fw_riwrh_opcode((struct fw_riwrh *)wqe) = T3_WR_RCV) {
+
+	while (count < USHRT_MAX && fw_riwrh_opcode((struct fw_riwrh *)wqe) = T3_WR_RCV) {
 		count++;
 		wqe++;
 	}
