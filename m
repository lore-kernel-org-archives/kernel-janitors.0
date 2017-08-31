From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 16:43:49 +0000
Subject: [PATCH][next] phy: mvebu-cp110-comphy: fix -ve error return against a u32
Message-Id: <20170831164349.2826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, "David S . Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if the call to mvebu_comphy_get_mux failed is always
false because mux is a u32 and can never be less than zero. Fix this
by making mux an int and casting to u32 on shift later on.

Detected by CoverityScan, CID#1455220 ("Unsigned compared against 0")

Fixes: d0438bd6aa09 ("phy: add the mvebu cp110 comphy driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 73ebad6634a7..7e21b2a977b9 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -468,8 +468,8 @@ static int mvebu_comphy_power_on(struct phy *phy)
 {
 	struct mvebu_comphy_lane *lane = phy_get_drvdata(phy);
 	struct mvebu_comphy_priv *priv = lane->priv;
-	int ret;
-	u32 mux, val;
+	int ret, mux;
+	u32 val;
 
 	mux = mvebu_comphy_get_mux(lane->id, lane->port, lane->mode);
 	if (mux < 0)
@@ -477,7 +477,7 @@ static int mvebu_comphy_power_on(struct phy *phy)
 
 	regmap_read(priv->regmap, MVEBU_COMPHY_SELECTOR, &val);
 	val &= ~(0xf << MVEBU_COMPHY_SELECTOR_PHY(lane->id));
-	val |= mux << MVEBU_COMPHY_SELECTOR_PHY(lane->id);
+	val |= (u32)mux << MVEBU_COMPHY_SELECTOR_PHY(lane->id);
 	regmap_write(priv->regmap, MVEBU_COMPHY_SELECTOR, val);
 
 	switch (lane->mode) {
-- 
2.14.1

