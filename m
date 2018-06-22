From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2018 11:15:47 +0000
Subject: [PATCH] dmaengine: k3dma: Off by one in k3_of_dma_simple_xlate()
Message-Id: <20180622111547.urjjagjf6rxbobpq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

The d->chans[] array has d->dma_requests elements so the > should be
>= here.

Fixes: 8e6152bc660e ("dmaengine: Add hisilicon k3 DMA engine driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index fa31cccbe04f..6bfa217ed6d0 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -794,7 +794,7 @@ static struct dma_chan *k3_of_dma_simple_xlate(struct of_phandle_args *dma_spec,
 	struct k3_dma_dev *d = ofdma->of_dma_data;
 	unsigned int request = dma_spec->args[0];
 
-	if (request > d->dma_requests)
+	if (request >= d->dma_requests)
 		return NULL;
 
 	return dma_get_slave_channel(&(d->chans[request].vc.chan));
