From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:11 +0000
Subject: [PATCH 41/61] power: supply: simplify getting .drvdata
Message-Id: <20180419140641.27926-42-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/power/supply/gpio-charger.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/power/supply/gpio-charger.c b/drivers/power/supply/gpio-charger.c
index bd2468ca6b63..c3f2a9479468 100644
--- a/drivers/power/supply/gpio-charger.c
+++ b/drivers/power/supply/gpio-charger.c
@@ -212,8 +212,7 @@ static int gpio_charger_suspend(struct device *dev)
 
 static int gpio_charger_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_charger *gpio_charger = platform_get_drvdata(pdev);
+	struct gpio_charger *gpio_charger = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev) && gpio_charger->wakeup_enabled)
 		disable_irq_wake(gpio_charger->irq);
-- 
2.11.0

