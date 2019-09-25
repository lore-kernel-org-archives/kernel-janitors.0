From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 11:05:24 +0000
Subject: [PATCH net] net: nixge: Fix a signedness bug in nixge_probe()
Message-Id: <20190925110524.GP3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Moritz Fischer <mdf@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alex Williams <alex.williams@ni.com>, Luis Chamberlain <mcgrof@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "priv->phy_mode" is an enum and in this context GCC will treat it
as an unsigned int so it can never be less than zero.

Fixes: 492caffa8a1a ("net: ethernet: nixge: Add support for National Instruments XGE netdev")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/ni/nixge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 0b384f97d2fd..2761f3a3ae50 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -1347,7 +1347,7 @@ static int nixge_probe(struct platform_device *pdev)
 	}
 
 	priv->phy_mode = of_get_phy_mode(pdev->dev.of_node);
-	if (priv->phy_mode < 0) {
+	if ((int)priv->phy_mode < 0) {
 		netdev_err(ndev, "not find \"phy-mode\" property\n");
 		err = -EINVAL;
 		goto unregister_mdio;
-- 
2.20.1
