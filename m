From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 28 May 2018 09:58:57 +0000
Subject: [PATCH 4.14 152/496] clocksource/drivers/fsl_ftm_timer: Fix error return checking
Message-Id: <20180528100326.308294732@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180528100319.498712256@linuxfoundation.org>
In-Reply-To: <20180528100319.498712256@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-janitors@vger.kernel.org, Sasha Levin <alexander.levin@microsoft.com>

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit f287eb9013ccf199cbfa4eabd80c36fedfc15a73 ]

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
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clocksource/fsl_ftm_timer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/clocksource/fsl_ftm_timer.c
+++ b/drivers/clocksource/fsl_ftm_timer.c
@@ -281,7 +281,7 @@ static int __init __ftm_clk_init(struct
 
 static unsigned long __init ftm_clk_init(struct device_node *np)
 {
-	unsigned long freq;
+	long freq;
 
 	freq = __ftm_clk_init(np, "ftm-evt-counter-en", "ftm-evt");
 	if (freq <= 0)


