From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:26 +0000
Subject: [PATCH 16/18] clocksource/drivers: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-17-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/clocksource/timer-armada-370-xp.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
index edf1a46269f1..e3acc3c631b7 100644
--- a/drivers/clocksource/timer-armada-370-xp.c
+++ b/drivers/clocksource/timer-armada-370-xp.c
@@ -181,12 +181,12 @@ static int armada_370_xp_timer_starting_cpu(unsigned int cpu)
 		clr = TIMER0_25MHZ;
 	local_timer_ctrl_clrset(clr, set);
 
-	evt->name		= "armada_370_xp_per_cpu_tick",
+	evt->name		= "armada_370_xp_per_cpu_tick";
 	evt->features		= CLOCK_EVT_FEAT_ONESHOT |
 				  CLOCK_EVT_FEAT_PERIODIC;
-	evt->shift		= 32,
-	evt->rating		= 300,
-	evt->set_next_event	= armada_370_xp_clkevt_next_event,
+	evt->shift		= 32;
+	evt->rating		= 300;
+	evt->set_next_event	= armada_370_xp_clkevt_next_event;
 	evt->set_state_shutdown	= armada_370_xp_clkevt_shutdown;
 	evt->set_state_periodic	= armada_370_xp_clkevt_set_periodic;
 	evt->set_state_oneshot	= armada_370_xp_clkevt_shutdown;
