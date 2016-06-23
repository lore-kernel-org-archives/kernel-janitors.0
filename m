From: Pratyush Patel <pratyushpatel.1995@gmail.com>
Date: Thu, 23 Jun 2016 18:50:37 +0000
Subject: [PATCH] hrtimer: spelling fixes
Message-Id: <20160623185037.GA12650@cyborg>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, john.stultz@linaro.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Signed-off-by: Pratyush Patel <pratyushpatel.1995@gmail.com>
---
 kernel/time/hrtimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index e99df0f..c7f6f5b 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -703,7 +703,7 @@ static void clock_was_set_work(struct work_struct *work)
 static DECLARE_WORK(hrtimer_work, clock_was_set_work);
 
 /*
- * Called from timekeeping and resume code to reprogramm the hrtimer
+ * Called from timekeeping and resume code to reprogram the hrtimer
  * interrupt device on all cpus.
  */
 void clock_was_set_delayed(void)
@@ -1241,7 +1241,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_base,
 
 	/*
 	 * Note: We clear the running state after enqueue_hrtimer and
-	 * we do not reprogramm the event hardware. Happens either in
+	 * we do not reprogram the event hardware. Happens either in
 	 * hrtimer_start_range_ns() or in hrtimer_interrupt()
 	 *
 	 * Note: Because we dropped the cpu_base->lock above,
-- 
2.7.4

