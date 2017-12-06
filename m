From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 18:38:32 +0000
Subject: [PATCH 3/3] uio: Delete two error messages for a failed memory allocation in uio_pdrv_genirq_probe()
Message-Id: <222016cb-fe56-0fe6-40b8-0cf77283e97c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
In-Reply-To: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 19:18:12 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uio/uio_pdrv_genirq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index f598ecddc8a7..327fbe766f1c 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -114,10 +114,9 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 		/* alloc uioinfo for one device */
 		uioinfo = devm_kzalloc(&pdev->dev, sizeof(*uioinfo),
 				       GFP_KERNEL);
-		if (!uioinfo) {
-			dev_err(&pdev->dev, "unable to kmalloc\n");
+		if (!uioinfo)
 			return -ENOMEM;
-		}
+
 		uioinfo->name = pdev->dev.of_node->name;
 		uioinfo->version = "devicetree";
 		/* Multiple IRQs are not supported */
@@ -135,10 +134,8 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "unable to kmalloc\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	priv->uioinfo = uioinfo;
 	spin_lock_init(&priv->lock);
-- 
2.15.1

