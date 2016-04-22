From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Apr 2016 10:01:39 +0000
Subject: [patch 2/2] crypto: mxc-scc - fix unwinding in mxc_scc_crypto_register()
Message-Id: <20160422100139.GD11398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are two issues here:

1) We need to decrement "i" otherwise we unregister something that was
   not successfully registered.
2) The original code did not unregister the first element in the array
   where i is zero.

Fixes: d293b640ebd5 ('crypto: mxc-scc - add basic driver for the MXC SCC')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/mxc-scc.c b/drivers/crypto/mxc-scc.c
index 9b348a7..ff383ef 100644
--- a/drivers/crypto/mxc-scc.c
+++ b/drivers/crypto/mxc-scc.c
@@ -616,7 +616,7 @@ static struct mxc_scc_crypto_tmpl *scc_crypto_algs[] = {
 
 static int mxc_scc_crypto_register(struct mxc_scc *scc)
 {
-	unsigned int i;
+	int i;
 	int err = 0;
 
 	for (i = 0; i < ARRAY_SIZE(scc_crypto_algs); i++) {
@@ -629,7 +629,7 @@ static int mxc_scc_crypto_register(struct mxc_scc *scc)
 	return 0;
 
 err_out:
-	for (; i > 0; i--)
+	while (--i >= 0)
 		crypto_unregister_alg(&scc_crypto_algs[i]->alg);
 
 	return err;
