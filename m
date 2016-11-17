From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Nov 2016 10:59:32 +0000
Subject: [patch] amd-xgbe: Signedness bug in xgbe_phy_link_status()
Message-Id: <20161117105932.GA32143@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" needs to be signed for the error handling to work.

Fixes: abf0a1c2b26a ("amd-xgbe: Add support for SFP+ modules")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
index 4ba4332..a2559c2 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
@@ -2346,7 +2346,8 @@ static bool xgbe_phy_valid_speed(struct xgbe_prv_data *pdata, int speed)
 static int xgbe_phy_link_status(struct xgbe_prv_data *pdata, int *an_restart)
 {
 	struct xgbe_phy_data *phy_data = pdata->phy_data;
-	unsigned int ret, reg;
+	unsigned int reg;
+	int ret;
 
 	*an_restart = 0;
 
