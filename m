From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 06:54:36 +0000
Subject: [PATCH] net: dsa: bcm_sf2: remove redundant variable off
Message-Id: <20180704065436.13719-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'off' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'off' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/bcm_sf2.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 02e8982519ce..ac96ff40d37e 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -220,7 +220,7 @@ static void bcm_sf2_port_disable(struct dsa_switch *ds, int port,
 				 struct phy_device *phy)
 {
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
-	u32 off, reg;
+	u32 reg;
 
 	if (priv->wol_ports_mask & (1 << port))
 		return;
@@ -231,11 +231,6 @@ static void bcm_sf2_port_disable(struct dsa_switch *ds, int port,
 	if (priv->int_phy_mask & 1 << port && priv->hw_params.num_gphy = 1)
 		bcm_sf2_gphy_enable_set(ds, false);
 
-	if (dsa_is_cpu_port(ds, port))
-		off = CORE_IMP_CTL;
-	else
-		off = CORE_G_PCTL_PORT(port);
-
 	b53_disable_port(ds, port, phy);
 
 	/* Power down the port memory */
-- 
2.17.1

