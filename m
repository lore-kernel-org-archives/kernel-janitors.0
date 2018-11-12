From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 12 Nov 2018 01:47:30 +0000
Subject: [PATCH net-next] net: phy: marvell: remove set but not used variable 'pause'
Message-Id: <1541987250-18687-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/phy/marvell.c: In function 'm88e1510_config_init':
drivers/net/phy/marvell.c:850:7: warning:
 variable 'pause' set but not used [-Wunused-but-set-variable]

It not used any more after commit 3c1bcc8614db ("net: ethernet: Convert phydev
advertize and supported from u32 to link mode")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/phy/marvell.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 36a0db8..6a98819 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -847,7 +847,6 @@ static int m88e1510_config_init(struct phy_device *phydev)
 
 	/* SGMII-to-Copper mode initialization */
 	if (phydev->interface = PHY_INTERFACE_MODE_SGMII) {
-		u32 pause;
 
 		/* Select page 18 */
 		err = marvell_set_page(phydev, 18);
@@ -878,7 +877,6 @@ static int m88e1510_config_init(struct phy_device *phydev)
 		 * This means we can never be truely sure what was advertised,
 		 * so disable Pause support.
 		 */
-		pause = SUPPORTED_Pause | SUPPORTED_Asym_Pause;
 		linkmode_clear_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
 				   phydev->supported);
 		linkmode_clear_bit(ETHTOOL_LINK_MODE_Pause_BIT,
