From: Jay Bourque <kernel@uranium235.org>
Date: Sat, 14 Aug 2004 19:07:26 +0000
Subject: [Kernel-janitors] xfrm4_input.c: update last_rx after netif_rx
Message-Id: <411E62EE.3070706@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix to update last_rx after netif_rx
This is my first patch so I'd appreciate any feedback.

-Jay

--- linux-2.6.8.1/net/ipv4/xfrm4_input.c    Sat Aug 14 05:54:50 2004
+++ linux-2.6.8.1/net/ipv4/xfrm4_input.c.new    Sat Aug 14 11:19:09 2004
@@ -138,6 +138,7 @@ int xfrm4_rcv_encap(struct sk_buff *skb,
             dst_release(skb->dst);
             skb->dst = NULL;
         }
+       skb->dev->last_rx = jiffies;
         netif_rx(skb);
         return 0;
     } else {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
