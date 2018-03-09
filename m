From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:18:54 +0000
Subject: [PATCH v2 08/17] mfd: ti_am335x_tscadc: Delete an error message for a failed memory allocation in ti
Message-Id: <f65cc95b-00c5-98b3-e316-372783749a8e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Mar 2018 15:15:51 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a resend for this patch. The change was rebased
on source files from Linux next-20180308.

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
2.16.2

