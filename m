From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Oct 2013 09:14:12 +0000
Subject: [patch] RDMA/cxgb4: underflows in c4iw_create_qp()
Message-Id: <20131019091411.GG9312@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

These sizes should be unsigned so we don't allow negative values and
have underflow bugs.  These can come from the user so there may be
security implications, but I have not tested this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
index 5829367..72ea152 100644
--- a/drivers/infiniband/hw/cxgb4/qp.c
+++ b/drivers/infiniband/hw/cxgb4/qp.c
@@ -1533,7 +1533,7 @@ struct ib_qp *c4iw_create_qp(struct ib_pd *pd, struct ib_qp_init_attr *attrs,
 	struct c4iw_cq *schp;
 	struct c4iw_cq *rchp;
 	struct c4iw_create_qp_resp uresp;
-	int sqsize, rqsize;
+	unsigned int sqsize, rqsize;
 	struct c4iw_ucontext *ucontext;
 	int ret;
 	struct c4iw_mm_entry *mm1, *mm2, *mm3, *mm4, *mm5 = NULL;
