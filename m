From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 14 Aug 2013 09:11:28 +0000
Subject: [PATCH 24/29] drivers/remoteproc/da8xx_remoteproc.c: simplify use of devm_ioremap_resource
Message-Id: <1376471493-22215-25-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

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
 drivers/remoteproc/da8xx_remoteproc.c |   14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 129f7b9..bb41ee0 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -201,23 +201,11 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	}
 
 	bootreg_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!bootreg_res) {
-		dev_err(dev,
-			"platform_get_resource(IORESOURCE_MEM, 0): NULL\n");
-		return -EADDRNOTAVAIL;
-	}
-
-	chipsig_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!chipsig_res) {
-		dev_err(dev,
-			"platform_get_resource(IORESOURCE_MEM, 1): NULL\n");
-		return -EADDRNOTAVAIL;
-	}
-
 	bootreg = devm_ioremap_resource(dev, bootreg_res);
 	if (IS_ERR(bootreg))
 		return PTR_ERR(bootreg);
 
+	chipsig_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	chipsig = devm_ioremap_resource(dev, chipsig_res);
 	if (IS_ERR(chipsig))
 		return PTR_ERR(chipsig);

