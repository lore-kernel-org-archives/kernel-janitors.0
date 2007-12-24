From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:44:33 +0000
Subject: [PATCH 28/38] mm: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241544070.23999@ask.diku.dk>
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

diff -r -u -p a/mm/page_alloc.c b/mm/page_alloc.c
--- a/mm/page_alloc.c	2007-12-21 06:57:20.000000000 +0100
+++ b/mm/page_alloc.c	2007-12-23 20:30:40.000000000 +0100
@@ -43,6 +43,7 @@
 #include <linux/backing-dev.h>
 #include <linux/fault-inject.h>
 #include <linux/page-isolation.h>
+#include <linux/jiffies.h>
 
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -1276,7 +1277,7 @@ static nodemask_t *zlc_setup(struct zone
 	if (!zlc)
 		return NULL;
 
-	if (jiffies - zlc->last_full_zap > 1 * HZ) {
+	if (time_after(jiffies, zlc->last_full_zap + 1 * HZ)) {
 		bitmap_zero(zlc->fullzones, MAX_ZONES_PER_ZONELIST);
 		zlc->last_full_zap = jiffies;
 	}
diff -r -u -p a/mm/pdflush.c b/mm/pdflush.c
--- a/mm/pdflush.c	2007-07-20 17:46:05.000000000 +0200
+++ b/mm/pdflush.c	2007-12-23 20:30:40.000000000 +0100
@@ -22,6 +22,7 @@
 #include <linux/kthread.h>
 #include <linux/cpuset.h>
 #include <linux/freezer.h>
+#include <linux/jiffies.h>
 
 
 /*
@@ -130,7 +131,7 @@ static int __pdflush(struct pdflush_work
 		 * Thread creation: For how long have there been zero
 		 * available threads?
 		 */
-		if (jiffies - last_empty_jifs > 1 * HZ) {
+		if (time_after(jiffies, last_empty_jifs + 1 * HZ)) {
 			/* unlocked list_empty() test is OK here */
 			if (list_empty(&pdflush_list)) {
 				/* unlocked test is OK here */
@@ -151,7 +152,7 @@ static int __pdflush(struct pdflush_work
 		if (nr_pdflush_threads <= MIN_PDFLUSH_THREADS)
 			continue;
 		pdf = list_entry(pdflush_list.prev, struct pdflush_work, list);
-		if (jiffies - pdf->when_i_went_to_sleep > 1 * HZ) {
+		if (time_after(jiffies, pdf->when_i_went_to_sleep + 1 * HZ)) {
 			/* Limit exit rate */
 			pdf->when_i_went_to_sleep = jiffies;
 			break;					/* exeunt */
