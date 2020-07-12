From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Jul 2020 21:14:04 +0000
Subject: [PATCH 1/2] Crypto/chcr: Avoid some code duplication
Message-Id: <20200712211404.276211-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ayush.sawal@chelsio.com, vinay.yadav@chelsio.com, rohitm@chelsio.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The error handling path of 'chcr_authenc_setkey()' is the same as this
error handling code.

So just 'goto out' as done everywhere in the function to simplify the code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/chelsio/chcr_algo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 4c2553672b6f..ba2469008dd9 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -3609,9 +3609,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 	base_hash  = chcr_alloc_shash(max_authsize);
 	if (IS_ERR(base_hash)) {
 		pr_err("chcr : Base driver cannot be loaded\n");
-		aeadctx->enckey_len = 0;
-		memzero_explicit(&keys, sizeof(keys));
-		return -EINVAL;
+		goto out;
 	}
 	{
 		SHASH_DESC_ON_STACK(shash, base_hash);
-- 
2.25.1
