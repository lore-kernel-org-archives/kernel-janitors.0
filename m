From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 10:02:07 +0000
Subject: [PATCH net-next] net: phy: marvell: unlock after phy_select_page() failure
Message-Id: <20200529100207.GB1304852@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to call phy_restore_page() even if phy_select_page() fails.
Otherwise we are holding the phy_lock_mdio_bus() lock.  This requirement
is documented at the start of the phy_select_page() function.

Fixes: a618e86da91d ("net : phy: marvell: Speedup TDR data retrieval by only changing page once")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/phy/marvell.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 2c04e3b2b285f..4ea226566cec9 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1867,7 +1867,7 @@ static int marvell_vct5_amplitude_graph(struct phy_device *phydev)
 	 */
 	page = phy_select_page(phydev, MII_MARVELL_VCT5_PAGE);
 	if (page < 0)
-		return page;
+		goto restore_page;
 
 	for (distance = priv->first;
 	     distance <= priv->last;
-- 
2.26.2
