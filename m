From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:34:21 +0000
Subject: [PATCH] thermal: mmio: remove some dead code
Message-Id: <20190515093420.GC3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Talel Shenhar <talel@amazon.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The platform_get_resource() function doesn't return error pointers, it
returns NULL.  The way this is normally done, is that we pass the NULL
resource to devm_ioremap_resource() and then check for errors from that.
See the comment in front of devm_ioremap_resource() for more details.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thermal/thermal_mmio.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/thermal/thermal_mmio.c b/drivers/thermal/thermal_mmio.c
index de3cceea23bc..40524fa13533 100644
--- a/drivers/thermal/thermal_mmio.c
+++ b/drivers/thermal/thermal_mmio.c
@@ -53,13 +53,6 @@ static int thermal_mmio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(resource)) {
-		dev_err(&pdev->dev,
-			"fail to get platform memory resource (%ld)\n",
-			PTR_ERR(resource));
-		return PTR_ERR(resource);
-	}
-
 	sensor->mmio_base = devm_ioremap_resource(&pdev->dev, resource);
 	if (IS_ERR(sensor->mmio_base)) {
 		dev_err(&pdev->dev, "failed to ioremap memory (%ld)\n",
-- 
2.20.1
