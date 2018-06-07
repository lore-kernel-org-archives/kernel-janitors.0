From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 07 Jun 2018 14:05:21 +0000
Subject: [PATCH 3.16 286/410] clocksource/drivers/fsl_ftm_timer: Fix error return checking
Message-Id: <lsq.1528380321.268215907@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1528380320.647747352@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Colin Ian King <colin.king@canonical.com>

3.16.57-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>

commit f287eb9013ccf199cbfa4eabd80c36fedfc15a73 upstream.

The error checks on freq for a negative error return always fails because
freq is unsigned and can never be negative. Fix this by making freq a
signed long.

Detected with Coccinelle:
drivers/clocksource/fsl_ftm_timer.c:287:5-9: WARNING: Unsigned expression
compared with zero: freq <= 0
drivers/clocksource/fsl_ftm_timer.c:291:5-9: WARNING: Unsigned expression
compared with zero: freq <= 0

Fixes: 2529c3a33079 ("clocksource: Add Freescale FlexTimer Module (FTM) timer support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel-janitors@vger.kernel.org
Link: https://lkml.kernel.org/r/20180226113614.3092-1-colin.king@canonical.com
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/clocksource/fsl_ftm_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/clocksource/fsl_ftm_timer.c
+++ b/drivers/clocksource/fsl_ftm_timer.c
@@ -282,7 +282,7 @@ static int __init __ftm_clk_init(struct
 
 static unsigned long __init ftm_clk_init(struct device_node *np)
 {
-	unsigned long freq;
+	long freq;
 
 	freq = __ftm_clk_init(np, "ftm-evt-counter-en", "ftm-evt");
 	if (freq <= 0)

