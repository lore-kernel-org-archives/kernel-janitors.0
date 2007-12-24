From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:50:08 +0000
Subject: [PATCH 35/38] net/irda: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241549310.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/net/irda/discovery.c b/net/irda/discovery.c
--- a/net/irda/discovery.c	2007-10-22 11:25:46.000000000 +0200
+++ b/net/irda/discovery.c	2007-12-23 20:46:19.000000000 +0100
@@ -34,6 +34,7 @@
 #include <linux/socket.h>
 #include <linux/fs.h>
 #include <linux/seq_file.h>
+#include <linux/jiffies.h>
 
 #include <net/irda/irda.h>
 #include <net/irda/irlmp.h>
@@ -170,7 +171,8 @@ void irlmp_expire_discoveries(hashbin_t 
 		/* Test if it's time to expire this discovery */
 		if ((curr->data.saddr = saddr) &&
 		    (force ||
-		     ((jiffies - curr->timestamp) > DISCOVERY_EXPIRE_TIMEOUT)))
+		     (time_after(jiffies,
+				 curr->timestamp + DISCOVERY_EXPIRE_TIMEOUT))))
 		{
 			/* Create buffer as needed.
 			 * As this function get called a lot and most time
@@ -283,7 +285,8 @@ struct irda_device_info *irlmp_copy_disc
 		 * the most recent one (unless we want old ones) */
 		if ((u16ho(discovery->data.hints) & mask) &&
 		    ((old_entries) ||
-		     ((jiffies - discovery->firststamp) < j_timeout)) ) {
+		     (time_before(jiffies,
+				  discovery->firststamp + j_timeout))) ) {
 			/* Create buffer as needed.
 			 * As this function get called a lot and most time
 			 * we don't have anything to put in the log (we are
