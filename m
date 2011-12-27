From: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 14:01:31 +0000
Subject: [PATCH 6/6] drivers/mtd/nand/txx9ndfmc.c: use devm_request_and_ioremap
Message-Id: <1324994491-21828-7-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/mtd/nand/txx9ndfmc.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index ace46fd..c7c4f1d 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -298,11 +298,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
-	if (!devm_request_mem_region(&dev->dev, res->start,
-				     resource_size(res), dev_name(&dev->dev)))
-		return -EBUSY;
-	drvdata->base = devm_ioremap(&dev->dev, res->start,
-				     resource_size(res));
+	drvdata->base = devm_request_and_ioremap(&dev->dev, res);
 	if (!drvdata->base)
 		return -EBUSY;
 

