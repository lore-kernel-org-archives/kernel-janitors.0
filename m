From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 13 Apr 2017 12:14:19 +0000
Subject: [PATCH 1/2] crypto: chcr - Improve error checking
Message-Id: <71c63ef360ba033c1321e9792228b1e7b728c88e.1492085165.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1492085165.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1492085165.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, harsh@chelsio.com, hariprasad@chelsio.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'chcr_alloc_shash()' can return NULL. Here it is not possible because this
code is reached only if 'get_alg_config()' a few lines above has succeeded.
So we are garanteed that the value of 'max_authsize' is a correct
parameter.
Anyway, this is harmless to add a check for NULL.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/chelsio/chcr_algo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 41bc7f4f58cd..f19590ac8775 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -2294,7 +2294,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 			    aeadctx->enckey_len << 3);
 
 	base_hash  = chcr_alloc_shash(max_authsize);
-	if (IS_ERR(base_hash)) {
+	if (IS_ERR_OR_NULL(base_hash)) {
 		pr_err("chcr : Base driver cannot be loaded\n");
 		goto out;
 	}
-- 
2.11.0

