From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 03 Feb 2020 15:39:21 +0000
Subject: [PATCH -next] crypto: ccree - remove set but not used variable 'du_size'
Message-Id: <20200203153921.45273-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ofir Drang <ofir.drang@arm.com>, Gilad Ben-Yossef <gilad@benyossef.com>, Herbert Xu <herbert@gondor.apana.org.au>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Hulk Robot <hulkci@huawei.com>, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/ccree/cc_cipher.c: In function 'cc_setup_state_desc':
drivers/crypto/ccree/cc_cipher.c:536:15: warning:
 variable 'du_size' set but not used [-Wunused-but-set-variable]

commit 5c83e8ec4d51 ("crypto: ccree - fix FDE descriptor sequence")
involved this unused variable, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/ccree/cc_cipher.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 7d6252d892d7..b5133f57bc87 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -533,14 +533,6 @@ static void cc_setup_state_desc(struct crypto_tfm *tfm,
 	int flow_mode = ctx_p->flow_mode;
 	int direction = req_ctx->gen_ctx.op_type;
 	dma_addr_t iv_dma_addr = req_ctx->gen_ctx.iv_dma_addr;
-	unsigned int du_size = nbytes;
-
-	struct cc_crypto_alg *cc_alg -		container_of(tfm->__crt_alg, struct cc_crypto_alg,
-			     skcipher_alg.base);
-
-	if (cc_alg->data_unit)
-		du_size = cc_alg->data_unit;
 
 	switch (cipher_mode) {
 	case DRV_CIPHER_ECB:
