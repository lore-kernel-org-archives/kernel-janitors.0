From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 May 2017 05:52:26 +0000
Subject: [PATCH] crypto: glue_helper - Delete some dead code
Message-Id: <20170510055226.5mlkw654cl6djc65@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We checked (nbytes < bsize) inside the loops so it's not possible to hit
the "goto done;" here.  This code is cut and paste from other slightly
different loops where we don't have the check inside the loop.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
 
