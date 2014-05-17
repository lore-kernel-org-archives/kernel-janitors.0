From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 17 May 2014 18:23:00 +0000
Subject: [PATCH 4/4] IB: Remove redundant error check
Message-Id: <1400350980-30455-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Remove double checks, and move calls to pr_err and printk to the
first check. The simplified version of the coccinelle semantic
patch that fixes this issue is as follows:

// <smpl>
@@
expression E; identifier pr; expression list es;
@@
for(...;...;...){
...
-	if (E) break;
+	if (E){
+		pr(es);
+		break;
+	}
...
}
- if(E) pr(es);
// </smpl>

Tested by compilation only.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/infiniband/hw/ocrdma/ocrdma_hw.c |    6 +++---
 drivers/infiniband/ulp/srpt/ib_srpt.c    |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
index 3bbf201..f085a51 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
@@ -1839,11 +1839,11 @@ int ocrdma_reg_mr(struct ocrdma_dev *dev,
 
 		status = ocrdma_mbx_reg_mr_cont(dev, hwmr, cur_pbl_cnt,
 						pbl_offset, last);
-		if (status)
+		if (status) {
+			pr_err("%s() err. status=%d\n", __func__, status);
 			break;
+		}
 	}
-	if (status)
-		pr_err("%s() err. status=%d\n", __func__, status);
 
 	return status;
 }
diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index fe09f27..ab23b07 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -2875,13 +2875,13 @@ static int srpt_perform_rdmas(struct srpt_rdma_ch *ch,
 			wr.send_flags = IB_SEND_SIGNALED;
 
 		ret = ib_post_send(ch->qp, &wr, &bad_wr);
-		if (ret)
+		if (ret) {
+			printk(KERN_ERR "%s[%d]: ib_post_send() returned %d for %d/%d",
+			       __func__, __LINE__, ret, i, n_rdma);
 			break;
+		}
 	}
 
-	if (ret)
-		printk(KERN_ERR "%s[%d]: ib_post_send() returned %d for %d/%d",
-				 __func__, __LINE__, ret, i, n_rdma);
 	if (ret && i > 0) {
 		wr.num_sge = 0;
 		wr.wr_id = encode_wr_id(SRPT_RDMA_ABORT, ioctx->ioctx.index);

