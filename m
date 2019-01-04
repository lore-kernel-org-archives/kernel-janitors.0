From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Jan 2019 06:47:25 +0000
Subject: [PATCH] watchdog: tqmx86: Fix a couple IS_ERR() vs NULL bugs
Message-Id: <20190104064725.GC30627@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

These functions return NULL on error but we accidentally check
for IS_ERR() instead.

Fixes: e3c21e088f89 ("watchdog: tqmx86: Add watchdog driver for the IO controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/watchdog/tqmx86_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/tqmx86_wdt.c b/drivers/watchdog/tqmx86_wdt.c
index 0d3a0fbbd7a5..52941207a12a 100644
--- a/drivers/watchdog/tqmx86_wdt.c
+++ b/drivers/watchdog/tqmx86_wdt.c
@@ -79,13 +79,13 @@ static int tqmx86_wdt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (!res)
+		return -ENODEV;
 
 	priv->io_base = devm_ioport_map(&pdev->dev, res->start,
 					resource_size(res));
-	if (IS_ERR(priv->io_base))
-		return PTR_ERR(priv->io_base);
+	if (!priv->io_base)
+		return -ENOMEM;
 
 	watchdog_set_drvdata(&priv->wdd, priv);
 
-- 
2.17.1
