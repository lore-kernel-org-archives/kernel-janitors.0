From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 25 Aug 2017 05:35:51 +0000
Subject: [PATCH] net: sxgbe: check memory allocation failure
Message-Id: <20170825053551.31672-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bh74.an@samsung.com, ks.giri@samsung.com, vipul.pandya@samsung.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Check memory allocation failure and return -ENOMEM in such a case, as
already done few lines below for another memory allocation.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index 73427e29df2a..fbd00cb0cb7d 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -47,6 +47,8 @@ static int sxgbe_probe_config_dt(struct platform_device *pdev,
 	plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
 					   sizeof(*plat->mdio_bus_data),
 					   GFP_KERNEL);
+	if (!plat->mdio_bus_data)
+		return -ENOMEM;
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg), GFP_KERNEL);
 	if (!dma_cfg)
-- 
2.11.0

