From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:23:49 +0000
Subject: [PATCH 8/38] arch/x86/kernel/apm_32.c: Use time_before, time_before_eq,
Message-Id: <Pine.LNX.4.64.0712241523250.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -r -u -p a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
--- a/arch/x86/kernel/apm_32.c	2007-10-22 11:25:00.000000000 +0200
+++ b/arch/x86/kernel/apm_32.c	2007-12-23 20:30:39.000000000 +0100
@@ -314,6 +314,7 @@ extern int (*console_blank_hook)(int);
 #include <linux/timex.h>
 #include <asm/io.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #endif
 
 /*
@@ -1289,7 +1290,7 @@ static void check_events(void)
 				       "event 0x%02x\n", event);
 		}
 		if (ignore_bounce
-		    && ((jiffies - last_resume) > bounce_interval))
+		    && (time_after(jiffies, last_resume + bounce_interval)))
 			ignore_bounce = 0;
 
 		switch (event) {
