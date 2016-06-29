From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jun 2016 14:42:42 +0000
Subject: [patch] crypto: sha256-mb - cleanup a || vs | typo
Message-Id: <20160629144242.GE22818@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, Megha Dey <megha.dey@intel.com>, "Wang, Rui Y" <rui.y.wang@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, Xiaodong Liu <xiaodong.liu@intel.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

|| and | behave basically the same here but || is intended.  It causes a
static checker warning to mix up bitwise and logical operations.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/crypto/sha256-mb/sha256_mb.c b/arch/x86/crypto/sha256-mb/sha256_mb.c
index c9d5dcc..4ec895a 100644
--- a/arch/x86/crypto/sha256-mb/sha256_mb.c
+++ b/arch/x86/crypto/sha256-mb/sha256_mb.c
@@ -299,7 +299,7 @@ static struct sha256_hash_ctx *sha256_ctx_mgr_submit(struct sha256_ctx_mgr *mgr,
 	 * Or if the user's buffer contains less than a whole block,
 	 * append as much as possible to the extra block.
 	 */
-	if ((ctx->partial_block_buffer_length) | (len < SHA256_BLOCK_SIZE)) {
+	if ((ctx->partial_block_buffer_length) || (len < SHA256_BLOCK_SIZE)) {
 		/* Compute how many bytes to copy from user buffer into
 		 * extra block
 		 */
