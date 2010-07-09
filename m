From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 09 Jul 2010 12:25:22 +0000
Subject: [PATCH 1/2] 82596: do not panic on out of memory
Message-Id: <1278678323-6848-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, =?UTF-8?q?Andr=C3=A9=20Goddard=20Rosa?= <andre.goddard@gmail.com>, netdev@vger.kernel.org

If dev_alloc_skb() failed then free already allocated skbs.
remove_rx_bufs() can be called multiple times, so set rbd->skb to NULL
to avoid double free. remove_rx_bufs() was moved upwards to be seen by
init_rx_bufs().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/82596.c |   42 ++++++++++++++++++++++++++----------------
 1 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/net/82596.c b/drivers/net/82596.c
index dd8dc15..73073d0 100644
--- a/drivers/net/82596.c
+++ b/drivers/net/82596.c
@@ -525,7 +525,21 @@ static irqreturn_t i596_error(int irq, void *dev_id)
 }
 #endif
 
-static inline void init_rx_bufs(struct net_device *dev)
+static inline void remove_rx_bufs(struct net_device *dev)
+{
+	struct i596_private *lp = dev->ml_priv;
+	struct i596_rbd *rbd;
+	int i;
+
+	for (i = 0, rbd = lp->rbds; i < rx_ring_size; i++, rbd++) {
+		if (rbd->skb = NULL)
+			break;
+		dev_kfree_skb(rbd->skb);
+		rbd->skb = NULL;
+	}
+}
+
+static inline int init_rx_bufs(struct net_device *dev)
 {
 	struct i596_private *lp = dev->ml_priv;
 	int i;
@@ -537,8 +551,11 @@ static inline void init_rx_bufs(struct net_device *dev)
 	for (i = 0, rbd = lp->rbds; i < rx_ring_size; i++, rbd++) {
 		struct sk_buff *skb = dev_alloc_skb(PKT_BUF_SZ);
 
-		if (skb = NULL)
-			panic("82596: alloc_skb() failed");
+		if (skb = NULL) {
+			remove_rx_bufs(dev);
+			return -ENOMEM;
+		}
+
 		skb->dev = dev;
 		rbd->v_next = rbd+1;
 		rbd->b_next = WSWAPrbd(virt_to_bus(rbd+1));
@@ -574,19 +591,8 @@ static inline void init_rx_bufs(struct net_device *dev)
 	rfd->v_next = lp->rfds;
 	rfd->b_next = WSWAPrfd(virt_to_bus(lp->rfds));
 	rfd->cmd = CMD_EOL|CMD_FLEX;
-}
-
-static inline void remove_rx_bufs(struct net_device *dev)
-{
-	struct i596_private *lp = dev->ml_priv;
-	struct i596_rbd *rbd;
-	int i;
 
-	for (i = 0, rbd = lp->rbds; i < rx_ring_size; i++, rbd++) {
-		if (rbd->skb = NULL)
-			break;
-		dev_kfree_skb(rbd->skb);
-	}
+	return 0;
 }
 
 
@@ -1013,7 +1019,11 @@ static int i596_open(struct net_device *dev)
 			return -EAGAIN;
 	}
 #endif
-	init_rx_bufs(dev);
+	res = init_rx_bufs(dev);
+	if (res) {
+		free_irq(dev->irq, dev);
+		return res;
+	}
 
 	netif_start_queue(dev);
 
-- 
1.7.0.4

