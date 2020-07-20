From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Jul 2020 16:29:52 +0000
Subject: [PATCH][next] phy: samsung-ufs: fix check on failed devm_clk_get call for rx1_symbol_clk
Message-Id: <20200720162952.339697-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Seungwon Jeon <essuuj@gmail.com>, Kiwoong Kim <kwmad.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if the call to devm_clk_get on rx1_symbol_clk is checking
the wrong variable, this looks like a copy-paste error. Fix this to check
phy->rx1_symbol instead of phy->rx0_symbol.

Addresses-Coverity: ("Copy-paste error")
Fixes: bca21e930451 ("phy: samsung-ufs: add UFS PHY driver for samsung SoC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 43ef77d1d96c..9832599a0283 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -147,7 +147,7 @@ static int samsung_ufs_phy_symbol_clk_init(struct samsung_ufs_phy *phy)
 	}
 
 	phy->rx1_symbol_clk = devm_clk_get(phy->dev, "rx1_symbol_clk");
-	if (IS_ERR(phy->rx0_symbol_clk)) {
+	if (IS_ERR(phy->rx1_symbol_clk)) {
 		dev_err(phy->dev, "failed to get rx1_symbol_clk clock\n");
 		return PTR_ERR(phy->rx1_symbol_clk);
 	}
-- 
2.27.0
