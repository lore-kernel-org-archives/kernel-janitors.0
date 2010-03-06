From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:11:38 +0000
Subject: [patch] ems_usb: cleanup: remove uneeded check
Message-Id: <20100306111138.GH4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"skb" is alway non-null here, but even if it were null the check isn't
needed because dev_kfree_skb() can handle it.

This eliminates a smatch warning about dereferencing a variable before
checking that it is non-null.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/can/usb/ems_usb.c b/drivers/net/can/usb/ems_usb.c
index 11c8784..3345109 100644
--- a/drivers/net/can/usb/ems_usb.c
+++ b/drivers/net/can/usb/ems_usb.c
@@ -876,9 +876,7 @@ static netdev_tx_t ems_usb_start_xmit(struct sk_buff *skb, struct net_device *ne
 	return NETDEV_TX_OK;
 
 nomem:
-	if (skb)
-		dev_kfree_skb(skb);
-
+	dev_kfree_skb(skb);
 	stats->tx_dropped++;
 
 	return NETDEV_TX_OK;
