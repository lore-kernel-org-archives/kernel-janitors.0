From: Colin King <colin.king@canonical.com>
Date: Wed, 10 May 2017 13:04:31 +0000
Subject: [PATCH] crypto: glue_helper: remove redundant check on nbytes < bsize
Message-Id: <20170510130431.21236-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a check to see if nbytes < bsize (and a jump to label 'done' if
it is true) inside the proceeding do-while loop so it is impossible for
the second nbytes < bsize check to be true, hence is it redundant and
can be removed. Remove it.

Detected by CoverityScan, CID#712347 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/crypto/glue_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/crypto/glue_helper.c b/arch/x86/crypto/glue_helper.c
index 24ac9fad832d..d61e57960fe0 100644
--- a/arch/x86/crypto/glue_helper.c
+++ b/arch/x86/crypto/glue_helper.c
@@ -176,9 +176,6 @@ __glue_cbc_decrypt_128bit(const struct common_glue_ctx *gctx,
 				src -= 1;
 				dst -= 1;
 			} while (nbytes >= func_bytes);
-
-			if (nbytes < bsize)
-				goto done;
 		}
 	}
 
-- 
2.11.0

