From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 07 Sep 2017 20:22:07 +0000
Subject: [PATCH] [media] blackfin: Delete an error message for a failed memory allocation in ppi_create_insta
Message-Id: <3f472947-091e-3e96-b278-093ca287b5a2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Scott Jiang <scott.jiang.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 7 Sep 2017 22:14:43 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/blackfin/ppi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/blackfin/ppi.c b/drivers/media/platform/blackfin/ppi.c
index 37169054b828..478eb2f7d723 100644
--- a/drivers/media/platform/blackfin/ppi.c
+++ b/drivers/media/platform/blackfin/ppi.c
@@ -338,7 +338,6 @@ struct ppi_if *ppi_create_instance(struct platform_device *pdev,
 	ppi = kzalloc(sizeof(*ppi), GFP_KERNEL);
 	if (!ppi) {
 		peripheral_free_list(info->pin_req);
-		dev_err(&pdev->dev, "unable to allocate memory for ppi handle\n");
 		return NULL;
 	}
 	ppi->ops = &ppi_ops;
-- 
2.14.1

