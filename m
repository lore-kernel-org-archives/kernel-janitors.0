From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jul 2019 08:42:35 +0000
Subject: [PATCH v2] rtc: stm32: One condition check and function call less in stm32_rtc_set_alarm()
Message-Id: <4da614a4-83c6-548c-a112-033b846c561b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
 <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
In-Reply-To: <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jul 2019 10:26:47 +0200

A condition check was repeated in this function implementation despite of
a corresponding check in the stm32_rtc_alarm_irq_enable() function.
Thus delete redundant source code here.

Suggested-by: Russell King <linux@armlinux.org.uk>
Link: https://lore.kernel.org/lkml/20190707211638.sehikkear25dffah@shell.armlinux.org.uk/

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Russell King pointed the change possibility out to omit a condition check
at this place.


 drivers/rtc/rtc-stm32.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 8e6c9b3bcc29..773a1990b93f 100644
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
+	stm32_rtc_alarm_irq_enable(dev, alrm->enabled);
 end:
 	stm32_rtc_wpr_lock(rtc);

--
2.22.0
