From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 22 Nov 2016 05:14:40 +0000
Subject: [PATCH] bnxt_en: Fix a VXLAN vs GENEVE issue
Message-Id: <20161122051440.9748-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, michael.chan@broadcom.com, prashant.sreedharan@broadcom.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Knowing that:
  #define TUNNEL_DST_PORT_FREE_REQ_TUNNEL_TYPE_VXLAN        (0x1UL << 0)
  #define TUNNEL_DST_PORT_FREE_REQ_TUNNEL_TYPE_GENEVE       (0x5UL << 0)
and that 'bnxt_hwrm_tunnel_dst_port_alloc()' is only called with one of
these 2 constants, the TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_GENEVE can not
trigger.

Replace the bit test that overlap by an equality test, just as in
'bnxt_hwrm_tunnel_dst_port_free()' above.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile-tested only
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d313b02485a1..25d9ffe51825 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3210,11 +3210,17 @@ static int bnxt_hwrm_tunnel_dst_port_alloc(struct bnxt *bp, __be16 port,
 		goto err_out;
 	}
 
-	if (tunnel_type & TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_VXLAN)
+	switch (tunnel_type) {
+	case TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_VXLAN:
 		bp->vxlan_fw_dst_port_id = resp->tunnel_dst_port_id;
-
-	else if (tunnel_type & TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_GENEVE)
+		break;
+	case TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_GENEVE:
 		bp->nge_fw_dst_port_id = resp->tunnel_dst_port_id;
+		break;
+	default:
+		break;
+	}
+
 err_out:
 	mutex_unlock(&bp->hwrm_cmd_lock);
 	return rc;
-- 
2.9.3

