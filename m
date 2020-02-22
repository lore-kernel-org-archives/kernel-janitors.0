From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Feb 2020 14:24:09 +0000
Subject: [PATCH] crypto: hisilicon: remove redundant assignment of pointer ctx
Message-Id: <20200222142409.141057-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zaibo Xu <xuzaibo@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer ctx is being re-assigned with the same value as it
was initialized with. The second assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/hisilicon/sec2/sec_crypto.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/sec2/sec_crypto.c b/drivers/crypto/hisilicon/sec2/sec_crypto.c
index a2cfcc9ccd94..acd15507eb8a 100644
--- a/drivers/crypto/hisilicon/sec2/sec_crypto.c
+++ b/drivers/crypto/hisilicon/sec2/sec_crypto.c
@@ -447,7 +447,6 @@ static int sec_skcipher_init(struct crypto_skcipher *tfm)
 	struct sec_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int ret;
 
-	ctx = crypto_skcipher_ctx(tfm);
 	ctx->alg_type = SEC_SKCIPHER;
 	crypto_skcipher_set_reqsize(tfm, sizeof(struct sec_req));
 	ctx->c_ctx.ivsize = crypto_skcipher_ivsize(tfm);
-- 
2.25.0
