From: Julia Lawall <julia@diku.dk>
Date: Thu, 06 Mar 2008 17:41:32 +0000
Subject: [PATCH] drivers/net: convert & to &&
Message-Id: <Pine.LNX.4.58.0803061841000.1669@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: e1000-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The use of & to obtain a conjunction that evaluates both of its arguments
seems unnecessarily tricky.

The semantic match that found this code is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1, E2; @@
*  !E1 & !E2
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/e1000/e1000_main.c |   16 ++++++++++------
 drivers/net/ixgb/ixgb_main.c   |   11 ++++++-----
 2 files changed, 16 insertions(+), 11 deletions(-)

diff -u -p a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
--- a/drivers/net/e1000/e1000_main.c	2008-02-20 22:09:26.000000000 +0100
+++ b/drivers/net/e1000/e1000_main.c	2008-03-06 17:30:20.000000000 +0100
@@ -3872,10 +3872,12 @@ e1000_intr_msi(int irq, void *data)
 	adapter->total_tx_packets = 0;
 	adapter->total_rx_packets = 0;

-	for (i = 0; i < E1000_MAX_INTR; i++)
-		if (unlikely(!adapter->clean_rx(adapter, adapter->rx_ring) &
-		   !e1000_clean_tx_irq(adapter, adapter->tx_ring)))
+	for (i = 0; i < E1000_MAX_INTR; i++) {
+		boolean_t c1 = adapter->clean_rx(adapter, adapter->rx_ring);
+		boolean_t c2 = e1000_clean_tx_irq(adapter, adapter->tx_ring);
+		if (unlikely(!c1 && !c2))
 			break;
+	}

 	if (likely(adapter->itr_setting & 3))
 		e1000_set_itr(adapter);
@@ -3974,10 +3976,12 @@ e1000_intr(int irq, void *data)
 	adapter->total_tx_packets = 0;
 	adapter->total_rx_packets = 0;

-	for (i = 0; i < E1000_MAX_INTR; i++)
-		if (unlikely(!adapter->clean_rx(adapter, adapter->rx_ring) &
-		   !e1000_clean_tx_irq(adapter, adapter->tx_ring)))
+	for (i = 0; i < E1000_MAX_INTR; i++) {
+		boolean_t c1 = adapter->clean_rx(adapter, adapter->rx_ring);
+		boolean_t c2 = e1000_clean_tx_irq(adapter, adapter->tx_ring);
+		if (unlikely(!c1 && !c2))
 			break;
+	}

 	if (likely(adapter->itr_setting & 3))
 		e1000_set_itr(adapter);
diff -u -p a/drivers/net/ixgb/ixgb_main.c b/drivers/net/ixgb/ixgb_main.c
--- a/drivers/net/ixgb/ixgb_main.c	2008-02-02 16:08:56.000000000 +0100
+++ b/drivers/net/ixgb/ixgb_main.c	2008-03-06 17:33:02.000000000 +0100
@@ -1769,14 +1769,15 @@ ixgb_intr(int irq, void *data)
 		__netif_rx_schedule(netdev, &adapter->napi);
 	}
 #else
-	/* yes, that is actually a & and it is meant to make sure that
-	 * every pass through this for loop checks both receive and
+	/* every pass through this for loop checks both receive and
 	 * transmit queues for completed descriptors, intended to
 	 * avoid starvation issues and assist tx/rx fairness. */
-	for(i = 0; i < IXGB_MAX_INTR; i++)
-		if(!ixgb_clean_rx_irq(adapter) &
-		   !ixgb_clean_tx_irq(adapter))
+	for (i = 0; i < IXGB_MAX_INTR; i++) {
+		boolean_t c1 = ixgb_clean_rx_irq(adapter);
+		boolean_t c2 = ixgb_clean_tx_irq(adapter);
+		if (!c1 && !c2)
 			break;
+	}
 #endif
 	return IRQ_HANDLED;
 }
