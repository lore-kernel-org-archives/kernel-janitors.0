From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Oct 2019 12:06:21 +0000
Subject: [PATCH -next] crypto: Use PTR_ERR_OR_ZERO in safexcel_xcbcmac_cra_init()
Message-Id: <20191009120621.45834-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Tenart <antoine.tenart@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/inside-secure/safexcel_hash.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index 85c3a075f283..a07a2915fab1 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -2109,10 +2109,7 @@ static int safexcel_xcbcmac_cra_init(struct crypto_tfm *tfm)
 
 	safexcel_ahash_cra_init(tfm);
 	ctx->kaes = crypto_alloc_cipher("aes", 0, 0);
-	if (IS_ERR(ctx->kaes))
-		return PTR_ERR(ctx->kaes);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->kaes);
 }
 
 static void safexcel_xcbcmac_cra_exit(struct crypto_tfm *tfm)
