From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Mon, 24 Apr 2006 21:29:31 +0000
Subject: [KJ] [PATCH] net/ipv4/netfilter/ip_nat_standalone.c 2.6.17-rc2-git5
Message-Id: <444D433B.5010505@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Don't declare some variables if CONFIG_XFRM isn't defined. If 
CONFIG_XFRM isn't defined, they arent' used.

--- 
/usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ip_nat_standalone.c  
2006-04-23 16:47:53.000000000 -0500
+++ 
/usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ip_nat_standalone.c       
2006-04-24 16:24:56.000000000 -0500
@@ -219,8 +219,6 @@
           const struct net_device *out,
           int (*okfn)(struct sk_buff *))
 {
-       struct ip_conntrack *ct;
-       enum ip_conntrack_info ctinfo;
        unsigned int ret;

        /* root is playing with raw sockets. */
@@ -230,6 +228,10 @@

        ret = ip_nat_fn(hooknum, pskb, in, out, okfn);
 #ifdef CONFIG_XFRM
+
+       struct ip_conntrack *ct;
+       enum ip_conntrack_info ctinfo;
+
        if (ret != NF_DROP && ret != NF_STOLEN
            && (ct = ip_conntrack_get(*pskb, &ctinfo)) != NULL) {
                enum ip_conntrack_dir dir = CTINFO2DIR(ctinfo);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
