From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Feb 2016 11:36:09 +0000
Subject: [patch] extcon: use correct size
Message-Id: <20160204113609.GA11239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The info->status[] array has 3 elements.  We are using size
MAX77843_MUIC_IRQ_NUM (16) instead of MAX77843_MUIC_STATUS_NUM (3) as
intended.

Fixes: 135d9f7d135a ('extcon: max77843: Clear IRQ bits state before request IRQ')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis and *NOT TESTED*.  Please review carefully.

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 7bbc300..b188bd6 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -806,7 +806,7 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	/* Clear IRQ bits before request IRQs */
 	ret = regmap_bulk_read(max77843->regmap_muic,
 			MAX77843_MUIC_REG_INT1, info->status,
-			MAX77843_MUIC_IRQ_NUM);
+			MAX77843_MUIC_STATUS_NUM);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
 		goto err_muic_irq;
