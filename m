From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Feb 2021 15:58:49 +0000
Subject: [PATCH] mtd: rawnand: fsmc: Fix error code in fsmc_nand_probe()
Message-Id: <YCqaOZ83OvPOzLwh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Vipin Kumar <vipin.kumar@st.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org

If dma_request_channel() fails then the probe fails and it should
return a negative error code, but currently it returns success.

fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0101c0fab50a..a24e2f57fa68 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1077,11 +1077,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
+			ret = -ENODEV;
 			goto disable_clk;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->write_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
+			ret = -ENODEV;
 			goto release_dma_read_chan;
 		}
 	}
-- 
2.30.0
