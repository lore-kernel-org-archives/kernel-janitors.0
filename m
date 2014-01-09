From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 05:34:00 +0000
Subject: [patch] cxgb4: silence shift wrapping static checker warning
Message-Id: <20140109053400.GF1265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitris Michailidis <dm@chelsio.com>, Kumar Sanghvi <kumaras@chelsio.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I don't know how large "tp->vlan_shift" is but static checkers worry
about shift wrapping bugs here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/chelsio/cxgb4/l2t.c b/drivers/net/ethernet/chelsio/cxgb4/l2t.c
index cb05be905def..81e8402a74b4 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/l2t.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/l2t.c
@@ -423,7 +423,7 @@ u64 cxgb4_select_ntuple(struct net_device *dev,
 	 * in the Compressed Filter Tuple.
 	 */
 	if (tp->vlan_shift >= 0 && l2t->vlan != VLAN_NONE)
-		ntuple |= (F_FT_VLAN_VLD | l2t->vlan) << tp->vlan_shift;
+		ntuple |= (u64)(F_FT_VLAN_VLD | l2t->vlan) << tp->vlan_shift;
 
 	if (tp->port_shift >= 0)
 		ntuple |= (u64)l2t->lport << tp->port_shift;
