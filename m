From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Jun 2017 10:35:50 +0000
Subject: [PATCH] crypto: cavium: make several functions static
Message-Id: <20170620103550.7660-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Cherian <george.cherian@cavium.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions cvm_encrypt, cvm_decrypt, cvm_xts_setkey and
cvm_enc_dec_init does not need to be in global scope, so make
them static.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/cavium/cpt/cptvf_algs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/cavium/cpt/cptvf_algs.c b/drivers/crypto/cavium/cpt/cptvf_algs.c
index 1b220f3ed017..df21d996db7e 100644
--- a/drivers/crypto/cavium/cpt/cptvf_algs.c
+++ b/drivers/crypto/cavium/cpt/cptvf_algs.c
@@ -222,17 +222,17 @@ static inline int cvm_enc_dec(struct ablkcipher_request *req, u32 enc)
 		return -EINPROGRESS;
 }
 
-int cvm_encrypt(struct ablkcipher_request *req)
+static int cvm_encrypt(struct ablkcipher_request *req)
 {
 	return cvm_enc_dec(req, true);
 }
 
-int cvm_decrypt(struct ablkcipher_request *req)
+static int cvm_decrypt(struct ablkcipher_request *req)
 {
 	return cvm_enc_dec(req, false);
 }
 
-int cvm_xts_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
+static int cvm_xts_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
 		   u32 keylen)
 {
 	struct crypto_tfm *tfm = crypto_ablkcipher_tfm(cipher);
@@ -336,7 +336,7 @@ static int cvm_ecb_des3_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
 	return cvm_setkey(cipher, key, keylen, DES3_ECB);
 }
 
-int cvm_enc_dec_init(struct crypto_tfm *tfm)
+static int cvm_enc_dec_init(struct crypto_tfm *tfm)
 {
 	struct cvm_enc_ctx *ctx = crypto_tfm_ctx(tfm);
 
-- 
2.11.0

