From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 08:51:55 +0000
Subject: [PATCH 5/6] regulator: ti-abb: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <1376902316-18520-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret != 0;
identifier l;
@@

  res = platform_get_resource_byname(...);
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/regulator/ti-abb-regulator.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
index 3753ed0..d8e3e12 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -717,11 +717,6 @@ static int ti_abb_probe(struct platform_device *pdev)
 	/* Map ABB resources */
 	pname = "base-address";
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, pname);
-	if (!res) {
-		dev_err(dev, "Missing '%s' IO resource\n", pname);
-		ret = -ENODEV;
-		goto err;
-	}
 	abb->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(abb->base)) {
 		ret = PTR_ERR(abb->base);
@@ -770,11 +765,6 @@ static int ti_abb_probe(struct platform_device *pdev)
 
 	pname = "ldo-address";
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, pname);
-	if (!res) {
-		dev_dbg(dev, "Missing '%s' IO resource\n", pname);
-		ret = -ENODEV;
-		goto skip_opt;
-	}
 	abb->ldo_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(abb->ldo_base)) {
 		ret = PTR_ERR(abb->ldo_base);

