From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 09:25:08 +0000
Subject: [PATCH] crypto: keembay-ocs-hcu - Fix a WARN() message
Message-Id: <X/WB9IlpyIi+5p5s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Declan Murphy <declan.murphy@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The first argument to WARN() is a condition and the messages is the
second argument is the string, so this WARN() will only display the
__func__ part of the message.

Fixes: ae832e329a8d ("crypto: keembay-ocs-hcu - Add HMAC support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/keembay/keembay-ocs-hcu-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/keembay/keembay-ocs-hcu-core.c b/drivers/crypto/keembay/keembay-ocs-hcu-core.c
index d547af047131..c4b97b4160e9 100644
--- a/drivers/crypto/keembay/keembay-ocs-hcu-core.c
+++ b/drivers/crypto/keembay/keembay-ocs-hcu-core.c
@@ -388,7 +388,7 @@ static int prepare_ipad(struct ahash_request *req)
 	 * longer keys are hashed by kmb_ocs_hcu_setkey()).
 	 */
 	if (ctx->key_len > rctx->blk_sz) {
-		WARN("%s: Invalid key length in tfm context\n", __func__);
+		WARN(1, "%s: Invalid key length in tfm context\n", __func__);
 		return -EINVAL;
 	}
 	memzero_explicit(&ctx->key[ctx->key_len],
-- 
2.29.2
