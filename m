From: Jay Bourque <kernel@uranium235.org>
Date: Sat, 14 Aug 2004 19:07:07 +0000
Subject: [Kernel-janitors] ip_output.c: update last_rx after netif_rx
Message-Id: <411E62DB.8060707@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix to update last_rx after netif_rx
This is my first patch so I'd appreciate any feedback.

-Jay

--- linux-2.6.8.1/net/ipv4/ip_output.c    Sat Aug 14 05:56:23 2004
+++ linux-2.6.8.1/net/ipv4/ip_output.c.new    Sat Aug 14 10:59:58 2004
@@ -110,6 +110,7 @@ static int ip_dev_loopback_xmit(struct s
 #ifdef CONFIG_NETFILTER_DEBUG
     nf_debug_ip_loopback_xmit(newskb);
 #endif
+   newskb->dev->last_rx = jiffies;
     netif_rx(newskb);
     return 0;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
