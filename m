From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:49:10 +0000
Subject: [PATCH 34/38] net/ipv6: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241548490.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The functions time_before, time_before_eq, time_after, and time_after_eq
are more robust for comparing jiffies against other values.

A simplified version of the semantic patch making this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ change_compare_np @
expression E;
@@

(
- jiffies <= E
+ time_before_eq(jiffies,E)
|
- jiffies >= E
+ time_after_eq(jiffies,E)
|
- jiffies < E
+ time_before(jiffies,E)
|
- jiffies > E
+ time_after(jiffies,E)
)

@ include depends on change_compare_np @
@@

#include <linux/jiffies.h>

@ no_include depends on !include && change_compare_np @
@@

  #include <linux/...>
+ #include <linux/jiffies.h>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -r -u -p a/net/ipv6/sit.c b/net/ipv6/sit.c
--- a/net/ipv6/sit.c	2007-11-01 10:30:45.000000000 +0100
+++ b/net/ipv6/sit.c	2007-12-23 20:46:01.000000000 +0100
@@ -33,6 +33,7 @@
 #include <linux/init.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/if_ether.h>
+#include <linux/jiffies.h>
 
 #include <net/sock.h>
 #include <net/snmp.h>
@@ -263,7 +264,7 @@ static int ipip6_err(struct sk_buff *skb
 	if (t->parms.iph.ttl = 0 && type = ICMP_TIME_EXCEEDED)
 		goto out;
 
-	if (jiffies - t->err_time < IPTUNNEL_ERR_TIMEO)
+	if (time_before(jiffies, t->err_time + IPTUNNEL_ERR_TIMEO))
 		t->err_count++;
 	else
 		t->err_count = 1;
@@ -520,7 +521,8 @@ static int ipip6_tunnel_xmit(struct sk_b
 	}
 
 	if (tunnel->err_count > 0) {
-		if (jiffies - tunnel->err_time < IPTUNNEL_ERR_TIMEO) {
+		if (time_before(jiffies,
+				tunnel->err_time + IPTUNNEL_ERR_TIMEO)) {
 			tunnel->err_count--;
 			dst_link_failure(skb);
 		} else
