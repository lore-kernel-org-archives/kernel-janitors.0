From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jun 2016 09:16:19 +0000
Subject: [patch] crypto: drbg - fix an error code in drbg_init_sym_kernel()
Message-Id: <20160617091618.GC25609@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller <smueller@chronox.de>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return PTR_ERR(NULL) which is success but we should
return -ENOMEM.

Fixes: 355912852115 ('crypto: drbg - use CTR AES instead of ECB AES')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/crypto/drbg.c b/crypto/drbg.c
index ded8638..6872d15 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1686,7 +1686,7 @@ static int drbg_init_sym_kernel(struct drbg_state *drbg)
 	if (!req) {
 		pr_info("DRBG: could not allocate request queue\n");
 		drbg_fini_sym_kernel(drbg);
-		return PTR_ERR(req);
+		return -ENOMEM;
 	}
 	drbg->ctr_req = req;
 	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
