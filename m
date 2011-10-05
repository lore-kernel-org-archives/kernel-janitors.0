From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Oct 2011 05:49:18 +0000
Subject: [patch] bnx2x: remove some dead code
Message-Id: <20111005054918.GC32077@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code is after the break statement so it never gets used.  The
"vlan_mac_obj" variable does get initialized properly, so we can just
delete this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 04f17a1..6486ab8 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -4353,8 +4353,6 @@ static inline void bnx2x_handle_classification_eqe(struct bnx2x *bp,
 			vlan_mac_obj = &bp->fp[cid].mac_obj;
 
 		break;
-		vlan_mac_obj = &bp->fp[cid].mac_obj;
-
 	case BNX2X_FILTER_MCAST_PENDING:
 		/* This is only relevant for 57710 where multicast MACs are
 		 * configured as unicast MACs using the same ramrod.
