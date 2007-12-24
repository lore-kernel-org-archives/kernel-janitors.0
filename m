From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:20:47 +0000
Subject: [PATCH 6/38] arch/sparc64: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241520120.23999@ask.diku.dk>
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

diff -r -u -p a/arch/sparc64/kernel/binfmt_aout32.c b/arch/sparc64/kernel/binfmt_aout32.c
--- a/arch/sparc64/kernel/binfmt_aout32.c	2007-10-22 11:24:59.000000000 +0200
+++ b/arch/sparc64/kernel/binfmt_aout32.c	2007-12-23 20:33:56.000000000 +0100
@@ -27,6 +27,7 @@
 #include <linux/binfmts.h>
 #include <linux/personality.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/uaccess.h>
@@ -273,7 +274,8 @@ static int load_aout32_binary(struct lin
 	} else {
 		static unsigned long error_time;
 		if ((ex.a_text & 0xfff || ex.a_data & 0xfff) &&
-		    (N_MAGIC(ex) != NMAGIC) && (jiffies-error_time) > 5*HZ)
+		    (N_MAGIC(ex) != NMAGIC) &&
+		    time_after(jiffies, error_time + 5*HZ))
 		{
 			printk(KERN_NOTICE "executable not page aligned\n");
 			error_time = jiffies;
diff -r -u -p a/arch/sparc64/kernel/unaligned.c b/arch/sparc64/kernel/unaligned.c
--- a/arch/sparc64/kernel/unaligned.c	2007-06-02 22:32:07.000000000 +0200
+++ b/arch/sparc64/kernel/unaligned.c	2007-12-23 20:30:39.000000000 +0100
@@ -20,6 +20,7 @@
 #include <linux/smp.h>
 #include <linux/bitops.h>
 #include <linux/kallsyms.h>
+#include <linux/jiffies.h>
 #include <asm/fpumacro.h>
 
 /* #define DEBUG_MNA */
@@ -283,7 +284,7 @@ static void log_unaligned(struct pt_regs
 {
 	static unsigned long count, last_time;
 
-	if (jiffies - last_time > 5 * HZ)
+	if (time_after(jiffies, last_time + 5 * HZ))
 		count = 0;
 	if (count < 5) {
 		last_time = jiffies;
