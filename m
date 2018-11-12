From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Nov 2018 23:45:56 +0000
Subject: [PATCH][net-next] net: phy: check if advertising is zero using linkmode_empty
Message-Id: <20181112234556.5291-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent change modified variable advertising from a u32 to a link mode
array and left the u32 zero comparison, so essential we now have an array
being compared to null which is not the intention. Fix this by using the
call to linkmode_empty to check if advertising is all zero.

Detected by CoverityScan, CID#1475424 ("Array compared against 0")

Fixes: 3c1bcc8614db ("net: ethernet: Convert phydev advertize and supported from u32 to link mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index d73873334e47..101b83d08864 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -328,7 +328,7 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 	if (autoneg != AUTONEG_ENABLE && autoneg != AUTONEG_DISABLE)
 		return -EINVAL;
 
-	if (autoneg = AUTONEG_ENABLE && advertising = 0)
+	if (autoneg = AUTONEG_ENABLE && linkmode_empty(advertising))
 		return -EINVAL;
 
 	if (autoneg = AUTONEG_DISABLE &&
-- 
2.19.1
