From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2020 14:30:07 +0000
Subject: [PATCH] media: allegro: Fix some NULL vs IS_ERR() checks in probe
Message-Id: <20200619143007.GC267142@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.

Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 70f133a842dd..3ed66aae741d 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -3065,9 +3065,9 @@ static int allegro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (IS_ERR(regs)) {
+	if (!regs) {
 		dev_err(&pdev->dev, "failed to map registers\n");
-		return PTR_ERR(regs);
+		return -ENOMEM;
 	}
 	dev->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &allegro_regmap_config);
@@ -3085,9 +3085,9 @@ static int allegro_probe(struct platform_device *pdev)
 	sram_regs = devm_ioremap(&pdev->dev,
 				 sram_res->start,
 				 resource_size(sram_res));
-	if (IS_ERR(sram_regs)) {
+	if (!sram_regs) {
 		dev_err(&pdev->dev, "failed to map sram\n");
-		return PTR_ERR(sram_regs);
+		return -ENOMEM;
 	}
 	dev->sram = devm_regmap_init_mmio(&pdev->dev, sram_regs,
 					  &allegro_sram_config);
-- 
2.27.0
