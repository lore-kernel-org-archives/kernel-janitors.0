From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 06 Jul 2016 05:35:23 +0000
Subject: [PATCH] clocksource: cadence_ttc: fix a return value in case of error
Message-Id: <1467783323-16632-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

IS_ERR and PTR_ERR should use the same variable, clk_ce in this case.

Fixes: 4de1eb07c47f (Convert init function to return error)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clocksource/cadence_ttc_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
index 388a77b..fbfbdec 100644
--- a/drivers/clocksource/cadence_ttc_timer.c
+++ b/drivers/clocksource/cadence_ttc_timer.c
@@ -523,7 +523,7 @@ static int __init ttc_timer_init(struct device_node *timer)
 	clk_ce = of_clk_get(timer, clksel);
 	if (IS_ERR(clk_ce)) {
 		pr_err("ERROR: timer input clock not found\n");
-		return PTR_ERR(clk_cs);
+		return PTR_ERR(clk_ce);
 	}
 
 	ret = ttc_setup_clocksource(clk_cs, timer_baseaddr, timer_width);
-- 
2.7.4

