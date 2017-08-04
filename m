From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Aug 2017 08:17:21 +0000
Subject: [PATCH] net: phy: marvell: logical vs bitwise OR typo
Message-Id: <20170804081720.2g6yuthplhc4rv6b@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This was supposed to be a bitwise OR but there is a || vs | typo.

Fixes: 864dc729d528 ("net: phy: marvell: Refactor m88e1121 RGMII delay configuration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 361fe9927ef2..15cbcdba618a 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -83,7 +83,7 @@
 #define MII_88E1121_PHY_MSCR_REG	21
 #define MII_88E1121_PHY_MSCR_RX_DELAY	BIT(5)
 #define MII_88E1121_PHY_MSCR_TX_DELAY	BIT(4)
-#define MII_88E1121_PHY_MSCR_DELAY_MASK	(~(BIT(5) || BIT(4)))
+#define MII_88E1121_PHY_MSCR_DELAY_MASK	(~(BIT(5) | BIT(4)))
 
 #define MII_88E1121_MISC_TEST				0x1a
 #define MII_88E1510_MISC_TEST_TEMP_THRESHOLD_MASK	0x1f00
