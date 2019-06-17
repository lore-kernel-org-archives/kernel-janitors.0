From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 11:31:09 +0000
Subject: [PATCH][next] clocksource: davinci-timer: fix memory leak of clockevent on error return
Message-Id: <20190617113109.24689-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to request_irq falls there is a memory leak of
clockevent on the error return path. Fix this by kfree'ing clockevent.

Addresses-Coverity: ("Resource leak")
Fixes: fe3b8194f274 ("clocksource: davinci-timer: add support for clockevents")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clocksource/timer-davinci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
index a9ca02390b66..8512f12e250a 100644
--- a/drivers/clocksource/timer-davinci.c
+++ b/drivers/clocksource/timer-davinci.c
@@ -300,6 +300,7 @@ int __init davinci_timer_register(struct clk *clk,
 			 "clockevent/tim12", clockevent);
 	if (rv) {
 		pr_err("Unable to request the clockevent interrupt");
+		kfree(clockevent);
 		return rv;
 	}
 
-- 
2.20.1
