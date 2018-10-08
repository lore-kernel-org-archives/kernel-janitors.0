From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Oct 2018 22:24:17 +0000
Subject: [PATCH] phy: inno-usb2-phy: fix off-by-one comparison on port number
Message-Id: <20181008222417.11739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Shawn Guo <shawn.guo@linaro.org>, Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the range check on the port index is off-by-one and a potential
out of bounds write can occur on priv->ports[i]. Fix this by checking the
maximum port using >= INNO_PHY_PORT_NUM rather than > INNO_PHY_PORT_NUM.

Detected by CoverityScan, CID#1466118 ("Out-of-bounds write")

Fixes: ba8b0ee81fbb ("phy: add inno-usb2-phy driver for hi3798cv200 SoC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
index 524381249a2b..b51e19402ab0 100644
--- a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
+++ b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
@@ -167,7 +167,7 @@ static int hisi_inno_phy_probe(struct platform_device *pdev)
 		phy_set_drvdata(phy, &priv->ports[i]);
 		i++;
 
-		if (i > INNO_PHY_PORT_NUM) {
+		if (i >= INNO_PHY_PORT_NUM) {
 			dev_warn(dev, "Support %d ports in maximum\n", i);
 			break;
 		}
-- 
2.17.1
