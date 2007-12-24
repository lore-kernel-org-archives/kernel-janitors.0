From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:45:32 +0000
Subject: [PATCH 30/38] net/bridge: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241545090.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shemminger@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/net/bridge/br_netfilter.c b/net/bridge/br_netfilter.c
--- a/net/bridge/br_netfilter.c	2007-11-15 15:09:37.000000000 +0100
+++ b/net/bridge/br_netfilter.c	2007-12-23 20:30:40.000000000 +0100
@@ -46,6 +46,7 @@
 #include "br_private.h"
 #ifdef CONFIG_SYSCTL
 #include <linux/sysctl.h>
+#include <linux/jiffies.h>
 #endif
 
 #define skb_origaddr(skb)	 (((struct bridge_skb_cb *) \
@@ -221,7 +222,7 @@ static void __br_dnat_complain(void)
 {
 	static unsigned long last_complaint;
 
-	if (jiffies - last_complaint >= 5 * HZ) {
+	if (time_before_eq(jiffies, last_complaint + 5 * HZ)) {
 		printk(KERN_WARNING "Performing cross-bridge DNAT requires IP "
 		       "forwarding to be enabled\n");
 		last_complaint = jiffies;
