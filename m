From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Apr 2014 07:29:33 +0000
Subject: [patch] dmaengine: sirf: off by one in of_dma_sirfsoc_xlate()
Message-Id: <20140403072933.GD14286@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The ">" here should be ">=" or we are one step beyond the end of the
sdma->channels[] array.

Fixes: 2e041c94628c ('dmaengine: sirf: enable generic dt binding for dma channels')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/sirf-dma.c b/drivers/dma/sirf-dma.c
index a1bd829..03f7820 100644
--- a/drivers/dma/sirf-dma.c
+++ b/drivers/dma/sirf-dma.c
@@ -666,7 +666,7 @@ static struct dma_chan *of_dma_sirfsoc_xlate(struct of_phandle_args *dma_spec,
 	struct sirfsoc_dma *sdma = ofdma->of_dma_data;
 	unsigned int request = dma_spec->args[0];
 
-	if (request > SIRFSOC_DMA_CHANNELS)
+	if (request >= SIRFSOC_DMA_CHANNELS)
 		return NULL;
 
 	return dma_get_slave_channel(&sdma->channels[request].chan);
