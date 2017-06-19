From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jun 2017 10:51:25 +0000
Subject: [PATCH] crypto: cavium/nitrox - dma_mapping_error() returns bool
Message-Id: <20170619105124.GA23831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Srikanth Jampala <Jampala.Srikanth@cavium.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We want to return negative error codes here, but we're accidentally
propogating the "true" return from dma_mapping_error().

Fixes: 14fa93cdcd9b ("crypto: cavium - Add support for CNN55XX adapters.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
index b6bd2a870028..4bb4377c5ac0 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
@@ -199,9 +199,10 @@ static int dma_map_inbufs(struct nitrox_softreq *sr,
 	sr->in.sglist = glist;
 	/* map IV */
 	dma = dma_map_single(dev, &req->iv, req->ivsize, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(dev, dma);
-	if (ret)
+	if (dma_mapping_error(dev, dma)) {
+		ret = -EINVAL;
 		goto iv_map_err;
+	}
 
 	sr->in.dir = (req->src = req->dst) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 	/* map src entries */
@@ -268,16 +269,18 @@ static int dma_map_outbufs(struct nitrox_softreq *sr,
 	/* map ORH */
 	sr->resp.orh_dma = dma_map_single(dev, &sr->resp.orh, ORH_HLEN,
 					  sr->out.dir);
-	ret = dma_mapping_error(dev, sr->resp.orh_dma);
-	if (ret)
+	if (dma_mapping_error(dev, sr->resp.orh_dma)) {
+		ret = -EINVAL;
 		goto orh_map_err;
+	}
 
 	/* map completion */
 	sr->resp.completion_dma = dma_map_single(dev, &sr->resp.completion,
 						 COMP_HLEN, sr->out.dir);
-	ret = dma_mapping_error(dev, sr->resp.completion_dma);
-	if (ret)
+	if (dma_mapping_error(dev, sr->resp.completion_dma)) {
+		ret = -EINVAL;
 		goto compl_map_err;
+	}
 
 	sr->inplace = (req->src = req->dst) ? true : false;
 	/* out place */
