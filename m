From: Jay Bourque <kernel@uranium235.org>
Date: Sat, 14 Aug 2004 19:07:22 +0000
Subject: [Kernel-janitors] ipmr.c: update last_rx after netif_rx
Message-Id: <411E62EA.5060204@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix to update last_rx after netif_rx
This is my first patch so I'd appreciate any feedback.

-Jay

--- linux-2.6.8.1/net/ipv4/ipmr.c    Sat Aug 14 05:55:32 2004
+++ linux-2.6.8.1/net/ipv4/ipmr.c.new    Sat Aug 14 11:12:32 2004
@@ -1462,6 +1462,7 @@ int pim_rcv_v1(struct sk_buff * skb)
     ((struct net_device_stats*)reg_dev->priv)->rx_packets++;
     nf_reset(skb);
     netif_rx(skb);
+   reg_dev->last_rx = jiffies;
     dev_put(reg_dev);
     return 0;
  drop:
@@ -1518,6 +1519,7 @@ static int pim_rcv(struct sk_buff * skb)
     skb->dst = NULL;
     nf_reset(skb);
     netif_rx(skb);
+   reg_dev->last_rx = jiffies;
     dev_put(reg_dev);
     return 0;
  drop:

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
