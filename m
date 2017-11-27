From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:15:10 +0000
Subject: [PATCH] atm: eni: fix several indentation issues
Message-Id: <20171127131510.10500-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several statements that have incorrect indentation. Fix
these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/eni.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/atm/eni.c b/drivers/atm/eni.c
index ce47eb17901d..6470e3c4c990 100644
--- a/drivers/atm/eni.c
+++ b/drivers/atm/eni.c
@@ -473,7 +473,7 @@ static int do_rx_dma(struct atm_vcc *vcc,struct sk_buff *skb,
 		ENI_PRV_POS(skb) = eni_vcc->descr+size+1;
 		skb_queue_tail(&eni_dev->rx_queue,skb);
 		eni_vcc->last = skb;
-rx_enqueued++;
+		rx_enqueued++;
 	}
 	eni_vcc->descr = here;
 	eni_out(dma_wr,MID_DMA_WR_RX);
@@ -715,7 +715,7 @@ static void get_service(struct atm_dev *dev)
 			else eni_dev->slow = vcc;
 			eni_dev->last_slow = vcc;
 		}
-putting++;
+		putting++;
 		ENI_VCC(vcc)->servicing++;
 	}
 }
@@ -744,7 +744,7 @@ static void dequeue_rx(struct atm_dev *dev)
 		}
 		EVENT("dequeued (size=%ld,pos=0x%lx)\n",ENI_PRV_SIZE(skb),
 		    ENI_PRV_POS(skb));
-rx_dequeued++;
+		rx_dequeued++;
 		vcc = ATM_SKB(skb)->vcc;
 		eni_vcc = ENI_VCC(vcc);
 		first = 0;
@@ -1174,7 +1174,7 @@ DPRINTK("doing direct send\n"); /* @@@ well, this doesn't work anyway */
 	DPRINTK("dma_wr set to %d, tx_pos is now %ld\n",dma_wr,tx->tx_pos);
 	eni_out(dma_wr,MID_DMA_WR_TX);
 	skb_queue_tail(&eni_dev->tx_queue,skb);
-queued++;
+	queued++;
 	return enq_ok;
 }
 
@@ -1195,7 +1195,7 @@ static void poll_tx(struct atm_dev *dev)
 				if (res = enq_ok) continue;
 				DPRINTK("re-queuing TX PDU\n");
 				skb_queue_head(&tx->backlog,skb);
-requeued++;
+				requeued++;
 				if (res = enq_jam) return;
 				break;
 			}
@@ -1232,7 +1232,7 @@ static void dequeue_tx(struct atm_dev *dev)
 		else dev_kfree_skb_irq(skb);
 		atomic_inc(&vcc->stats->tx);
 		wake_up(&eni_dev->tx_wait);
-dma_complete++;
+		dma_complete++;
 	}
 }
 
@@ -1555,7 +1555,7 @@ static void eni_tasklet(unsigned long data)
 	}
 	if (events & MID_TX_COMPLETE) {
 		EVENT("INT: TX COMPLETE\n",0,0);
-tx_complete++;
+		tx_complete++;
 		wake_up(&eni_dev->tx_wait);
 		/* poll_rx ? */
 	}
@@ -2069,14 +2069,14 @@ static int eni_send(struct atm_vcc *vcc,struct sk_buff *skb)
 		}
 		*(u32 *) skb->data = htonl(*(u32 *) skb->data);
 	}
-submitted++;
+	submitted++;
 	ATM_SKB(skb)->vcc = vcc;
 	tasklet_disable(&ENI_DEV(vcc->dev)->task);
 	res = do_tx(skb);
 	tasklet_enable(&ENI_DEV(vcc->dev)->task);
 	if (res = enq_ok) return 0;
 	skb_queue_tail(&ENI_VCC(vcc)->tx->backlog,skb);
-backlogged++;
+	backlogged++;
 	tasklet_schedule(&ENI_DEV(vcc->dev)->task);
 	return 0;
 }
-- 
2.14.1

