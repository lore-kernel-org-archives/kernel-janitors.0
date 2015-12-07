From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 07 Dec 2015 20:36:57 +0000
Subject: [PATCH] crypto: constify drbg_state_ops structures
Message-Id: <1449520617-1964-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

The drbg_state_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 crypto/drbg.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index a7c2314..ab6ef1d 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -626,7 +626,7 @@ out:
 	return len;
 }
 
-static struct drbg_state_ops drbg_ctr_ops = {
+static const struct drbg_state_ops drbg_ctr_ops = {
 	.update		= drbg_ctr_update,
 	.generate	= drbg_ctr_generate,
 	.crypto_init	= drbg_init_sym_kernel,
@@ -752,7 +752,7 @@ static int drbg_hmac_generate(struct drbg_state *drbg,
 	return len;
 }
 
-static struct drbg_state_ops drbg_hmac_ops = {
+static const struct drbg_state_ops drbg_hmac_ops = {
 	.update		= drbg_hmac_update,
 	.generate	= drbg_hmac_generate,
 	.crypto_init	= drbg_init_hash_kernel,
@@ -1032,7 +1032,7 @@ out:
  * scratchpad usage: as update and generate are used isolated, both
  * can use the scratchpad
  */
-static struct drbg_state_ops drbg_hash_ops = {
+static const struct drbg_state_ops drbg_hash_ops = {
 	.update		= drbg_hash_update,
 	.generate	= drbg_hash_generate,
 	.crypto_init	= drbg_init_hash_kernel,

