From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Jul 2017 07:22:25 +0000
Subject: [PATCH] clocksource/timer-of: checking for NULL instead of IS_ERR()
Message-Id: <20170710072225.eknzwy7yd4duc3yg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

of_io_request_and_map() doesn't return NULL, it returns error pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index f6e7491c873c..f83d52e313d2 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -120,9 +120,9 @@ static __init int timer_base_init(struct device_node *np,
 	const char *name = of_base->name ? of_base->name : np->full_name;
 
 	of_base->base = of_io_request_and_map(np, of_base->index, name);
-	if (!of_base->base) {
+	if (IS_ERR(of_base->base)) {
 		pr_err("Failed to iomap (%s)\n", name);
-		return -ENXIO;
+		return PTR_ERR(of_base->base);
 	}
 
 	return 0;
