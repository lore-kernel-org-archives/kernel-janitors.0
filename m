From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 28 Aug 2016 20:26:26 +0000
Subject: [PATCH] watchdog: iTCO_wdt: constify iTCO_wdt_pm structure
Message-Id: <1472415986-16035-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

iTCO_wdt_pm, of type struct dev_pm_ops, is never modified, so declare it as
const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/watchdog/iTCO_wdt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 54cab18..06fcb6c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -629,7 +629,7 @@ static int iTCO_wdt_resume_noirq(struct device *dev)
 	return 0;
 }
 
-static struct dev_pm_ops iTCO_wdt_pm = {
+static const struct dev_pm_ops iTCO_wdt_pm = {
 	.suspend_noirq = iTCO_wdt_suspend_noirq,
 	.resume_noirq = iTCO_wdt_resume_noirq,
 };

