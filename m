From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:43:59 +0000
Subject: [PATCH 27/38] kernel: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241543320.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/kernel/irq/spurious.c b/kernel/irq/spurious.c
--- a/kernel/irq/spurious.c	2007-07-20 17:46:05.000000000 +0200
+++ b/kernel/irq/spurious.c	2007-12-23 20:30:40.000000000 +0100
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/kallsyms.h>
 #include <linux/interrupt.h>
+#include <linux/jiffies.h>
 
 static int irqfixup __read_mostly;
 
@@ -178,7 +179,7 @@ void note_interrupt(unsigned int irq, st
 		 * otherwise the couter becomes a doomsday timer for otherwise
 		 * working systems
 		 */
-		if (jiffies - desc->last_unhandled > HZ/10)
+		if (time_after(jiffies, desc->last_unhandled + HZ/10))
 			desc->irqs_unhandled = 1;
 		else
 			desc->irqs_unhandled++;
diff -r -u -p a/kernel/timer.c b/kernel/timer.c
--- a/kernel/timer.c	2007-12-21 06:57:20.000000000 +0100
+++ b/kernel/timer.c	2007-12-23 20:30:40.000000000 +0100
@@ -165,7 +165,7 @@ unsigned long __round_jiffies(unsigned l
 	/* now that we have rounded, subtract the extra skew again */
 	j -= cpu * 3;
 
-	if (j <= jiffies) /* rounding ate our timeout entirely; */
+	if (time_before_eq(jiffies, j))/* rounding ate our timeout entirely; */
 		return original;
 	return j;
 }
