From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 09:14:08 +0000
Subject: [PATCH] mfd/ti_am335x_tscadc: Delete an error message for a failed memory allocation in ti_tscadc_pr
Message-Id: <b99eba16-9dc8-0183-94ff-f81ae0df4db1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 10:07:43 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/ti_am335x_tscadc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 3cd958a31f36..47012c0899cd 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -169,10 +169,9 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 
 	/* Allocate memory for device */
 	tscadc = devm_kzalloc(&pdev->dev, sizeof(*tscadc), GFP_KERNEL);
-	if (!tscadc) {
-		dev_err(&pdev->dev, "failed to allocate memory.\n");
+	if (!tscadc)
 		return -ENOMEM;
-	}
+
 	tscadc->dev = &pdev->dev;
 
 	err = platform_get_irq(pdev, 0);
-- 
2.15.1

