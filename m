From: Colin King <colin.king@canonical.com>
Date: Sat, 09 Nov 2019 15:58:36 +0000
Subject: [PATCH] clocksource/drivers/davinci: fix memory leak on clockevent on error return
Message-Id: <20191109155836.223635-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d9f02d3-45ac-1d2f-457b-91cae123383d@web.de>
In-Reply-To: <1d9f02d3-45ac-1d2f-457b-91cae123383d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where request_irq fails, the return path does not kfree
clockevent and hence we have a memory leak.  Fix this by kfree'ing
clockevent before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 721154f972aa ("clocksource/drivers/davinci: Add support for clockevents")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clocksource/timer-davinci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
index 62745c962049..910d4d2f0d64 100644
--- a/drivers/clocksource/timer-davinci.c
+++ b/drivers/clocksource/timer-davinci.c
@@ -299,6 +299,7 @@ int __init davinci_timer_register(struct clk *clk,
 			 "clockevent/tim12", clockevent);
 	if (rv) {
 		pr_err("Unable to request the clockevent interrupt");
+		kfree(clockevent);
 		return rv;
 	}
 
-- 
2.20.1
