From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Oct 2018 10:22:22 +0000
Subject: [PATCH] clocksource/timer-vt8500: remove duplicate function name
Message-Id: <20181013102222.GC16086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Prisk <linux@prisktech.co.nz>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We print the function name twice in a row in the error message so I've
removed one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index e0f7489cfc8e..c3aff1a8f7d5 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -145,7 +145,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
-		pr_err("%s: vt8500_timer_init: clocksource_register failed for %s\n",
+		pr_err("%s: clocksource_register failed for %s\n",
 		       __func__, clocksource.name);
 		return ret;
 	}
