From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 11:47:46 +0000
Subject: [patch] bnx2x: use strlcpy() to copy a string
Message-Id: <20121002114746.GB1413@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

DRV_MODULE_VERSION is smaller than the ->version buffer so the memcpy()
copies 1 byte past the end of the string.  It's not super harmful, but
it makes the static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index f7ed122..d5648fc 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -3052,9 +3052,8 @@ static void bnx2x_drv_info_ether_stat(struct bnx2x *bp)
 	struct eth_stats_info *ether_stat  		&bp->slowpath->drv_info_to_mcp.ether_stat;
 
-	/* leave last char as NULL */
-	memcpy(ether_stat->version, DRV_MODULE_VERSION,
-	       ETH_STAT_INFO_VERSION_LEN - 1);
+	strlcpy(ether_stat->version, DRV_MODULE_VERSION,
+		ETH_STAT_INFO_VERSION_LEN);
 
 	bp->sp_objs[0].mac_obj.get_n_elements(bp, &bp->sp_objs[0].mac_obj,
 					DRV_INFO_ETH_STAT_NUM_MACS_REQUIRED,
