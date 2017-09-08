From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Sep 2017 10:31:37 +0000
Subject: [PATCH net] phy: mvebu-cp110: checking for NULL instead of IS_ERR()
Message-Id: <20170908103137.zck6bw66sge4fhua@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

devm_ioremap_resource() never returns NULL, it only returns error
pointers so this test needs to be changed.

Fixes: d0438bd6aa09 ("phy: add the mvebu cp110 comphy driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This driver apparently is going through the net tree, but netdev isn't
listed as handling it in MAINTAINERS.  Kishon, do you know what's up
with that?

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 73ebad6634a7..24578bd68ddc 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -576,8 +576,8 @@ static int mvebu_comphy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->regmap);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!priv->base)
-		return -ENOMEM;
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
 
 	for_each_available_child_of_node(pdev->dev.of_node, child) {
 		struct mvebu_comphy_lane *lane;
