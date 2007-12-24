From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:19:29 +0000
Subject: [PATCH 4/38] arch/parisc: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241518580.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matthew@wil.cx, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
--- a/arch/parisc/kernel/unaligned.c	2007-10-22 11:24:58.000000000 +0200
+++ b/arch/parisc/kernel/unaligned.c	2007-12-23 20:33:36.000000000 +0100
@@ -460,7 +460,8 @@ void handle_unaligned(struct pt_regs *re
 			goto force_sigbus;
 		}
 
-		if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
+		if (unaligned_count > 5 &&
+		    time_after(jiffies, last_time + 5*HZ)) {
 			unaligned_count = 0;
 			last_time = jiffies;
 		}
