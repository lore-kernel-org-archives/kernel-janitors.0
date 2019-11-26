From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:21:20 +0000
Subject: [PATCH] crypto: hisilicon - fix a NULL vs IS_ERR() bug in sec_create_qp_ctx()
Message-Id: <20191126122120.vnf6mxmvf25ppyeo@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zaibo Xu <xuzaibo@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Longfang Liu <liulongfang@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The hisi_acc_create_sgl_pool() function returns error pointers, it never
returns NULL pointers.

Fixes: 416d82204df4 ("crypto: hisilicon - add HiSilicon SEC V2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/hisilicon/sec2/sec_crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/hisilicon/sec2/sec_crypto.c b/drivers/crypto/hisilicon/sec2/sec_crypto.c
index dc1eb97d57f7..62b04e19067c 100644
--- a/drivers/crypto/hisilicon/sec2/sec_crypto.c
+++ b/drivers/crypto/hisilicon/sec2/sec_crypto.c
@@ -179,14 +179,14 @@ static int sec_create_qp_ctx(struct hisi_qm *qm, struct sec_ctx *ctx,
 
 	qp_ctx->c_in_pool = hisi_acc_create_sgl_pool(dev, QM_Q_DEPTH,
 						     SEC_SGL_SGE_NR);
-	if (!qp_ctx->c_in_pool) {
+	if (IS_ERR(qp_ctx->c_in_pool)) {
 		dev_err(dev, "fail to create sgl pool for input!\n");
 		goto err_free_req_list;
 	}
 
 	qp_ctx->c_out_pool = hisi_acc_create_sgl_pool(dev, QM_Q_DEPTH,
 						      SEC_SGL_SGE_NR);
-	if (!qp_ctx->c_out_pool) {
+	if (IS_ERR(qp_ctx->c_out_pool)) {
 		dev_err(dev, "fail to create sgl pool for output!\n");
 		goto err_free_c_in_pool;
 	}
-- 
2.11.0
