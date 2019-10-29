From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 29 Oct 2019 01:55:23 +0000
Subject: [PATCH -next] crypto: amlogic - Use kmemdup in meson_aes_setkey()
Message-Id: <20191029015523.126987-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Labbe <clabbe@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index e9283ffdbd23..78e776c58705 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -372,10 +372,9 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		kfree(op->key);
 	}
 	op->keylen = keylen;
-	op->key = kmalloc(keylen, GFP_KERNEL | GFP_DMA);
+	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
-	memcpy(op->key, key, keylen);
 
 	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
