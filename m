From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 14 Mar 2020 10:44:41 +0000
Subject: [PATCH -next] crypto: chelsio - remove set but not used variable 'adap'
Message-Id: <20200314104441.79953-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544515919-193254-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544515919-193254-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

drivers/crypto/chelsio/chcr_algo.c: In function 'chcr_device_init':
drivers/crypto/chelsio/chcr_algo.c:1440:18: warning:
 variable 'adap' set but not used [-Wunused-but-set-variable]
 
commit 567be3a5d227 ("crypto: chelsio - Use multiple txq/rxq per tfm
to process the requests") involved this unused variable.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/chelsio/chcr_algo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 8952732c0b7d..c29b80dd30d8 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1437,7 +1437,6 @@ static int chcr_aes_decrypt(struct skcipher_request *req)
 static int chcr_device_init(struct chcr_context *ctx)
 {
 	struct uld_ctx *u_ctx = NULL;
-	struct adapter *adap;
 	int txq_perchan, ntxq;
 	int err = 0, rxq_perchan;
 
@@ -1448,7 +1447,6 @@ static int chcr_device_init(struct chcr_context *ctx)
 			goto out;
 		}
 		ctx->dev = &u_ctx->dev;
-		adap = padap(ctx->dev);
 		ntxq = u_ctx->lldi.ntxq;
 		rxq_perchan = u_ctx->lldi.nrxq / u_ctx->lldi.nchan;
 		txq_perchan = ntxq / u_ctx->lldi.nchan;
