From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Jul 2020 21:14:24 +0000
Subject: [PATCH 2/2] Crypto/chcr: Fix some pr_xxx messages
Message-Id: <20200712211424.276263-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ayush.sawal@chelsio.com, vinay.yadav@chelsio.com, rohitm@chelsio.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

At the top this file, we have:
   #define pr_fmt(fmt) "chcr:" fmt

So there is no need to repeat "chcr : " in some error message when the
pr_xxx macro is used.
This would lead to log "chcr:chcr : blabla"

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/chelsio/chcr_algo.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index ba2469008dd9..e02b56bd43c6 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1224,7 +1224,7 @@ static int chcr_handle_cipher_resp(struct skcipher_request *req,
 	wrparam.bytes = bytes;
 	skb = create_cipher_wr(&wrparam);
 	if (IS_ERR(skb)) {
-		pr_err("chcr : %s : Failed to form WR. No memory\n", __func__);
+		pr_err("%s : Failed to form WR. No memory\n", __func__);
 		err = PTR_ERR(skb);
 		goto unmap;
 	}
@@ -1556,7 +1556,7 @@ static int get_alg_config(struct algo_param *params,
 		params->result_size = SHA512_DIGEST_SIZE;
 		break;
 	default:
-		pr_err("chcr : ERROR, unsupported digest size\n");
+		pr_err("ERROR, unsupported digest size\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -3571,7 +3571,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 		goto out;
 
 	if (get_alg_config(&param, max_authsize)) {
-		pr_err("chcr : Unsupported digest size\n");
+		pr_err("Unsupported digest size\n");
 		goto out;
 	}
 	subtype = get_aead_subtype(authenc);
@@ -3590,7 +3590,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 	} else if (keys.enckeylen = AES_KEYSIZE_256) {
 		ck_size = CHCR_KEYCTX_CIPHER_KEY_SIZE_256;
 	} else {
-		pr_err("chcr : Unsupported cipher key\n");
+		pr_err("Unsupported cipher key\n");
 		goto out;
 	}
 
@@ -3608,7 +3608,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 	}
 	base_hash  = chcr_alloc_shash(max_authsize);
 	if (IS_ERR(base_hash)) {
-		pr_err("chcr : Base driver cannot be loaded\n");
+		pr_err("Base driver cannot be loaded\n");
 		goto out;
 	}
 	{
@@ -3624,7 +3624,7 @@ static int chcr_authenc_setkey(struct crypto_aead *authenc, const u8 *key,
 						  keys.authkeylen,
 						  o_ptr);
 			if (err) {
-				pr_err("chcr : Base driver cannot be loaded\n");
+				pr_err("Base driver cannot be loaded\n");
 				goto out;
 			}
 			keys.authkeylen = max_authsize;
@@ -3709,7 +3709,7 @@ static int chcr_aead_digest_null_setkey(struct crypto_aead *authenc,
 	} else if (keys.enckeylen = AES_KEYSIZE_256) {
 		ck_size = CHCR_KEYCTX_CIPHER_KEY_SIZE_256;
 	} else {
-		pr_err("chcr : Unsupported cipher key %d\n", keys.enckeylen);
+		pr_err("Unsupported cipher key %d\n", keys.enckeylen);
 		goto out;
 	}
 	memcpy(aeadctx->key, keys.enckey, keys.enckeylen);
@@ -3745,7 +3745,7 @@ static int chcr_aead_op(struct aead_request *req,
 
 	cdev = a_ctx(tfm)->dev;
 	if (!cdev) {
-		pr_err("chcr : %s : No crypto device.\n", __func__);
+		pr_err("%s : No crypto device.\n", __func__);
 		return -ENXIO;
 	}
 
@@ -4495,8 +4495,7 @@ static int chcr_register_alg(void)
 			break;
 		}
 		if (err) {
-			pr_err("chcr : %s : Algorithm registration failed\n",
-			       name);
+			pr_err("%s : Algorithm registration failed\n", name);
 			goto register_err;
 		} else {
 			driver_algs[i].is_registered = 1;
-- 
2.25.1
