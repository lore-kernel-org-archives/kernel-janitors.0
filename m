From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 25 Apr 2007 06:12:17 +0000
Subject: [KJ] [PATCH]:Replacing with time_before in net/ipv4/ip_gre.c
Message-Id: <1177480817.27118.18.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@coreworks.de
Cc: kernel-janitors@lists.osdl.org, netdev@vger.kernel.org

Hi,

Replacing with time_before in net/ipv4/ip_gre.c

thanks.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 9151da6..05cd63b 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -28,6 +28,7 @@
 #include <linux/igmp.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/if_ether.h>
+#include <linux/jiffies.h>
 
 #include <net/sock.h>
 #include <net/ip.h>
@@ -376,7 +377,7 @@ static void ipgre_err(struct sk_buff *skb, u32 info)
 	if (t->parms.iph.ttl = 0 && type = ICMP_TIME_EXCEEDED)
 		goto out;
 
-	if (jiffies - t->err_time < IPTUNNEL_ERR_TIMEO)
+	if (time_before(jiffies , t->err_time + IPTUNNEL_ERR_TIMEO))
 		t->err_count++;
 	else
 		t->err_count = 1;
@@ -801,7 +802,7 @@ static int ipgre_tunnel_xmit(struct sk_buff *skb, struct net_device *dev)
 #endif
 
 	if (tunnel->err_count > 0) {
-		if (jiffies - tunnel->err_time < IPTUNNEL_ERR_TIMEO) {
+		if (time_before(jiffies , tunnel->err_time + IPTUNNEL_ERR_TIMEO)) {
 			tunnel->err_count--;
 
 			dst_link_failure(skb);

----
Shani

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
