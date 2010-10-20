From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 20 Oct 2010 06:37:19 +0000
Subject: Re: [PATCH] dma: imx-dma: fix signedness bug
Message-Id: <20101020063719.GE28242@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287327110-9158-1-git-send-email-segooon@gmail.com> <AANLkTik15Z2_wyDRDOHOnpKKPgb+PHWs477esndgWmex@mail.gmail.com>
In-Reply-To: <AANLkTik15Z2_wyDRDOHOnpKKPgb+PHWs477esndgWmex@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org


mxdmac->channel was unsigned, so check (imxdmac->channel < 0) for
failed imx_dma_request_by_prio() made no sence.  Explicitly check
signed values.
Also, fix uninitialzed use of ret.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Here's an updated patch fixing both issues.

 drivers/dma/imx-dma.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 346be62..f629e49 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -335,8 +335,10 @@ static int __init imxdma_probe(struct platform_device *pdev)
 
 		imxdmac->imxdma_channel = imx_dma_request_by_prio("dmaengine",
 				DMA_PRIO_MEDIUM);
-		if (imxdmac->channel < 0)
+		if ((int)imxdmac->channel < 0) {
+			ret = -ENODEV;
 			goto err_init;
+		}
 
 		imx_dma_setup_handlers(imxdmac->imxdma_channel,
 		       imxdma_irq_handler, imxdma_err_handler, imxdmac);
-- 
1.7.2.3

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
