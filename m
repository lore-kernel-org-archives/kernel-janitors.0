From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Mar 2011 06:57:47 +0000
Subject: [patch] crypto: caam - dereferencing ERR_PTR on allocation failure
Message-Id: <20110315065747.GO2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, Kim Phillips <kim.phillips@freescale.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

t_alg is an ERR_PTR here so we can't dereference it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This doesn't compile for me.  Sorry.

diff --git a/drivers/crypto/caam/caamalg.c b/drivers/crypto/caam/caamalg.c
index d7fe3d3..a27b6d3 100644
--- a/drivers/crypto/caam/caamalg.c
+++ b/drivers/crypto/caam/caamalg.c
@@ -1136,7 +1136,7 @@ static int __init caam_algapi_init(void)
 		if (IS_ERR(t_alg)) {
 			err = PTR_ERR(t_alg);
 			dev_warn(ctrldev, "%s alg allocation failed\n",
-				 t_alg->crypto_alg.cra_driver_name);
+				 driver_algs[i].driver_name);
 			continue;
 		}
 
