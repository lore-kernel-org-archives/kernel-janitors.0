From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 07 May 2020 20:31:27 +0000
Subject: [PATCH] phy: cpcap-usb: Remove some useless code
Message-Id: <20200507203127.202197-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon@ti.com, vkoul@kernel.org, tony@atomide.com, pavel@ucw.cz, sebastian.reichel@collabora.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Axe a clk that is unused in the driver.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 12e71a315a2c..089db0dea703 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -122,7 +122,6 @@ enum cpcap_gpio_mode {
 struct cpcap_phy_ddata {
 	struct regmap *reg;
 	struct device *dev;
-	struct clk *refclk;
 	struct usb_phy phy;
 	struct delayed_work detect_work;
 	struct pinctrl *pins;
@@ -707,7 +706,6 @@ static int cpcap_usb_phy_remove(struct platform_device *pdev)
 
 	usb_remove_phy(&ddata->phy);
 	cancel_delayed_work_sync(&ddata->detect_work);
-	clk_unprepare(ddata->refclk);
 	regulator_disable(ddata->vusb);
 
 	return 0;
-- 
2.25.1
