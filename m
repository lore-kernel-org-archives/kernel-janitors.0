From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Aug 2015 18:05:11 +0000
Subject: [PATCH 2/2] spi: spi-ep93xx: change PTR_ERR argument
Message-Id: <1440957911-7687-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org

Apply PTR_ERR to the value that was recently assigned.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y;
@@

if (IS_ERR(x) || ...) {
  ... when any
      when != IS_ERR(...)
(
   PTR_ERR(x)
|
*  PTR_ERR(y)
)
  ... when any
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/spi/spi-ep93xx.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index bb00be8..1a7696c 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -567,7 +567,8 @@ static void ep93xx_spi_dma_transfer(struct ep93xx_spi *espi)
 	txd = ep93xx_spi_dma_prepare(espi, DMA_MEM_TO_DEV);
 	if (IS_ERR(txd)) {
 		ep93xx_spi_dma_finish(espi, DMA_DEV_TO_MEM);
-		dev_err(&espi->pdev->dev, "DMA TX failed: %ld\n", PTR_ERR(rxd));
+		dev_err(&espi->pdev->dev, "DMA TX failed: %ld\n",
+			PTR_ERR(txd));
 		msg->status = PTR_ERR(txd);
 		return;
 	}

