From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:21 +0000
Subject: [PATCH 11/18] clocksource/drivers/mps2-timer: use semicolons rather than commas to separate statemen
Message-Id: <1601233948-11629-12-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Liviu Dudau <liviu.dudau@arm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clocksource/mps2-timer.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mps2-timer.c b/drivers/clocksource/mps2-timer.c
index 2e64d984c83a..efe8cad8f2a5 100644
--- a/drivers/clocksource/mps2-timer.c
+++ b/drivers/clocksource/mps2-timer.c
@@ -149,9 +149,9 @@ static int __init mps2_clockevent_init(struct device_node *np)
 	ce->clkevt.rating = 200;
 	ce->clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	ce->clkevt.cpumask = cpu_possible_mask;
-	ce->clkevt.set_state_shutdown	= mps2_timer_shutdown,
-	ce->clkevt.set_state_periodic	= mps2_timer_set_periodic,
-	ce->clkevt.set_state_oneshot	= mps2_timer_shutdown,
+	ce->clkevt.set_state_shutdown	= mps2_timer_shutdown;
+	ce->clkevt.set_state_periodic	= mps2_timer_set_periodic;
+	ce->clkevt.set_state_oneshot	= mps2_timer_shutdown;
 	ce->clkevt.set_next_event	= mps2_timer_set_next_event;
 
 	/* Ensure timer is disabled */
