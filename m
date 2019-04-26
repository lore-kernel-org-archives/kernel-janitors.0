From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Apr 2019 13:18:35 +0000
Subject: [PATCH] crypto: ccree: fix spelling mistake "protedcted" -> "protected"
Message-Id: <20190426131835.27258-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/ccree/cc_cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index d9f8cd543ee3..c9a40bc39698 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -368,7 +368,7 @@ static int cc_cipher_sethkey(struct crypto_skcipher *sktfm, const u8 *key,
 		else /* Must be SM4 since due to sethkey registration */
 			ctx_p->cpp.alg = CC_CPP_SM4;
 		ctx_p->key_type = CC_POLICY_PROTECTED_KEY;
-		dev_dbg(dev, "policy protedcted key alg: %d slot: %d.\n",
+		dev_dbg(dev, "policy protected key alg: %d slot: %d.\n",
 			ctx_p->cpp.alg, ctx_p->cpp.slot);
 		break;
 
-- 
2.20.1
