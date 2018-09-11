From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 17:53:11 +0000
Subject: [PATCH][net-dsa-next] net: dsa: b53: ensure variable pause is initialized
Message-Id: <20180911175311.17929-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currenly integer pause is not initialized and may be left an
uninitialized state if flow control on BCM5301x's CPU port
is not enabled.  This will potentially feed garbage into
the TX or RX pause bits that are or'd into pause. Fix this
by ensuring pause is initialized to zero.

Detected by static analysis with smatch:
"error: uninitialized symbol 'pause'."

Fixes: 5e004460f874 ("net: dsa: b53: Add helper to set link parameters")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/b53/b53_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index ea4256cd628b..dbf5b86a07fe 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1025,7 +1025,7 @@ static void b53_adjust_link(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	struct ethtool_eee *p = &dev->ports[port].eee;
 	u8 rgmii_ctrl = 0, reg = 0, off;
-	int pause;
+	int pause = 0;
 
 	if (!phy_is_pseudo_fixed_link(phydev))
 		return;
-- 
2.17.1
