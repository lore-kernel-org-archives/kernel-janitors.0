From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Feb 2014 14:58:32 +0000
Subject: [patch] crypto: remove a duplicate checks in __cbc_decrypt()
Message-Id: <20140213145832.GA11059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, Johannes Goetzfried <Johannes.Goetzfried@informatik.stud.uni-erlangen.de>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We checked "nbytes < bsize" before so it can't happen here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This doesn't change how the code works, but maybe their is a bug in the
original code.  Please review?

diff --git a/arch/x86/crypto/cast5_avx_glue.c b/arch/x86/crypto/cast5_avx_glue.c
index e6a3700489b9..e57e20ab5e0b 100644
--- a/arch/x86/crypto/cast5_avx_glue.c
+++ b/arch/x86/crypto/cast5_avx_glue.c
@@ -203,9 +203,6 @@ static unsigned int __cbc_decrypt(struct blkcipher_desc *desc,
 			src -= 1;
 			dst -= 1;
 		} while (nbytes >= bsize * CAST5_PARALLEL_BLOCKS);
-
-		if (nbytes < bsize)
-			goto done;
 	}
 
 	/* Handle leftovers */
diff --git a/arch/x86/crypto/blowfish_glue.c b/arch/x86/crypto/blowfish_glue.c
index 50ec333b70e6..8af519ed73d1 100644
--- a/arch/x86/crypto/blowfish_glue.c
+++ b/arch/x86/crypto/blowfish_glue.c
@@ -223,9 +223,6 @@ static unsigned int __cbc_decrypt(struct blkcipher_desc *desc,
 			src -= 1;
 			dst -= 1;
 		} while (nbytes >= bsize * 4);
-
-		if (nbytes < bsize)
-			goto done;
 	}
 
 	/* Handle leftovers */
