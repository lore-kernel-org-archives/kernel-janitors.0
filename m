From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:48:00 +0000
Subject: [PATCH 32/38] net/econet: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241547330.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: philb@gnu.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/net/econet/af_econet.c b/net/econet/af_econet.c
--- a/net/econet/af_econet.c	2007-11-08 08:00:53.000000000 +0100
+++ b/net/econet/af_econet.c	2007-12-23 20:30:40.000000000 +0100
@@ -41,6 +41,7 @@
 #include <linux/rcupdate.h>
 #include <linux/bitops.h>
 #include <linux/mutex.h>
+#include <linux/jiffies.h>
 
 #include <asm/uaccess.h>
 #include <asm/system.h>
@@ -993,7 +994,7 @@ static void ab_cleanup(unsigned long h)
 	{
 		struct sk_buff *newskb = skb->next;
 		struct ec_cb *eb = (struct ec_cb *)&skb->cb;
-		if ((jiffies - eb->start) > eb->timeout)
+		if (time_after(jiffies, eb->start + eb->timeout))
 		{
 			tx_result(skb->sk, eb->cookie,
 				  ECTYPE_TRANSMIT_NOT_PRESENT);
