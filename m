From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 08:59:47 +0000
Subject: [PATCH -next] crypto: marvell - Remove set but not used variable 'ivsize'
Message-Id: <20190218085947.3800-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/marvell/cipher.c: In function 'mv_cesa_skcipher_dma_req_init':
drivers/crypto/marvell/cipher.c:325:15: warning:
 variable 'ivsize' set but not used [-Wunused-but-set-variable]

It's not used any more after 0c99620f0ac1 ("crypto: marvell - Use an unique
pool to copy results of requests")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/marvell/cipher.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/crypto/marvell/cipher.c b/drivers/crypto/marvell/cipher.c
index 066830dcc53e..fb279b3a1ca1 100644
--- a/drivers/crypto/marvell/cipher.c
+++ b/drivers/crypto/marvell/cipher.c
@@ -322,7 +322,6 @@ static int mv_cesa_skcipher_dma_req_init(struct skcipher_request *req,
 	struct mv_cesa_skcipher_dma_iter iter;
 	bool skip_ctx = false;
 	int ret;
-	unsigned int ivsize;
 
 	basereq->chain.first = NULL;
 	basereq->chain.last = NULL;
@@ -381,7 +380,6 @@ static int mv_cesa_skcipher_dma_req_init(struct skcipher_request *req,
 	} while (mv_cesa_skcipher_req_iter_next_op(&iter));
 
 	/* Add output data for IV */
-	ivsize = crypto_skcipher_ivsize(crypto_skcipher_reqtfm(req));
 	ret = mv_cesa_dma_add_result_op(&basereq->chain, CESA_SA_CFG_SRAM_OFFSET,
 				    CESA_SA_DATA_SRAM_OFFSET,
 				    CESA_TDMA_SRC_IN_SRAM, flags);
