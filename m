From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Mon, 24 Apr 2006 04:09:50 +0000
Subject: [KJ] [PATCH] net/ipv4/netfilter/ipt_recent.c 2.6.17-rc2-git5
Message-Id: <444C4F8E.4050001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replaced a kfree() with a kfree_skb() when freeing an sk_buff.

--- /usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ipt_recent.c 
2006-04-23 16:47:53.000000000 -0500
+++ /usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ipt_recent.c 
2006-04-23 16:51:09.000000000 -0500
@@ -323,7 +323,7 @@

         kfree(skb->nh.iph);
  out_free_skb:
-       kfree(skb);
+       kfree_skb(skb);
  out_free_info:
         kfree(info);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
