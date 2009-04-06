From: Julia Lawall <julia@diku.dk>
Date: Mon, 06 Apr 2009 14:58:06 +0000
Subject: [PATCH] kernel/hrtimer.c: use function hrtimer_is_queued
Message-Id: <Pine.LNX.4.64.0904061656500.20450@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use the hrtimer_is_queued function rather than an explicit bit-and for
testing timer->state, as done elsewhere.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@header@
@@

#include <linux/hrtimer.h>

@depends on header@
struct hrtimer *timer;
@@

- (timer->state & HRTIMER_STATE_ENQUEUED)
+ hrtimer_is_queued(timer)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 kernel/hrtimer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/kernel/hrtimer.c b/kernel/hrtimer.c
--- a/kernel/hrtimer.c
+++ b/kernel/hrtimer.c
@@ -850,7 +850,7 @@ static void __remove_hrtimer(struct hrti
 			     struct hrtimer_clock_base *base,
 			     unsigned long newstate, int reprogram)
 {
-	if (timer->state & HRTIMER_STATE_ENQUEUED) {
+	if (hrtimer_is_queued(timer)) {
 		/*
 		 * Remove the timer from the rbtree and replace the
 		 * first entry pointer if necessary.
