From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Dec 2017 19:54:09 +0000
Subject: [PATCH] gpio-charger: Delete an error message for a failed memory allocation in gpio_charger_probe()
Message-Id: <1a9a3040-f276-049c-8d08-251cb3b0c92a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Dec 2017 20:50:04 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/power/supply/gpio-charger.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/power/supply/gpio-charger.c b/drivers/power/supply/gpio-charger.c
index 001731e88718..fb80734e2e51 100644
--- a/drivers/power/supply/gpio-charger.c
+++ b/drivers/power/supply/gpio-charger.c
@@ -138,10 +138,8 @@ static int gpio_charger_probe(struct platform_device *pdev)
 
 	gpio_charger = devm_kzalloc(&pdev->dev, sizeof(*gpio_charger),
 					GFP_KERNEL);
-	if (!gpio_charger) {
-		dev_err(&pdev->dev, "Failed to alloc driver structure\n");
+	if (!gpio_charger)
 		return -ENOMEM;
-	}
 
 	/*
 	 * This will fetch a GPIO descriptor from device tree, ACPI or
-- 
2.15.1

