From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:39:33 +0000
Subject: [PATCH 19/38] drivers/net/appletalk: Use time_before, time_before_eq,
Message-Id: <Pine.LNX.4.64.0712241539040.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: acme@ghostprotocols.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/drivers/net/appletalk/cops.c b/drivers/net/appletalk/cops.c
--- a/drivers/net/appletalk/cops.c	2007-10-22 11:25:13.000000000 +0200
+++ b/drivers/net/appletalk/cops.c	2007-12-23 20:30:39.000000000 +0100
@@ -69,6 +69,7 @@ static const char *version  #include <linux/atalk.h>
 #include <linux/spinlock.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -503,7 +504,7 @@ static void cops_reset(struct net_device
                         long snap=jiffies;
 
 			/* Let card finish initializing, about 1/3 second */
-	                while(jiffies-snap<HZ/3)
+			while (time_before(jiffies, snap + HZ/3))
                                 schedule();
                 }
                 else
