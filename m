From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 19:17:55 +0000
Subject: [PATCH] ehea: Delete an error message for a failed memory allocation in two functions
Message-Id: <68b26725-68b2-9965-93b1-dd0013cc6f7a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Douglas Miller <dougmill@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 20:14:25 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/ibm/ehea/ehea_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 4878b7169e0f..b234bb9b9586 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -1512,7 +1512,6 @@ static int ehea_init_port_res(struct ehea_port *port, struct ehea_port_res *pr,
 	init_attr = kzalloc(sizeof(*init_attr), GFP_KERNEL);
 	if (!init_attr) {
 		ret = -ENOMEM;
-		pr_err("no mem for ehea_qp_init_attr\n");
 		goto out_free;
 	}
 
@@ -3409,7 +3408,6 @@ static int ehea_probe_adapter(struct platform_device *dev)
 	adapter = devm_kzalloc(&dev->dev, sizeof(*adapter), GFP_KERNEL);
 	if (!adapter) {
 		ret = -ENOMEM;
-		dev_err(&dev->dev, "no mem for ehea_adapter\n");
 		goto out;
 	}
 
-- 
2.15.1

