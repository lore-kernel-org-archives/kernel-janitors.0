From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:52:40 +0000
Subject: [patch] Input: tnetv107x-keypad - make irqs signed for error handling
Message-Id: <20131107075240.GK21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@dowhile0.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in keypad_probe() where we do:

	kp->irq_press   = platform_get_irq_byname(pdev, "press");
	kp->irq_release = platform_get_irq_byname(pdev, "release");
	if (kp->irq_press < 0 || kp->irq_release < 0) {

The problem is that these irq variables are unsigned so the error
handling doesn't work.  I've changed them to signed values.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/keyboard/tnetv107x-keypad.c b/drivers/input/keyboard/tnetv107x-keypad.c
index 5f7b427..8bd24d5 100644
--- a/drivers/input/keyboard/tnetv107x-keypad.c
+++ b/drivers/input/keyboard/tnetv107x-keypad.c
@@ -60,8 +60,8 @@ struct keypad_data {
 	struct clk			*clk;
 	struct device			*dev;
 	spinlock_t			lock;
-	u32				irq_press;
-	u32				irq_release;
+	int				irq_press;
+	int				irq_release;
 	int				rows, cols, row_shift;
 	int				debounce_ms, active_low;
 	u32				prev_keys[3];
