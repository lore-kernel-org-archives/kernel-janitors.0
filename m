From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 26 Sep 2019 16:08:17 +0000
Subject: [PATCH] phy-brcm-usb: Use devm_platform_ioremap_resource() in brcm_usb_phy_probe()
Message-Id: <88679e6a-6701-7d30-d52e-5e970af4de04@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bcm-kernel-feedback-list@broadcom.com, Al Cooper <alcooperx@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Sep 2019 18:00:14 +0200

Simplify this function implementation a bit by using
a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/phy/broadcom/phy-brcm-usb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index f5c1f2983a1d..2a0a8bd2b056 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -298,12 +298,7 @@ static int brcm_usb_phy_probe(struct platform_device *pdev)
 	brcm_usb_set_family_map(&priv->ini);
 	dev_dbg(dev, "Best mapping table is for %s\n",
 		priv->ini.family_name);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "can't get USB_CTRL base address\n");
-		return -EINVAL;
-	}
-	priv->ini.ctrl_regs = devm_ioremap_resource(dev, res);
+	priv->ini.ctrl_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->ini.ctrl_regs)) {
 		dev_err(dev, "can't map CTRL register space\n");
 		return -EINVAL;
--
2.23.0
