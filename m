From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 09:05:04 +0000
Subject: [patch 1/2] dmaengine: xgene: buffer overflow in xgene_dma_init_channels()
Message-Id: <20150409090503.GD17605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We put 9 characters into the 8 character name[] array.  Let's make the
array bigger and change the sprintf() to snprintf().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index aa61935..06d4042 100755
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -314,7 +314,7 @@ struct xgene_dma_chan {
 	struct device *dev;
 	int id;
 	int rx_irq;
-	char name[8];
+	char name[10];
 	spinlock_t lock;
 	int pending;
 	int max_outstanding;
@@ -1876,7 +1876,7 @@ static void xgene_dma_init_channels(struct xgene_dma *pdma)
 		chan->dev = pdma->dev;
 		chan->pdma = pdma;
 		chan->id = i;
-		sprintf(chan->name, "dmachan%d", chan->id);
+		snprintf(chan->name, sizeof(chan->name), "dmachan%d", chan->id);
 	}
 }
 
