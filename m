From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 14:34:30 +0000
Subject: [PATCH][next] net: phy: fix less than zero comparison with unsigned variable val
Message-Id: <20200507143430.50507-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, Oleksij Rempel <linux@rempel-privat.de>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The unsigned variable val is being checked for an error by checking
if it is less than zero. This can never occur because val is unsigned.
Fix this by making val a plain int.

Addresses-Coverity: ("Unsigned compared against zero")
Fixes: bdbdac7649fa ("ethtool: provide UAPI for PHY master/slave configuration.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/phy_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 83fc8e1b5793..c3a107cf578e 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1948,7 +1948,7 @@ static int genphy_setup_master_slave(struct phy_device *phydev)
 static int genphy_read_master_slave(struct phy_device *phydev)
 {
 	int cfg, state;
-	u16 val;
+	int val;
 
 	if (!phydev->is_gigabit_capable) {
 		phydev->master_slave_get = MASTER_SLAVE_CFG_UNSUPPORTED;
-- 
2.25.1
