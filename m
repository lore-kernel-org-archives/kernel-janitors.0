From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 10:57:00 +0000
Subject: [PATCH v2] ethernet: lantiq_xrx200: Use devm_platform_ioremap_resource() in xrx200_probe()
Message-Id: <43bed158-2af9-c518-2f97-a473c2b84eb7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
In-Reply-To: <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Hauke Mehrtens <hauke@hauke-m.de>, Radhey Shyam Pandey <radheys@xilinx.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 11:48:33 +0200

Simplify this function implementation by using the wrapper function
“devm_platform_ioremap_resource” instead of calling the functions
“platform_get_resource” and “devm_ioremap_resource” directly.

* Thus reduce also a bit of exception handling code here.
* Delete the local variable “res”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Further changes were requested by Radhey Shyam Pandey.

https://lore.kernel.org/r/CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com/



* Updates for three modules were split into a separate patch for each driver.

* The commit description was adjusted.





 drivers/net/ethernet/lantiq_xrx200.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/ethernet/lantiq_xrx200.c
index 900affbdcc0e..0a7ea45b9e59 100644
--- a/drivers/net/ethernet/lantiq_xrx200.c
+++ b/drivers/net/ethernet/lantiq_xrx200.c
@@ -424,7 +424,6 @@ static int xrx200_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	struct xrx200_priv *priv;
 	struct net_device *net_dev;
 	const u8 *mac;
@@ -443,15 +442,7 @@ static int xrx200_probe(struct platform_device *pdev)
 	SET_NETDEV_DEV(net_dev, dev);
 	net_dev->min_mtu = ETH_ZLEN;
 	net_dev->max_mtu = XRX200_DMA_DATA_LEN;
-
-	/* load the memory ranges */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get resources\n");
-		return -ENOENT;
-	}
-
-	priv->pmac_reg = devm_ioremap_resource(dev, res);
+	priv->pmac_reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->pmac_reg)) {
 		dev_err(dev, "failed to request and remap io ranges\n");
 		return PTR_ERR(priv->pmac_reg);
--
2.23.0
