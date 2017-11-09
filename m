From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Nov 2017 21:25:43 +0000
Subject: [PATCH] crypto: chelsio - Fix an error code in chcr_hash_dma_map()
Message-Id: <20171109212543.6dpgzvtbhi4574wr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harsh Jain <harsh@chelsio.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The dma_map_sg() function returns zero on error and positive values on
success.  We want to return -ENOMEM on failure here and zero on success.

Fixes: 2f47d5804311 ("crypto: chelsio - Move DMA un/mapping to chcr from lld cxgb4 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 4eed7171e2ae..38fe59b5c689 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -2414,7 +2414,7 @@ static inline int chcr_hash_dma_map(struct device *dev,
 	error = dma_map_sg(dev, req->src, sg_nents(req->src),
 			   DMA_TO_DEVICE);
 	if (!error)
-		return error;
+		return -ENOMEM;
 	req_ctx->is_sg_map = 1;
 	return 0;
 }
