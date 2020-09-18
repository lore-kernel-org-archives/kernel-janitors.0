From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 14:33:38 +0000
Subject: [PATCH] staging: spmi: hisi-spmi-controller: Use devm_ version of ioremap().
Message-Id: <20200918143338.GE909725@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Mayulong <mayulong1@huawei.com>

The ioremap() was never unmapped in the probe error handling or in the
remove function.  The fix is to use the devm_ioremap() function so it
gets cleaned up automatically.

Fixes: 70f59c90c819 ("staging: spmi: add Hikey 970 SPMI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/hikey9xx/hisi-spmi-controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
index 5ffe79f45d9a..f831c43f4783 100644
--- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
+++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
@@ -281,7 +281,8 @@ static int spmi_controller_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	spmi_controller->base = ioremap(iores->start, resource_size(iores));
+	spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
+					     resource_size(iores));
 	if (!spmi_controller->base) {
 		dev_err(&pdev->dev, "can not remap base addr!\n");
 		return -EADDRNOTAVAIL;
-- 
2.28.0
