From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:26:18 +0000
Subject: [PATCH 12/38] drivers/char/ds1286.c: Use time_before, time_before_eq,
Message-Id: <Pine.LNX.4.64.0712241525520.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/drivers/char/ds1286.c b/drivers/char/ds1286.c
--- a/drivers/char/ds1286.c	2007-06-02 22:32:10.000000000 +0200
+++ b/drivers/char/ds1286.c	2007-12-23 20:30:39.000000000 +0100
@@ -39,6 +39,7 @@
 #include <linux/spinlock.h>
 #include <linux/bcd.h>
 #include <linux/proc_fs.h>
+#include <linux/jiffies.h>
 
 #include <asm/uaccess.h>
 #include <asm/system.h>
@@ -451,7 +452,7 @@ static void ds1286_get_time(struct rtc_t
 	 */
 
 	if (ds1286_is_updating() != 0)
-		while (jiffies - uip_watchdog < 2*HZ/100)
+		while (time_before(jiffies, uip_watchdog + 2*HZ/100))
 			barrier();
 
 	/*
