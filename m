From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jan 2020 12:59:25 +0000
Subject: [PATCH][next] phy: cadence: Sierra: remove redundant initialization of pointer regmap
Message-Id: <20200107125925.102082-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Anil Varughese <aniljoy@cadence.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer regmap is being initialized with a value that is never
read and it is being updated later with a new value from
phy->regmap_common_cdb.  The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/cadence/phy-cadence-sierra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index eb87f1a0a596..ecfb1f9de2e3 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -272,7 +272,7 @@ static int cdns_sierra_phy_init(struct phy *gphy)
 {
 	struct cdns_sierra_inst *ins = phy_get_drvdata(gphy);
 	struct cdns_sierra_phy *phy = dev_get_drvdata(gphy->dev.parent);
-	struct regmap *regmap = phy->regmap;
+	struct regmap *regmap;
 	int i, j;
 	struct cdns_reg_pairs *cmn_vals, *ln_vals;
 	u32 num_cmn_regs, num_ln_regs;
-- 
2.24.0
