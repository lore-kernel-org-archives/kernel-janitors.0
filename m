From: Jay Bourque <kernel@uranium235.org>
Date: Sat, 14 Aug 2004 19:07:13 +0000
Subject: [Kernel-janitors] ipip.c: update last_rx after netif_rx
Message-Id: <411E62E1.40808@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix to update last_rx after netif_rx
This is my first patch so I'd appreciate any feedback.

-Jay

--- linux-2.6.8.1/net/ipv4/ipip.c    Sat Aug 14 05:56:24 2004
+++ linux-2.6.8.1/net/ipv4/ipip.c.new    Sat Aug 14 11:01:01 2004
@@ -500,6 +500,7 @@ static int ipip_rcv(struct sk_buff *skb)
         nf_reset(skb);
         ipip_ecn_decapsulate(iph, skb);
         netif_rx(skb);
+       tunnel->dev->last_rx = jiffies;
         read_unlock(&ipip_lock);
         return 0;
     }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
