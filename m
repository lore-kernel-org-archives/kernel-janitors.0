From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 13:30:35 +0000
Subject: [PATCH] ethernet: Use devm_platform_ioremap_resource() in three functions
Message-Id: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 15:15:06 +0200

Simplify these function implementations by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/cortina/gemini.c             |  6 +-----
 drivers/net/ethernet/lantiq_xrx200.c              | 11 +----------
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  9 +--------
 3 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index e736ce2c58ca..f009415ee4d8 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2549,17 +2549,13 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gemini_ethernet *geth;
 	unsigned int retry = 5;
-	struct resource *res;
 	u32 val;

 	/* Global registers */
 	geth = devm_kzalloc(dev, sizeof(*geth), GFP_KERNEL);
 	if (!geth)
 		return -ENOMEM;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	geth->base = devm_ioremap_resource(dev, res);
+	geth->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(geth->base))
 		return PTR_ERR(geth->base);
 	geth->dev = dev;
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
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 4fc627fb4d11..92783aaaa0a2 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1787,14 +1787,7 @@ static int axienet_probe(struct platform_device *pdev)
 		of_node_put(np);
 		lp->eth_irq = platform_get_irq(pdev, 0);
 	} else {
-		/* Check for these resources directly on the Ethernet node. */
-		struct resource *res = platform_get_resource(pdev,
-							     IORESOURCE_MEM, 1);
-		if (!res) {
-			dev_err(&pdev->dev, "unable to get DMA memory resource\n");
-			goto free_netdev;
-		}
-		lp->dma_regs = devm_ioremap_resource(&pdev->dev, res);
+		lp->dma_regs = devm_platform_ioremap_resource(pdev, 1);
 		lp->rx_irq = platform_get_irq(pdev, 1);
 		lp->tx_irq = platform_get_irq(pdev, 0);
 		lp->eth_irq = platform_get_irq(pdev, 2);
--
2.23.0
