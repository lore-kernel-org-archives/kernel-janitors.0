From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 20:17:11 +0000
Subject: [PATCH] rtc: stm32: One function call less in stm32_rtc_set_alarm()
Message-Id: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 22:10:10 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-stm32.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 8e6c9b3bcc29..83793b530fed 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -519,11 +519,7 @@ static int stm32_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* Write to Alarm register */
 	writel_relaxed(alrmar, rtc->base + regs->alrmar);

-	if (alrm->enabled)
-		stm32_rtc_alarm_irq_enable(dev, 1);
-	else
-		stm32_rtc_alarm_irq_enable(dev, 0);
-
+	stm32_rtc_alarm_irq_enable(dev, alrm->enabled ? 1 : 0);
 end:
 	stm32_rtc_wpr_lock(rtc);

--
2.22.0
