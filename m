From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Sep 2020 12:46:48 +0000
Subject: [PATCH] phy: ti: am654: Fix a leak in serdes_am654_probe()
Message-Id: <20200905124648.GA183976@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If devm_phy_create() fails then we need to call of_clk_del_provider(node)
to undo the call to of_clk_add_provider().

Fixes: 71e2f5c5c224 ("phy: ti: Add a new SERDES driver for TI's AM654x SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/ti/phy-am654-serdes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 6f3c11bd65d5..2ff56ce77b30 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -822,8 +822,10 @@ static int serdes_am654_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	phy = devm_phy_create(dev, NULL, &ops);
-	if (IS_ERR(phy))
-		return PTR_ERR(phy);
+	if (IS_ERR(phy)) {
+		ret = PTR_ERR(phy);
+		goto clk_err;
+	}
 
 	phy_set_drvdata(phy, am654_phy);
 	phy_provider = devm_of_phy_provider_register(dev, serdes_am654_xlate);
-- 
2.28.0
