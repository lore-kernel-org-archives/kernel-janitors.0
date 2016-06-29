From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jun 2016 14:42:17 +0000
Subject: [patch] crypto: sha1-mb - cleanup a small | vs || typo
Message-Id: <20160629144216.GD22818@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Megha Dey <megha.dey@linux.intel.com>, Tim Chen <tim.c.chen@linux.intel.com>, Xiaodong Liu <xiaodong.liu@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, "Wang, Rui Y" <rui.y.wang@intel.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

|| and | behave basically the same here but || was intended.  It causes
a static checker warning when we mix up logical and bitwise operations.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/crypto/sha1-mb/sha1_mb.c b/arch/x86/crypto/sha1-mb/sha1_mb.c
index 561b286..96d80ad 100644
--- a/arch/x86/crypto/sha1-mb/sha1_mb.c
+++ b/arch/x86/crypto/sha1-mb/sha1_mb.c
@@ -304,7 +304,7 @@ static struct sha1_hash_ctx *sha1_ctx_mgr_submit(struct sha1_ctx_mgr *mgr,
 	 * Or if the user's buffer contains less than a whole block,
 	 * append as much as possible to the extra block.
 	 */
-	if ((ctx->partial_block_buffer_length) | (len < SHA1_BLOCK_SIZE)) {
+	if ((ctx->partial_block_buffer_length) || (len < SHA1_BLOCK_SIZE)) {
 		/*
 		 * Compute how many bytes to copy from user buffer into
 		 * extra block
