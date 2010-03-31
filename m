From: Alexander Kurz <akurz@blala.de>
Date: Wed, 31 Mar 2010 16:21:29 +0000
Subject: [PATCH] drivers/net/pcmcia/3c574_cs: fixing stats.tx_bytes counter
Message-Id: <alpine.DEB.1.10.1003312014120.9974@blala.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello folks,
while playing with an old "Megahertz 574B" card I noticed, that the 
netstat TX bytes where badly wrong. So I looked at 
drivers/net/pcmcia/3c574_cs and the method to update stats.tx_bytes.
Since the 3c589_cs code is quite similar I checked if the method
to update the counter from there (in dev->hard_start_xmit)
produces correct results, and it did.   
Unfortunately the differences between 3c589_cs and 3c574_cs
concerning stats.tx_bytes are older than v2.6.11 and thus  
out of my git-focus. I would like to check this, but I don't
know how, thanks,

Alexander Kurz

So, here is my patch:
From bbe9796e5f8835db3a3b0e80d4daadbb85b00802 Mon Sep 17 00:00:00 2001
From: Alexander Kurz <linux@kbdbabel.org>
Date: Wed, 31 Mar 2010 17:33:25 +0200
Subject: [PATCH] drivers/net/pcmcia/3c574_cs: fixing stats.tx_bytes counter
 like done in 3c589_cs. The counter had incorrect contents
 on tests using a "Megahertz 574B" card.

Signed-off-by: Alexander Kurz <linux@kbdbabel.org>
---
 drivers/net/pcmcia/3c574_cs.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
index 3d1d3a7..757f87b 100644
--- a/drivers/net/pcmcia/3c574_cs.c
+++ b/drivers/net/pcmcia/3c574_cs.c
@@ -781,8 +781,13 @@ static netdev_tx_t el3_start_xmit(struct sk_buff *skb,
 		  inw(ioaddr + EL3_STATUS));
 
 	spin_lock_irqsave(&lp->window_lock, flags);
+
+	dev->stats.tx_bytes += skb->len;
+
+	/* Put out the doubleword header... */
 	outw(skb->len, ioaddr + TX_FIFO);
 	outw(0, ioaddr + TX_FIFO);
+	/* ... and the packet rounded to a doubleword. */
 	outsl(ioaddr + TX_FIFO, skb->data, (skb->len+3)>>2);
 
 	dev->trans_start = jiffies;
@@ -1021,8 +1026,6 @@ static void update_stats(struct net_device *dev)
 	/* BadSSD */				   inb(ioaddr + 12);
 	up					 = inb(ioaddr + 13);
 
-	dev->stats.tx_bytes 			+= tx + ((up & 0xf0) << 12);
-
 	EL3WINDOW(1);
 }
 
-- 
1.7.0

