From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:43:26 +0000
Subject: [PATCH 26/38] init: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241542530.23999@ask.diku.dk>
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

diff -r -u -p a/init/calibrate.c b/init/calibrate.c
--- a/init/calibrate.c	2007-10-22 11:25:44.000000000 +0200
+++ b/init/calibrate.c	2007-12-23 20:44:00.000000000 +0100
@@ -65,7 +65,7 @@ static unsigned long __devinit calibrate
 		pre_start = 0;
 		read_current_timer(&start);
 		start_jiffies = jiffies;
-		while (jiffies <= (start_jiffies + 1)) {
+		while (time_after_eq(jiffies, start_jiffies + 1)) {
 			pre_start = start;
 			read_current_timer(&start);
 		}
@@ -73,8 +73,9 @@ static unsigned long __devinit calibrate
 
 		pre_end = 0;
 		end = post_start;
-		while (jiffies <-		       (start_jiffies + 1 + DELAY_CALIBRATION_TICKS)) {
+		while (time_after_eq(jiffies,
+				     start_jiffies +
+				     1 + DELAY_CALIBRATION_TICKS)) {
 			pre_end = end;
 			read_current_timer(&end);
 		}
