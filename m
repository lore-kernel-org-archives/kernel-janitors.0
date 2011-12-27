From: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 14:01:26 +0000
Subject: [PATCH 1/6] drivers/gpio/gpio-tegra.c: use devm_request_and_ioremap
Message-Id: <1324994491-21828-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

From: Julia Lawall <julia@diku.dk>

Reimplement a call to devm_request_mem_region followed by a call to ioremap
or ioremap_nocache by a call to devm_request_and_ioremap.

The semantic patch that makes this transformation is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@nm@
expression myname;
identifier i;
@@

struct platform_driver i = { .driver = { .name = myname } };

@@
expression dev,res,size;
expression nm.myname;
@@

-if (!devm_request_mem_region(dev, res->start, size,
-                              \(res->name\|dev_name(dev)\|myname\))) {
-   ...
-   return ...;
-}
... when != res->start
(
-devm_ioremap(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
|
-devm_ioremap_nocache(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
)
... when any
    when != res->start
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpio/gpio-tegra.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 61044c8..bdc2937 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -361,14 +361,7 @@ static int __devinit tegra_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (!devm_request_mem_region(&pdev->dev, res->start,
-				     resource_size(res),
-				     dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev, "Couldn't request MEM resource\n");
-		return -ENODEV;
-	}
-
-	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	regs = devm_request_and_ioremap(&pdev->dev, res);
 	if (!regs) {
 		dev_err(&pdev->dev, "Couldn't ioremap regs\n");
 		return -ENODEV;

