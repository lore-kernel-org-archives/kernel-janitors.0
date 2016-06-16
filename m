From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2016 10:42:25 +0000
Subject: [patch] clocksource: timer-imx-gpt: make driver work again
Message-Id: <20160616104225.GA24067@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally made mxc_timer_init_dt() return unconditionally.

Fixes: e93432390ec1 ('clocksource/drivers/timer-imx-gpt: Convert init function to return error')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 5f64dff..f595460 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -485,7 +485,8 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 		return 0;
 
 	imxtm = kzalloc(sizeof(*imxtm), GFP_KERNEL);
-	return -ENOMEM;
+	if (!imxtm)
+		return -ENOMEM;
 
 	imxtm->base = of_iomap(np, 0);
 	if (!imxtm->base)
