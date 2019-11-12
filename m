From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 12 Nov 2019 07:23:14 +0000
Subject: [PATCH v2 -next] crypto: sun8i-ce - Fix memdup.cocci warnings
Message-Id: <20191112072314.145064-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109024403.47106-1-yuehaibing@huawei.com>
In-Reply-To: <20191109024403.47106-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, Maxime Ripard <mripard@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: fix patch title 'sun8i-ss' -> 'sun8i-ce'
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f0e7c1e12da6..b6e7c346c3ae 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -396,10 +396,9 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		kfree(op->key);
 	}
 	op->keylen = keylen;
-	op->key = kmalloc(keylen, GFP_KERNEL | GFP_DMA);
+	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
-	memcpy(op->key, key, keylen);
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
@@ -422,10 +421,9 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		kfree(op->key);
 	}
 	op->keylen = keylen;
-	op->key = kmalloc(keylen, GFP_KERNEL | GFP_DMA);
+	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
-	memcpy(op->key, key, keylen);
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
