From: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 14:01:27 +0000
Subject: [PATCH 2/6] drivers/i2c/busses/i2c-mxs.c: use devm_request_and_ioremap
Message-Id: <1324994491-21828-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Reimplement a call to devm_request_mem_region followed by a call to ioremap
or ioremap_nocache by a call to devm_request_and_ioremap.

The variable res_size is then no longer needed.

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
 drivers/i2c/busses/i2c-mxs.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 7e78f7c..6f24d00 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -317,7 +317,6 @@ static int __devinit mxs_i2c_probe(struct platform_device *pdev)
 	struct mxs_i2c_dev *i2c;
 	struct i2c_adapter *adap;
 	struct resource *res;
-	resource_size_t res_size;
 	int err, irq;
 
 	i2c = devm_kzalloc(dev, sizeof(struct mxs_i2c_dev), GFP_KERNEL);
@@ -328,11 +327,7 @@ static int __devinit mxs_i2c_probe(struct platform_device *pdev)
 	if (!res)
 		return -ENOENT;
 
-	res_size = resource_size(res);
-	if (!devm_request_mem_region(dev, res->start, res_size, res->name))
-		return -EBUSY;
-
-	i2c->regs = devm_ioremap_nocache(dev, res->start, res_size);
+	i2c->regs = devm_request_and_ioremap(dev, res);
 	if (!i2c->regs)
 		return -EBUSY;
 

