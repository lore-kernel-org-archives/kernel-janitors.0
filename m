From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 06:38:11 +0000
Subject: [PATCH] usb: phy: jz4770: Add a missing '\n' in a log message
Message-Id: <20200411063811.6767-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, paul@crapouillou.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 541368b46b82 ("usb: phy: Add driver for the Ingenic JZ4770 USB transceiver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/phy/phy-jz4770.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-jz4770.c b/drivers/usb/phy/phy-jz4770.c
index 3ea1f5b9bcf8..8f62dc2a90ff 100644
--- a/drivers/usb/phy/phy-jz4770.c
+++ b/drivers/usb/phy/phy-jz4770.c
@@ -125,13 +125,13 @@ static int jz4770_phy_init(struct usb_phy *phy)
 
 	err = regulator_enable(priv->vcc_supply);
 	if (err) {
-		dev_err(priv->dev, "Unable to enable VCC: %d", err);
+		dev_err(priv->dev, "Unable to enable VCC: %d\n", err);
 		return err;
 	}
 
 	err = clk_prepare_enable(priv->clk);
 	if (err) {
-		dev_err(priv->dev, "Unable to start clock: %d", err);
+		dev_err(priv->dev, "Unable to start clock: %d\n", err);
 		return err;
 	}
 
@@ -191,7 +191,7 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
-		dev_err(dev, "Failed to map registers");
+		dev_err(dev, "Failed to map registers\n");
 		return PTR_ERR(priv->base);
 	}
 
@@ -199,7 +199,7 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clk)) {
 		err = PTR_ERR(priv->clk);
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clock");
+			dev_err(dev, "Failed to get clock\n");
 		return err;
 	}
 
@@ -207,14 +207,14 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->vcc_supply)) {
 		err = PTR_ERR(priv->vcc_supply);
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "failed to get regulator");
+			dev_err(dev, "Failed to get regulator\n");
 		return err;
 	}
 
 	err = usb_add_phy(&priv->phy, USB_PHY_TYPE_USB2);
 	if (err) {
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Unable to register PHY");
+			dev_err(dev, "Unable to register PHY\n");
 		return err;
 	}
 
-- 
2.20.1
