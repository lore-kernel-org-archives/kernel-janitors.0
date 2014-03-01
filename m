From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 01 Mar 2014 13:54:36 +0000
Subject: [patch] qlcnic: dcb: a couple off by one bugs
Message-Id: <20140301135436.GB23929@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shahed Shaikh <shahed.shaikh@qlogic.com>
Cc: Dept-HSGLinuxNICDev@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->tc_cfg[] array has QLC_DCB_MAX_TC (8) elements so the check is
off by one.  These functions are always called with valid values though
so it doesn't affect how the code works.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.c
index 77f1bce432d2..7d4f54912bad 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.c
@@ -807,7 +807,7 @@ qlcnic_dcb_get_pg_tc_cfg_tx(struct net_device *netdev, int tc, u8 *prio,
 	    !type->tc_param_valid)
 		return;
 
-	if (tc < 0 || (tc > QLC_DCB_MAX_TC))
+	if (tc < 0 || (tc >= QLC_DCB_MAX_TC))
 		return;
 
 	tc_cfg = &type->tc_cfg[tc];
@@ -843,7 +843,7 @@ static void qlcnic_dcb_get_pg_bwg_cfg_tx(struct net_device *netdev, int pgid,
 	    !type->tc_param_valid)
 		return;
 
-	if (pgid < 0 || pgid > QLC_DCB_MAX_PG)
+	if (pgid < 0 || pgid >= QLC_DCB_MAX_PG)
 		return;
 
 	pgcfg = &type->pg_cfg[pgid];
