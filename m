From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:00:29 +0000
Subject: [patch 1/2] k3dma: off by one in k3_of_dma_simple_xlate()
Message-Id: <20161012060029.GA12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The ->chans[] array has ->dma_requests elements so the check should be
>= instead of >.  The ->chans[] array is allocated in k3_dma_probe()

Fixes: 8e6152bc660e ('dmaengine: Add hisilicon k3 DMA engine driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 7c636c53..f17a8c0 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -792,7 +792,7 @@ static struct dma_chan *k3_of_dma_simple_xlate(struct of_phandle_args *dma_spec,
 	struct k3_dma_dev *d = ofdma->of_dma_data;
 	unsigned int request = dma_spec->args[0];
 
-	if (request > d->dma_requests)
+	if (request >= d->dma_requests)
 		return NULL;
 
 	return dma_get_slave_channel(&(d->chans[request].vc.chan));
