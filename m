From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 23 Jun 2017 19:55:10 +0000
Subject: [PATCH] clocksource/mips-gic-timer: Fix an error code in 'gic_clocksource_of_init()'
Message-Id: <20170623195510.12067-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'clk' is a valid pointer at this point. So calling PTR_ERR on it is
pointess.
Return the error code from 'clk_prepare_enable()' if it fails instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not compile tested as I don't have the corresponding cross-compiler
---
 drivers/clocksource/mips-gic-timer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index e31e08326024..17b861ea2626 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -167,10 +167,11 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 
 	clk = of_clk_get(node, 0);
 	if (!IS_ERR(clk)) {
-		if (clk_prepare_enable(clk) < 0) {
+		ret = clk_prepare_enable(clk);
+		if (ret < 0) {
 			pr_err("GIC failed to enable clock\n");
 			clk_put(clk);
-			return PTR_ERR(clk);
+			return ret;
 		}
 
 		gic_frequency = clk_get_rate(clk);
-- 
2.11.0

