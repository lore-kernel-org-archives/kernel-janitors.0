From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 10:50:26 +0000
Subject: [PATCH] phy-rockchip-inno-hdmi: fix spelling mistake "Innosilion" -> "Innosilicon"
Message-Id: <20191105105026.50581-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 2b97fb1185a0..91923209a026 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -1273,5 +1273,5 @@ static struct platform_driver inno_hdmi_phy_driver = {
 module_platform_driver(inno_hdmi_phy_driver);
 
 MODULE_AUTHOR("Zheng Yang <zhengyang@rock-chips.com>");
-MODULE_DESCRIPTION("Innosilion HDMI 2.0 Transmitter PHY Driver");
+MODULE_DESCRIPTION("Innosilicon HDMI 2.0 Transmitter PHY Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
