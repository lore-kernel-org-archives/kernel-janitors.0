From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 14 Aug 2013 09:11:15 +0000
Subject: [PATCH 11/29] marvell-ccic/mmp-driver.c: simplify use of devm_ioremap_resource
Message-Id: <1376471493-22215-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/marvell-ccic/mmp-driver.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index f06daa4..b5a19af 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -396,10 +396,6 @@ static int mmpcam_probe(struct platform_device *pdev)
 	 * Get our I/O memory.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res = NULL) {
-		dev_err(&pdev->dev, "no iomem resource!\n");
-		return -ENODEV;
-	}
 	mcam->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mcam->regs))
 		return PTR_ERR(mcam->regs);
@@ -409,10 +405,6 @@ static int mmpcam_probe(struct platform_device *pdev)
 	 * should really be managed outside of this driver?
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res = NULL) {
-		dev_err(&pdev->dev, "no power resource!\n");
-		return -ENODEV;
-	}
 	cam->power_regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(cam->power_regs))
 		return PTR_ERR(cam->power_regs);

