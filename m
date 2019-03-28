From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:36:01 +0000
Subject: [PATCH] crypto: caam/qi - Change a couple IS_ERR_OR_NULL() checks to IS_ERR()
Message-Id: <20190328143601.GQ32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

create_caam_req_fq() doesn't return NULL pointers so there is no need to
check.  The NULL checks are problematic because it's hard to say how a
NULL return should be handled, so removing the checks is a nice cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/caam/qi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index 7cb8b1755e57..9f08f84cca59 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -318,7 +318,7 @@ int caam_drv_ctx_update(struct caam_drv_ctx *drv_ctx, u32 *sh_desc)
 	/* Create a new req FQ in parked state */
 	new_fq = create_caam_req_fq(drv_ctx->qidev, drv_ctx->rsp_fq,
 				    drv_ctx->context_a, 0);
-	if (IS_ERR_OR_NULL(new_fq)) {
+	if (IS_ERR(new_fq)) {
 		dev_err(qidev, "FQ allocation for shdesc update failed\n");
 		return PTR_ERR(new_fq);
 	}
@@ -431,7 +431,7 @@ struct caam_drv_ctx *caam_drv_ctx_init(struct device *qidev,
 	/* Attach request FQ */
 	drv_ctx->req_fq = create_caam_req_fq(qidev, drv_ctx->rsp_fq, hwdesc,
 					     QMAN_INITFQ_FLAG_SCHED);
-	if (IS_ERR_OR_NULL(drv_ctx->req_fq)) {
+	if (IS_ERR(drv_ctx->req_fq)) {
 		dev_err(qidev, "create_caam_req_fq failed\n");
 		dma_unmap_single(qidev, hwdesc, size, DMA_BIDIRECTIONAL);
 		kfree(drv_ctx);
-- 
2.17.1
