From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 11:56:53 +0000
Subject: [PATCH][next] phy: ti: ensure priv is not null before dereferencing it
Message-Id: <20181222115653.32648-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently priv is being dereferenced before priv is being null checked.
Fix this by moving the null check on priv before the dereference.

Detected by CoverityScan, CID#1476018 ("Dereference before null check")

Fixes: 92b58b34741f ("phy: ti: introduce phy-gmii-sel driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/ti/phy-gmii-sel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 77fdaa551977..a52c5bb35033 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -204,11 +204,11 @@ static struct phy *phy_gmii_sel_of_xlate(struct device *dev,
 
 	if (args->args_count < 1)
 		return ERR_PTR(-EINVAL);
+	if (!priv || !priv->if_phys)
+		return ERR_PTR(-ENODEV);
 	if (priv->soc_data->features & BIT(PHY_GMII_SEL_RMII_IO_CLK_EN) &&
 	    args->args_count < 2)
 		return ERR_PTR(-EINVAL);
-	if (!priv || !priv->if_phys)
-		return ERR_PTR(-ENODEV);
 	if (phy_id > priv->soc_data->num_ports)
 		return ERR_PTR(-EINVAL);
 	if (phy_id != priv->if_phys[phy_id - 1].id)
-- 
2.19.1
