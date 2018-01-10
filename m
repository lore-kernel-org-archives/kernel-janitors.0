From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:24:51 +0000
Subject: [PATCH 3/4] sgi-xpnet: Use common code in xpnet_dev_hard_start_xmit()
Message-Id: <1a05cc59-2d61-0152-798e-4d2f75094129@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
In-Reply-To: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Cliff Whickman <cpw@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:50:10 +0100

Add a jump target so that a bit of code can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpnet.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpnet.c b/drivers/misc/sgi-xp/xpnet.c
index a4415616c03c..088c96a883f9 100644
--- a/drivers/misc/sgi-xp/xpnet.c
+++ b/drivers/misc/sgi-xp/xpnet.c
@@ -416,11 +416,8 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		"skb->end=0x%p skb->len=%d\n", (void *)skb->head,
 		(void *)skb->data, skb_tail_pointer(skb), skb_end_pointer(skb),
 		skb->len);
-
-	if (skb->data[0] = 0x33) {
-		dev_kfree_skb(skb);
-		return NETDEV_TX_OK;	/* nothing needed to be done */
-	}
+	if (skb->data[0] = 0x33)
+		goto free_skb;
 
 	/*
 	 * The xpnet_pending_msg tracks how many outstanding
@@ -430,8 +427,7 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	queued_msg = kmalloc(sizeof(*queued_msg), GFP_ATOMIC);
 	if (queued_msg = NULL) {
 		dev->stats.tx_errors++;
-		dev_kfree_skb(skb);
-		return NETDEV_TX_OK;
+		goto free_skb;
 	}
 
 	/* get the beginning of the first cacheline and end of last */
@@ -479,11 +475,15 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	dev->stats.tx_bytes += skb->len;
 
 	if (atomic_dec_return(&queued_msg->use_count) = 0) {
-		dev_kfree_skb(skb);
 		kfree(queued_msg);
+		goto free_skb;
 	}
 
 	return NETDEV_TX_OK;
+
+free_skb:
+	dev_kfree_skb(skb);
+	return NETDEV_TX_OK;
 }
 
 /*
-- 
2.15.1

