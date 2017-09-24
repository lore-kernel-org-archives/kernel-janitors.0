From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Sep 2017 06:26:41 +0000
Subject: [PATCH] dmaengine: imx-sdma: Report a DMA_ERROR in status if 'count' or 'dma_address' do not match D
Message-Id: <20170924062641.30187-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All sanity checks in this function set 'sdmac->status = DMA_ERROR' if
something looks wrong, except if the byte count or the address don't match
the bus width.

Fix it and report the error in status in such a case.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested, so please review carefuly.
---
 drivers/dma/imx-sdma.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index a67ec1bdc4e0..f0419967eb92 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1240,26 +1240,31 @@ static struct dma_async_tx_descriptor *sdma_prep_slave_sg(
 		sdmac->chn_count += count;
 
 		if (sdmac->word_size > DMA_SLAVE_BUSWIDTH_4_BYTES) {
-			ret =  -EINVAL;
+			ret = -EINVAL;
 			goto err_out;
 		}
 
 		switch (sdmac->word_size) {
 		case DMA_SLAVE_BUSWIDTH_4_BYTES:
 			bd->mode.command = 0;
-			if (count & 3 || sg->dma_address & 3)
-				return NULL;
+			if (count & 3 || sg->dma_address & 3) {
+				ret = -EINVAL;
+				goto err_out;
+			}
 			break;
 		case DMA_SLAVE_BUSWIDTH_2_BYTES:
 			bd->mode.command = 2;
-			if (count & 1 || sg->dma_address & 1)
-				return NULL;
+			if (count & 1 || sg->dma_address & 1) {
+				ret = -EINVAL;
+				goto err_out;
+			}
 			break;
 		case DMA_SLAVE_BUSWIDTH_1_BYTE:
 			bd->mode.command = 1;
 			break;
 		default:
-			return NULL;
+			ret = -EINVAL;
+			goto err_out;
 		}
 
 		param = BD_DONE | BD_EXTD | BD_CONT;
-- 
2.11.0

