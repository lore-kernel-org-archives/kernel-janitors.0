From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 18:41:25 +0000
Subject: [PATCH 1/2] [media] ti-vpe: Delete an error message for a failed memory allocation in two functions
Message-Id: <066c05d5-ca92-2ff9-4b1d-ce21528ae938@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8137a759-cbfd-e04d-0adb-06de1b3246d1@users.sourceforge.net>
In-Reply-To: <8137a759-cbfd-e04d-0adb-06de1b3246d1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Archit Taneja <archit@ti.com>, Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 20:15:17 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/ti-vpe/csc.c | 4 +---
 drivers/media/platform/ti-vpe/sc.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index 44b8465cf101..135fc9993679 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -176,8 +176,6 @@ struct csc_data *csc_create(struct platform_device *pdev, const char *res_name)
 	csc = devm_kzalloc(&pdev->dev, sizeof(*csc), GFP_KERNEL);
-	if (!csc) {
-		dev_err(&pdev->dev, "couldn't alloc csc_data\n");
+	if (!csc)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	csc->pdev = pdev;
 
diff --git a/drivers/media/platform/ti-vpe/sc.c b/drivers/media/platform/ti-vpe/sc.c
index e9273b713782..e9e307875feb 100644
--- a/drivers/media/platform/ti-vpe/sc.c
+++ b/drivers/media/platform/ti-vpe/sc.c
@@ -284,8 +284,6 @@ struct sc_data *sc_create(struct platform_device *pdev, const char *res_name)
 	sc = devm_kzalloc(&pdev->dev, sizeof(*sc), GFP_KERNEL);
-	if (!sc) {
-		dev_err(&pdev->dev, "couldn't alloc sc_data\n");
+	if (!sc)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	sc->pdev = pdev;
 
-- 
2.14.1

