From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 20:45:39 +0000
Subject: [PATCH] rtc: zynqmp: One function call less in xlnx_rtc_alarm_irq_enable()
Message-Id: <6f1db217-cb0a-9f6c-0e2e-5d932103f6ef@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Simek <michal.simek@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 22:37:58 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement for a setting selection.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-zynqmp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 00639594de0c..4631019a54e2 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -124,11 +124,8 @@ static int xlnx_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);

-	if (enabled)
-		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
-	else
-		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
-
+	writel(RTC_INT_ALRM,
+	       xrtcdev->reg_base + (enabled ? RTC_INT_EN : RTC_INT_DIS));
 	return 0;
 }

--
2.22.0
