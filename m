From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Nov 2014 18:36:28 +0000
Subject: [patch] crypto: sha-mb - remove a bogus NULL check
Message-Id: <20141122183628.GD6994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, Fengguang Wu <fengguang.wu@intel.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

This can't be NULL and we dereferenced it earlier.  Smatch used to
ignore these things where the pointer was obviously non-NULL but I've
found that sometimes the intention was to check something else so we
were maybe missing bugs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/crypto/sha-mb/sha1_mb.c b/arch/x86/crypto/sha-mb/sha1_mb.c
index 99eefd8..a225a5ca 100644
--- a/arch/x86/crypto/sha-mb/sha1_mb.c
+++ b/arch/x86/crypto/sha-mb/sha1_mb.c
@@ -204,8 +204,7 @@ static struct sha1_hash_ctx *sha1_ctx_mgr_resubmit(struct sha1_ctx_mgr *mgr, str
 			continue;
 		}
 
-		if (ctx)
-			ctx->status = HASH_CTX_STS_IDLE;
+		ctx->status = HASH_CTX_STS_IDLE;
 		return ctx;
 	}
 
