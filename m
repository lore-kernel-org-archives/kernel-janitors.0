From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 19:50:28 +0000
Subject: [PATCH] Input-max8925_onkey: Use common error handling code in max8925_onkey_probe()
Message-Id: <f4c45d10-d69b-58ec-5ac2-1946481000dd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 21:40:51 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/misc/max8925_onkey.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/max8925_onkey.c b/drivers/input/misc/max8925_onkey.c
index 7c49b8d23894..b60b8c2b5acf 100644
--- a/drivers/input/misc/max8925_onkey.c
+++ b/drivers/input/misc/max8925_onkey.c
@@ -71,16 +71,12 @@ static int max8925_onkey_probe(struct platform_device *pdev)
 	int irq[2], error;
 
 	irq[0] = platform_get_irq(pdev, 0);
-	if (irq[0] < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
-		return -EINVAL;
-	}
+	if (irq[0] < 0)
+		goto report_failure;
 
 	irq[1] = platform_get_irq(pdev, 1);
-	if (irq[1] < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
-		return -EINVAL;
-	}
+	if (irq[1] < 0)
+		goto report_failure;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(struct max8925_onkey_info),
 			    GFP_KERNEL);
@@ -131,6 +127,10 @@ static int max8925_onkey_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	return 0;
+
+report_failure:
+	dev_err(&pdev->dev, "No IRQ resource!\n");
+	return -EINVAL;
 }
 
 static int __maybe_unused max8925_onkey_suspend(struct device *dev)
-- 
2.14.3

