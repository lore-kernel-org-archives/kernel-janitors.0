From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 Jan 2018 21:28:08 +0000
Subject: [PATCH] netcp_ethss: Delete error messages for a failed memory allocation in three functions
Message-Id: <f91480d3-dea1-19b0-de9a-c336267fea32@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <santosh.shilimkar@kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jan 2018 22:08:50 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/ti/netcp_ethss.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index 4ad821655e51..91ce6f8f8098 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -3176,20 +3176,15 @@ static int set_xgbe_ethss10_priv(struct gbe_priv *gbe_dev,
 	gbe_dev->hw_stats = devm_kzalloc(gbe_dev->dev,
 					 gbe_dev->num_et_stats * sizeof(u64),
 					 GFP_KERNEL);
-	if (!gbe_dev->hw_stats) {
-		dev_err(gbe_dev->dev, "hw_stats memory allocation failed\n");
+	if (!gbe_dev->hw_stats)
 		return -ENOMEM;
-	}
 
 	gbe_dev->hw_stats_prev  		devm_kzalloc(gbe_dev->dev,
 			     gbe_dev->num_et_stats * sizeof(u32),
 			     GFP_KERNEL);
-	if (!gbe_dev->hw_stats_prev) {
-		dev_err(gbe_dev->dev,
-			"hw_stats_prev memory allocation failed\n");
+	if (!gbe_dev->hw_stats_prev)
 		return -ENOMEM;
-	}
 
 	gbe_dev->ss_version = XGBE_SS_VERSION_10;
 	gbe_dev->sgmii_port_regs = gbe_dev->ss_regs +
@@ -3296,20 +3291,15 @@ static int set_gbe_ethss14_priv(struct gbe_priv *gbe_dev,
 	gbe_dev->hw_stats = devm_kzalloc(gbe_dev->dev,
 					 gbe_dev->num_et_stats * sizeof(u64),
 					 GFP_KERNEL);
-	if (!gbe_dev->hw_stats) {
-		dev_err(gbe_dev->dev, "hw_stats memory allocation failed\n");
+	if (!gbe_dev->hw_stats)
 		return -ENOMEM;
-	}
 
 	gbe_dev->hw_stats_prev  		devm_kzalloc(gbe_dev->dev,
 			     gbe_dev->num_et_stats * sizeof(u32),
 			     GFP_KERNEL);
-	if (!gbe_dev->hw_stats_prev) {
-		dev_err(gbe_dev->dev,
-			"hw_stats_prev memory allocation failed\n");
+	if (!gbe_dev->hw_stats_prev)
 		return -ENOMEM;
-	}
 
 	gbe_dev->sgmii_port_regs = gbe_dev->ss_regs + GBE13_SGMII_MODULE_OFFSET;
 	gbe_dev->host_port_regs = gbe_dev->switch_regs + GBE13_HOST_PORT_OFFSET;
@@ -3368,20 +3358,15 @@ static int set_gbenu_ethss_priv(struct gbe_priv *gbe_dev,
 	gbe_dev->hw_stats = devm_kzalloc(gbe_dev->dev,
 					 gbe_dev->num_et_stats * sizeof(u64),
 					 GFP_KERNEL);
-	if (!gbe_dev->hw_stats) {
-		dev_err(gbe_dev->dev, "hw_stats memory allocation failed\n");
+	if (!gbe_dev->hw_stats)
 		return -ENOMEM;
-	}
 
 	gbe_dev->hw_stats_prev  		devm_kzalloc(gbe_dev->dev,
 			     gbe_dev->num_et_stats * sizeof(u32),
 			     GFP_KERNEL);
-	if (!gbe_dev->hw_stats_prev) {
-		dev_err(gbe_dev->dev,
-			"hw_stats_prev memory allocation failed\n");
+	if (!gbe_dev->hw_stats_prev)
 		return -ENOMEM;
-	}
 
 	ret = of_address_to_resource(node, GBENU_SM_REG_INDEX, &res);
 	if (ret) {
-- 
2.15.1

