From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 08:29:33 +0000
Subject: [patch] dmaengine: s3c24xx: missing unlock on an error path
Message-Id: <20150130082933.GC21357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should unlock here before returning -EINVAL.

Fixes: 39ad46009654 ('dmaengine: s3c24xx: Split device_control')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 4d5a848..2f91da3 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -718,13 +718,15 @@ static int s3c24xx_dma_terminate_all(struct dma_chan *chan)
 	struct s3c24xx_dma_chan *s3cchan = to_s3c24xx_dma_chan(chan);
 	struct s3c24xx_dma_engine *s3cdma = s3cchan->host;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&s3cchan->vc.lock, flags);
 
 	if (!s3cchan->phy && !s3cchan->at) {
 		dev_err(&s3cdma->pdev->dev, "trying to terminate already stopped channel %d\n",
 			s3cchan->id);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto unlock;
 	}
 
 	s3cchan->state = S3C24XX_DMA_CHAN_IDLE;
@@ -741,10 +743,10 @@ static int s3c24xx_dma_terminate_all(struct dma_chan *chan)
 
 	/* Dequeue jobs not yet fired as well */
 	s3c24xx_dma_free_txd_list(s3cdma, s3cchan);
-
+unlock:
 	spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int s3c24xx_dma_alloc_chan_resources(struct dma_chan *chan)
