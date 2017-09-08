From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 20:14:59 +0000
Subject: [PATCH] [media] pxa_camera: Delete an error message for a failed memory allocation in pxa_camera_pro
Message-Id: <c7f8c07d-3cbd-c705-a8e5-d0c6941cd09e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Petr Cvek <petr.cvek@tul.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, Sakari Ailus <sakari.ailus@iki.fi>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 22:05:14 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/pxa_camera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index edca993c2b1f..d2a4432a98ea 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2362,10 +2362,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
-	if (!pcdev) {
-		dev_err(&pdev->dev, "Could not allocate pcdev\n");
+	if (!pcdev)
 		return -ENOMEM;
-	}
 
 	pcdev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(pcdev->clk))
-- 
2.14.1

