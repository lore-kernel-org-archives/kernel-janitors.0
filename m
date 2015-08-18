From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Aug 2015 09:12:19 +0000
Subject: [patch] i2c: xgene-slimpro: dma_mapping_error() doesn't return an error code
Message-Id: <20150818091219.GB3965@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Hieu Le <hnle-qTEPVZfXA3Y@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The dma_mapping_error() function returns true if there is an error, it
doesn't return an error code.  We should return -ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 1c9cb65a..4233f56 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -198,10 +198,10 @@ static int slimpro_i2c_blkrd(struct slimpro_i2c_dev *ctx, u32 chip, u32 addr,
 	int rc;
 
 	paddr = dma_map_single(ctx->dev, ctx->dma_buffer, readlen, DMA_FROM_DEVICE);
-	rc = dma_mapping_error(ctx->dev, paddr);
-	if (rc) {
+	if (dma_mapping_error(ctx->dev, paddr)) {
 		dev_err(&ctx->adapter.dev, "Error in mapping dma buffer %p\n",
 			ctx->dma_buffer);
+		rc = -ENOMEM;
 		goto err;
 	}
 
@@ -241,10 +241,10 @@ static int slimpro_i2c_blkwr(struct slimpro_i2c_dev *ctx, u32 chip,
 	memcpy(ctx->dma_buffer, data, writelen);
 	paddr = dma_map_single(ctx->dev, ctx->dma_buffer, writelen,
 			       DMA_TO_DEVICE);
-	rc = dma_mapping_error(ctx->dev, paddr);
-	if (rc) {
+	if (dma_mapping_error(ctx->dev, paddr)) {
 		dev_err(&ctx->adapter.dev, "Error in mapping dma buffer %p\n",
 			ctx->dma_buffer);
+		rc = -ENOMEM;
 		goto err;
 	}
 
