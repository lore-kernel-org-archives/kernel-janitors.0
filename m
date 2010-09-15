From: Dan Carpenter <error27@gmail.com>
Date: Wed, 15 Sep 2010 16:32:39 +0000
Subject: [patch] infiniband: nes_cm: remove unneeded variable
Message-Id: <20100915160726.GA5854@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Chien Tung <chien.tin.tung-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Or Gerlitz <ogerlitz-smomgflXvOZWk0Htik3J/w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Just a small cleanup.  The "passive_state" variable isn't used any more
after: dae58728dc "RDMA/nes: Fix double CLOSE event indication crash"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/hw/nes/nes_cm.c b/drivers/infiniband/hw/nes/nes_cm.c
index 61e0efd..5c8d34c 100644
--- a/drivers/infiniband/hw/nes/nes_cm.c
+++ b/drivers/infiniband/hw/nes/nes_cm.c
@@ -1424,7 +1424,6 @@ static void handle_rst_pkt(struct nes_cm_node *cm_node, struct sk_buff *skb,
 {
 
 	int	reset = 0;	/* whether to send reset in case of err.. */
-	int	passive_state;
 	atomic_inc(&cm_resets_recvd);
 	nes_debug(NES_DBG_CM, "Received Reset, cm_node = %p, state = %u."
 			" refcnt=%d\n", cm_node, cm_node->state,
@@ -1439,7 +1438,7 @@ static void handle_rst_pkt(struct nes_cm_node *cm_node, struct sk_buff *skb,
 		active_open_err(cm_node, skb, reset);
 		break;
 	case NES_CM_STATE_MPAREQ_RCVD:
-		passive_state = atomic_add_return(1, &cm_node->passive_state);
+		atomic_inc(&cm_node->passive_state);
 		dev_kfree_skb_any(skb);
 		break;
 	case NES_CM_STATE_ESTABLISHED:
