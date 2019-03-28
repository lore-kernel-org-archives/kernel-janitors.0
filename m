From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:32:15 +0000
Subject: [PATCH] phy: tegra: xusb: testing the wrong variable in probe()
Message-Id: <20190328143214.GP32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "usb2->clk" pointer is not an error pointer.  We meant to test
"priv->usb2_trk_clk" instead.

Fixes: b8998e928030 ("phy: tegra: xusb: Add Tegra186 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 11ad6e4e4711..a627fe0b8e54 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -467,8 +467,8 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *padctl,
 	}
 
 	priv->usb2_trk_clk = devm_clk_get(&pad->dev, "trk");
-	if (IS_ERR(usb2->clk)) {
-		err = PTR_ERR(usb2->clk);
+	if (IS_ERR(priv->usb2_trk_clk)) {
+		err = PTR_ERR(priv->usb2_trk_clk);
 		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);
 		goto unregister;
 	}
-- 
2.17.1
