From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 03 Jul 2016 05:55:32 +0000
Subject: [PATCH] phy: fix error handling
Message-Id: <1467525332-12963-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

This is likely that checking 'phy->hsic_clk' instead of 'phy->clk' is
expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/phy/phy-sun9i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-sun9i-usb.c b/drivers/phy/phy-sun9i-usb.c
index ac4f31a..ff99eba 100644
--- a/drivers/phy/phy-sun9i-usb.c
+++ b/drivers/phy/phy-sun9i-usb.c
@@ -141,7 +141,7 @@ static int sun9i_usb_phy_probe(struct platform_device *pdev)
 		}
 
 		phy->hsic_clk = devm_clk_get(dev, "hsic_12M");
-		if (IS_ERR(phy->clk)) {
+		if (IS_ERR(phy->hsic_clk)) {
 			dev_err(dev, "failed to get hsic_12M clock\n");
 			return PTR_ERR(phy->clk);
 		}
-- 
2.7.4

