From: Jay Bourque <kernel@uranium235.org>
Date: Sat, 14 Aug 2004 19:06:59 +0000
Subject: [Kernel-janitors] ip_gre.c: update last_rx after netif_rx
Message-Id: <411E62D3.8070808@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix to update last_rx after netif_rx
This is my first patch so I'd appreciate any feedback.

-Jay

--- linux-2.6.8.1/net/ipv4/ip_gre.c    Sat Aug 14 05:55:48 2004
+++ linux-2.6.8.1/net/ipv4/ip_gre.c.new    Sat Aug 14 12:17:16 2004
@@ -646,6 +646,7 @@ int ipgre_rcv(struct sk_buff *skb)
         nf_reset(skb);
         ipgre_ecn_decapsulate(iph, skb);
         netif_rx(skb);
+       tunnel->dev->last_rx = jiffies;
         read_unlock(&ipgre_lock);
         return(0);
     }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
