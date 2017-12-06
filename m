From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 18:35:53 +0000
Subject: [PATCH 1/3] uio: Delete two error messages for a failed memory allocation in uio_dmem_genirq_probe()
Message-Id: <3995c42d-3138-743e-d4a0-85380ed11261@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
In-Reply-To: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 18:05:12 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uio/uio_dmem_genirq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index e1134a4d97f3..b7b0acd1bf01 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -160,7 +160,6 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
 		if (!uioinfo) {
 			ret = -ENOMEM;
-			dev_err(&pdev->dev, "unable to kmalloc\n");
 			goto bad2;
 		}
 		uioinfo->name = pdev->dev.of_node->name;
@@ -188,7 +187,6 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-		dev_err(&pdev->dev, "unable to kmalloc\n");
 		goto bad0;
 	}
 
-- 
2.15.1

