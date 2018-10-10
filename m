From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 10 Oct 2018 01:49:28 +0000
Subject: [PATCH -next] phy: phy-ocelot-serdes: fix return value check in serdes_probe()
Message-Id: <1539136824-44940-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

In case of error, the function syscon_node_to_regmap() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: 51f6b410fc22 ("phy: add driver for Microsemi Ocelot SerDes muxing")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/mscc/phy-ocelot-serdes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index 8936abd..b2be546 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -257,8 +257,8 @@ static int serdes_probe(struct platform_device *pdev)
 
 	ctrl->dev = &pdev->dev;
 	ctrl->regs = syscon_node_to_regmap(pdev->dev.parent->of_node);
-	if (!ctrl->regs)
-		return -ENODEV;
+	if (IS_ERR(ctrl->regs))
+		return PTR_ERR(ctrl->regs);
 
 	for (i = 0; i <= SERDES_MAX; i++) {
 		ret = serdes_phy_create(ctrl, i, &ctrl->phys[i]);
