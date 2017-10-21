From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 17:14:47 +0000
Subject: [PATCH 1/3] crypto-ansi_cprng: Use common error handling code in get_prng_bytes()
Message-Id: <58606d55-38e7-7fa4-ca5b-84609d16625d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d284473a-b968-2b3e-9147-1c8598a26f7c@users.sourceforge.net>
In-Reply-To: <d284473a-b968-2b3e-9147-1c8598a26f7c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Neil Horman <nhorman@tuxdriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 15:17:52 +0200

Adjust jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 crypto/ansi_cprng.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/crypto/ansi_cprng.c b/crypto/ansi_cprng.c
index eff337ce9003..111c8982a47f 100644
--- a/crypto/ansi_cprng.c
+++ b/crypto/ansi_cprng.c
@@ -195,7 +195,7 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 
 	err = -EINVAL;
 	if (ctx->flags & PRNG_NEED_RESET)
-		goto done;
+		goto unlock;
 
 	/*
 	 * If the FIXED_SIZE flag is on, only return whole blocks of
@@ -204,7 +204,7 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 	err = -EINVAL;
 	if (ctx->flags & PRNG_FIXED_SIZE) {
 		if (nbytes < DEFAULT_BLK_SZ)
-			goto done;
+			goto unlock;
 		byte_count = DEFAULT_BLK_SZ;
 	}
 
@@ -219,13 +219,9 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 
 
 remainder:
-	if (ctx->rand_data_valid = DEFAULT_BLK_SZ) {
-		if (_get_more_prng_bytes(ctx, do_cont_test) < 0) {
-			memset(buf, 0, nbytes);
-			err = -EINVAL;
-			goto done;
-		}
-	}
+	if (ctx->rand_data_valid = DEFAULT_BLK_SZ &&
+	    _get_more_prng_bytes(ctx, do_cont_test) < 0)
+		goto reset_memory;
 
 	/*
 	 * Copy any data less than an entire block
@@ -238,7 +234,7 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 			byte_count--;
 			ctx->rand_data_valid++;
 			if (byte_count = 0)
-				goto done;
+				goto unlock;
 		}
 	}
 
@@ -246,13 +242,10 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 	 * Now copy whole blocks
 	 */
 	for (; byte_count >= DEFAULT_BLK_SZ; byte_count -= DEFAULT_BLK_SZ) {
-		if (ctx->rand_data_valid = DEFAULT_BLK_SZ) {
-			if (_get_more_prng_bytes(ctx, do_cont_test) < 0) {
-				memset(buf, 0, nbytes);
-				err = -EINVAL;
-				goto done;
-			}
-		}
+		if (ctx->rand_data_valid = DEFAULT_BLK_SZ &&
+		    _get_more_prng_bytes(ctx, do_cont_test) < 0)
+			goto reset_memory;
+
 		if (ctx->rand_data_valid > 0)
 			goto empty_rbuf;
 		memcpy(ptr, ctx->rand_data, DEFAULT_BLK_SZ);
@@ -266,11 +259,16 @@ static int get_prng_bytes(char *buf, size_t nbytes, struct prng_context *ctx,
 	if (byte_count)
 		goto remainder;
 
-done:
+unlock:
 	spin_unlock_bh(&ctx->prng_lock);
 	dbgprint(KERN_CRIT "returning %d from get_prng_bytes in context %p\n",
 		err, ctx);
 	return err;
+
+reset_memory:
+	memset(buf, 0, nbytes);
+	err = -EINVAL;
+	goto unlock;
 }
 
 static void free_prng_context(struct prng_context *ctx)
-- 
2.14.2

