From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 09 Apr 2020 10:12:26 +0000
Subject: [PATCH] clocksource: davinci: axe a pointless __GFP_NOFAIL
Message-Id: <20200409101226.15432-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to specify __GFP_NOFAIL when allocating memory here, so
axe it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clocksource/timer-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
index aae938368230..bb4eee31ae08 100644
--- a/drivers/clocksource/timer-davinci.c
+++ b/drivers/clocksource/timer-davinci.c
@@ -270,7 +270,7 @@ int __init davinci_timer_register(struct clk *clk,
 	davinci_timer_init(base);
 	tick_rate = clk_get_rate(clk);
 
-	clockevent = kzalloc(sizeof(*clockevent), GFP_KERNEL | __GFP_NOFAIL);
+	clockevent = kzalloc(sizeof(*clockevent), GFP_KERNEL);
 	if (!clockevent)
 		return -ENOMEM;
 
-- 
2.20.1
