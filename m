From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:57:12 +0000
Subject: [PATCH 8/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_set_timer()
Message-Id: <5688E268.9090600@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688DF2D.6090204@users.sourceforge.net>
In-Reply-To: <5688DF2D.6090204@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Jan 2016 09:19:32 +0100

Pass a value directly in a call of the function "regmap_update_bits"
instead of an extra initialisation for one local variable at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 88f1d0b..fed52d0 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -561,7 +561,6 @@ static int _abb5zes3_rtc_set_timer(struct device *dev, struct rtc_wkalrm *alarm,
 {
 	struct abb5zes3_rtc_data *data = dev_get_drvdata(dev);
 	u8 regs[ABB5ZES3_TIMA_SEC_LEN];
-	u8 mask = ABB5ZES3_REG_TIM_CLK_TAC0 | ABB5ZES3_REG_TIM_CLK_TAC1;
 	int ret;
 
 	/* Program given number of seconds to Timer A registers */
@@ -575,7 +574,9 @@ static int _abb5zes3_rtc_set_timer(struct device *dev, struct rtc_wkalrm *alarm,
 
 	/* Configure Timer A as a watchdog timer */
 	ret = regmap_update_bits(data->regmap, ABB5ZES3_REG_TIM_CLK,
-				 mask, ABB5ZES3_REG_TIM_CLK_TAC1);
+				 ABB5ZES3_REG_TIM_CLK_TAC0
+				 | ABB5ZES3_REG_TIM_CLK_TAC1,
+				 ABB5ZES3_REG_TIM_CLK_TAC1);
 	if (ret)
 		dev_err(dev, "%s: failed to update timer\n", __func__);
 
-- 
2.6.3

