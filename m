From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:05:33 +0000
Subject: [PATCH 03/61] auxdisplay: simplify getting .drvdata
Message-Id: <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/auxdisplay/arm-charlcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/arm-charlcd.c b/drivers/auxdisplay/arm-charlcd.c
index b3176ee92b90..26246ab7a066 100644
--- a/drivers/auxdisplay/arm-charlcd.c
+++ b/drivers/auxdisplay/arm-charlcd.c
@@ -329,8 +329,7 @@ static int __init charlcd_probe(struct platform_device *pdev)
 
 static int charlcd_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct charlcd *lcd = platform_get_drvdata(pdev);
+	struct charlcd *lcd = dev_get_drvdata(dev);
 
 	/* Power the display off */
 	charlcd_4bit_command(lcd, HD_DISPCTRL);
@@ -339,8 +338,7 @@ static int charlcd_suspend(struct device *dev)
 
 static int charlcd_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct charlcd *lcd = platform_get_drvdata(pdev);
+	struct charlcd *lcd = dev_get_drvdata(dev);
 
 	/* Turn the display back on */
 	charlcd_4bit_command(lcd, HD_DISPCTRL | HD_DISPCTRL_ON);
-- 
2.11.0

