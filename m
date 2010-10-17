From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:51:50 +0000
Subject: [PATCH] dma: imx-dma: fix signedness bug
Message-Id: <1287327110-9158-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

mxdmac->channel was unsigned, so check (imxdmac->channel < 0) for
failed imx_dma_request_by_prio() made no sence.  Explicitly check
signed values.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/dma/imx-dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 346be62..75d870f 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -335,7 +335,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 
 		imxdmac->imxdma_channel = imx_dma_request_by_prio("dmaengine",
 				DMA_PRIO_MEDIUM);
-		if (imxdmac->channel < 0)
+		if ((int)imxdmac->channel < 0)
 			goto err_init;
 
 		imx_dma_setup_handlers(imxdmac->imxdma_channel,
-- 
1.7.0.4

