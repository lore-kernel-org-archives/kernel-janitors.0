From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Mon, 24 Apr 2006 04:31:58 +0000
Subject: [KJ] [PATCH] net/xfrm/xfrm_user.c 2.6.17-rc2-git5
Message-Id: <444C54BE.1030107@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replaced a kfree() with a kfree_skb() when freeing an sk_buff

--- /usr/src/linux-2.6.17-rc2-git5-orig/net/xfrm/xfrm_user.c 
2006-04-23 16:47:55.000000000 -0500
+++ /usr/src/linux-2.6.17-rc2-git5/net/xfrm/xfrm_user.c 2006-04-23 
23:29:18.000000000 -0500
@@ -1152,7 +1152,7 @@

         x = xfrm_state_lookup(&id->daddr, id->spi, id->proto, id->family);
         if (x = NULL) {
-               kfree(r_skb);
+               kfree_skb(r_skb);
                 return -ESRCH;
         }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
