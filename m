From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 06:53:42 +0000
Subject: [patch] bnx2x: off by one in bnx2x_ets_e3b0_sp_pri_to_cos_set()
Message-Id: <20120418065342.GC12831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The sp_pri_to_cos[] array size depends on the config but lets say it is
BX_E3B0_MAX_NUM_COS_PORT0 and max_num_of_cos is also
DCBX_E3B0_MAX_NUM_COS_PORT0.  In the original code
"pri = max_num_of_cos" was accepted but it is one past the end of the
array.

Also we used "pri" before capping it.  It's a harmless read past the end
of the array, but it would affect which error message gets printed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index ff882a4..6b21b21 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -922,6 +922,12 @@ static int bnx2x_ets_e3b0_sp_pri_to_cos_set(const struct link_params *params,
 	const u8 max_num_of_cos = (port) ? DCBX_E3B0_MAX_NUM_COS_PORT1 :
 		DCBX_E3B0_MAX_NUM_COS_PORT0;
 
+	if (pri >= max_num_of_cos) {
+		DP(NETIF_MSG_LINK, "bnx2x_ets_e3b0_sp_pri_to_cos_set invalid "
+		   "parameter Illegal strict priority\n");
+	    return -EINVAL;
+	}
+
 	if (sp_pri_to_cos[pri] != DCBX_INVALID_COS) {
 		DP(NETIF_MSG_LINK, "bnx2x_ets_e3b0_sp_pri_to_cos_set invalid "
 				   "parameter There can't be two COS's with "
@@ -929,12 +935,6 @@ static int bnx2x_ets_e3b0_sp_pri_to_cos_set(const struct link_params *params,
 		return -EINVAL;
 	}
 
-	if (pri > max_num_of_cos) {
-		DP(NETIF_MSG_LINK, "bnx2x_ets_e3b0_sp_pri_to_cos_set invalid "
-		   "parameter Illegal strict priority\n");
-	    return -EINVAL;
-	}
-
 	sp_pri_to_cos[pri] = cos_entry;
 	return 0;
 
