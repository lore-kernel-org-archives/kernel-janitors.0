From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:33:21 +0000
Subject: [PATCH net-next] net: dsa: gswip: Fix return value check in gswip_probe()
Message-Id: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: 14fceff4771e ("net: dsa: Add Lantiq / Intel DSA driver for vrx200")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/dsa/lantiq_gswip.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gswip.c
index 9c28d0b..faac359 100644
--- a/drivers/net/dsa/lantiq_gswip.c
+++ b/drivers/net/dsa/lantiq_gswip.c
@@ -1044,18 +1044,18 @@ static int gswip_probe(struct platform_device *pdev)
 
 	gswip_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->gswip = devm_ioremap_resource(dev, gswip_res);
-	if (!priv->gswip)
-		return -ENOMEM;
+	if (IS_ERR(priv->gswip))
+		return PTR_ERR(priv->gswip);
 
 	mdio_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	priv->mdio = devm_ioremap_resource(dev, mdio_res);
-	if (!priv->mdio)
-		return -ENOMEM;
+	if (IS_ERR(priv->mdio))
+		return PTR_ERR(priv->mdio);
 
 	mii_res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	priv->mii = devm_ioremap_resource(dev, mii_res);
-	if (!priv->mii)
-		return -ENOMEM;
+	if (IS_ERR(priv->mii))
+		return PTR_ERR(priv->mii);
 
 	priv->hw_info = of_device_get_match_data(dev);
 	if (!priv->hw_info)
