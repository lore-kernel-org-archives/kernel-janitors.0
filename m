From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Oct 2017 16:12:00 +0000
Subject: [PATCH] IB/core: remove redundant check on prot_sg_cnt
Message-Id: <20171009161200.4465-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, "J . Bruce Fields" <bfields@redhat.com>, Chuck Lever <chuck.lever@oracle.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

prot_sg_cnt cannot be zero as a previous check on ret (from which
prot_sg_cnt is assigned) returns -ENOMEM if is it zero.  Since
it cannot be zero we can simplify the code by removing the non
-zero check on prot_sg_cnt and redundant else statement.

Detected by CoverityScan, COD#1357188 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/rw.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
index 6ca607e8e293..c8963e91f92a 100644
--- a/drivers/infiniband/core/rw.c
+++ b/drivers/infiniband/core/rw.c
@@ -384,21 +384,17 @@ int rdma_rw_ctx_signature_init(struct rdma_rw_ctx *ctx, struct ib_qp *qp,
 	count += ret;
 	prev_wr = &ctx->sig->data.reg_wr.wr;
 
-	if (prot_sg_cnt) {
-		ret = rdma_rw_init_one_mr(qp, port_num, &ctx->sig->prot,
-				prot_sg, prot_sg_cnt, 0);
-		if (ret < 0)
-			goto out_destroy_data_mr;
-		count += ret;
+	ret = rdma_rw_init_one_mr(qp, port_num, &ctx->sig->prot,
+				  prot_sg, prot_sg_cnt, 0);
+	if (ret < 0)
+		goto out_destroy_data_mr;
+	count += ret;
 
-		if (ctx->sig->prot.inv_wr.next)
-			prev_wr->next = &ctx->sig->prot.inv_wr;
-		else
-			prev_wr->next = &ctx->sig->prot.reg_wr.wr;
-		prev_wr = &ctx->sig->prot.reg_wr.wr;
-	} else {
-		ctx->sig->prot.mr = NULL;
-	}
+	if (ctx->sig->prot.inv_wr.next)
+		prev_wr->next = &ctx->sig->prot.inv_wr;
+	else
+		prev_wr->next = &ctx->sig->prot.reg_wr.wr;
+	prev_wr = &ctx->sig->prot.reg_wr.wr;
 
 	ctx->sig->sig_mr = ib_mr_pool_get(qp, &qp->sig_mrs);
 	if (!ctx->sig->sig_mr) {
-- 
2.14.1

