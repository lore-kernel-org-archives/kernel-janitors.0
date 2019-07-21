From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 12:55:47 +0000
Subject: [PATCH] watchdog: ath79_wdt: fix a typo in the name of a function
Message-Id: <20190721125547.13473-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wim@linux-watchdog.org, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that 'ath97_wdt_shutdown()' should be 'ath79_wdt_shutdown()'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/watchdog/ath79_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index 02234c254b10..436cdb4f0392 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -306,7 +306,7 @@ static int ath79_wdt_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void ath97_wdt_shutdown(struct platform_device *pdev)
+static void ath79_wdt_shutdown(struct platform_device *pdev)
 {
 	ath79_wdt_disable();
 }
@@ -322,7 +322,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
 static struct platform_driver ath79_wdt_driver = {
 	.probe		= ath79_wdt_probe,
 	.remove		= ath79_wdt_remove,
-	.shutdown	= ath97_wdt_shutdown,
+	.shutdown	= ath79_wdt_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(ath79_wdt_match),
-- 
2.20.1
