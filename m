From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 08 Oct 2018 13:56:42 +0000
Subject: [PATCH net-next] net: mscc: ocelot: remove set but not used variable 'phy_mode'
Message-Id: <1539007670-82488-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/mscc/ocelot_board.c: In function 'mscc_ocelot_probe':
drivers/net/ethernet/mscc/ocelot_board.c:262:17: warning:
 variable 'phy_mode' set but not used [-Wunused-but-set-variable]
   enum phy_mode phy_mode;

It never used since introduction in 
commit 71e32a20cfbf ("net: mscc: ocelot: make use of SerDes PHYs for handling their configuration")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/mscc/ocelot_board.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
index 953b326..0cf0b09 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -259,7 +259,6 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		struct phy_device *phy;
 		struct resource *res;
 		struct phy *serdes;
-		enum phy_mode phy_mode;
 		void __iomem *regs;
 		char res_name[8];
 		u32 port;
@@ -297,10 +296,8 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		case PHY_INTERFACE_MODE_NA:
 			continue;
 		case PHY_INTERFACE_MODE_SGMII:
-			phy_mode = PHY_MODE_SGMII;
 			break;
 		case PHY_INTERFACE_MODE_QSGMII:
-			phy_mode = PHY_MODE_QSGMII;
 			break;
 		default:
 			dev_err(ocelot->dev,
