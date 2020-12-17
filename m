From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2020 11:04:59 +0000
Subject: [PATCH] phy: cadence-torrent: Fix error code in cdns_torrent_phy_probe()
Message-Id: <X9s7Wxq+b6ls0q7o@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>
Cc: Vinod Koul <vkoul@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path should return -EINVAL, but currently it returns
success.

Fixes: d09945eacad0 ("phy: cadence-torrent: Check total lane count for all subnodes is within limit")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index f310e15d94cb..591a15834b48 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2298,6 +2298,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 
 	if (total_num_lanes > MAX_NUM_LANES) {
 		dev_err(dev, "Invalid lane configuration\n");
+		ret = -EINVAL;
 		goto put_lnk_rst;
 	}
 
-- 
2.29.2
