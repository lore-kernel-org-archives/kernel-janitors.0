From: Colin King <colin.king@canonical.com>
Date: Tue, 19 May 2020 22:44:28 +0000
Subject: [PATCH][next] clocksource/drivers/timer-ti-dm: fix spelling mistake "detectt" -> "detect"
Message-Id: <20200519224428.6195-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Lindgren <tony@atomide.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index 1495618a5744..45f300305aa3 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -701,7 +701,7 @@ static int __init dmtimer_systimer_init(struct device_node *np)
 		dmtimer_systimer_select_best();
 
 	if (!clocksource && !clockevent) {
-		pr_err("%s: unable to detectt system timers, update dtb?\n",
+		pr_err("%s: unable to detect system timers, update dtb?\n",
 		       __func__);
 
 		return -EINVAL;
-- 
2.25.1
