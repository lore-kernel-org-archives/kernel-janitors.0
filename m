From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 08:00:49 +0000
Subject: [PATCH] irqchip/irq-mvebu-gicp: allocate enough memory for spi_bitmap
Message-Id: <20170630080049.xr7luy5dfqdrfb57@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

BITS_TO_LONGS() gives us the number of longs we need, but we want to
allocate the number of bytes.

Fixes: a68a63cb4dfc ("irqchip/irq-mvebu-gicp: Add new driver for Marvell GICP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 45358ac9bb1d..b283fc90be1e 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -226,8 +226,8 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 	}
 
 	gicp->spi_bitmap = devm_kzalloc(&pdev->dev,
-					BITS_TO_LONGS(gicp->spi_cnt),
-					GFP_KERNEL);
+				BITS_TO_LONGS(gicp->spi_cnt) * sizeof(long),
+				GFP_KERNEL);
 	if (!gicp->spi_bitmap)
 		return -ENOMEM;
 
