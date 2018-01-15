From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:16:40 +0000
Subject: [PATCH 3/3] mfd/sm501: Adjust 12 checks for null pointers
Message-Id: <10199b4b-ba7d-a253-25c5-e81cafb1d8c9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
In-Reply-To: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 16:00:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/sm501.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index d5ab3481794a..726242f51003 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1050,13 +1050,13 @@ static int sm501_register_gpio(struct sm501_devdata *sm)
 	spin_lock_init(&gpio->lock);
 
 	gpio->regs_res = request_mem_region(iobase, 0x20, "sm501-gpio");
-	if (gpio->regs_res = NULL) {
+	if (!gpio->regs_res) {
 		dev_err(sm->dev, "gpio: failed to request region\n");
 		return -ENXIO;
 	}
 
 	gpio->regs = ioremap(iobase, 0x20);
-	if (gpio->regs = NULL) {
+	if (!gpio->regs) {
 		dev_err(sm->dev, "gpio: failed to remap registers\n");
 		ret = -ENXIO;
 		goto err_claimed;
@@ -1358,7 +1358,7 @@ static int sm501_init_dev(struct sm501_devdata *sm)
 			sm501_register_gpio(sm);
 	}
 
-	if (pdata && pdata->gpio_i2c != NULL && pdata->gpio_i2c_nr > 0) {
+	if (pdata && pdata->gpio_i2c && pdata->gpio_i2c_nr > 0) {
 		if (!sm501_gpio_isregistered(sm))
 			dev_err(sm->dev, "no gpio available for i2c gpio.\n");
 		else
@@ -1383,7 +1383,7 @@ static int sm501_plat_probe(struct platform_device *dev)
 	int ret;
 	struct sm501_devdata *sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 
-	if (sm = NULL) {
+	if (!sm) {
 		ret = -ENOMEM;
 		goto err1;
 	}
@@ -1401,8 +1401,7 @@ static int sm501_plat_probe(struct platform_device *dev)
 
 	sm->io_res = platform_get_resource(dev, IORESOURCE_MEM, 1);
 	sm->mem_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-
-	if (sm->io_res = NULL || sm->mem_res = NULL) {
+	if (!sm->io_res || !sm->mem_res) {
 		dev_err(&dev->dev, "failed to get IO resource\n");
 		ret = -ENOENT;
 		goto err_res;
@@ -1410,8 +1409,7 @@ static int sm501_plat_probe(struct platform_device *dev)
 
 	sm->regs_claim = request_mem_region(sm->io_res->start,
 					    0x100, "sm501");
-
-	if (sm->regs_claim = NULL) {
+	if (!sm->regs_claim) {
 		dev_err(&dev->dev, "cannot claim registers\n");
 		ret = -EBUSY;
 		goto err_res;
@@ -1420,8 +1418,7 @@ static int sm501_plat_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, sm);
 
 	sm->regs = ioremap(sm->io_res->start, resource_size(sm->io_res));
-
-	if (sm->regs = NULL) {
+	if (!sm->regs) {
 		dev_err(&dev->dev, "cannot remap registers\n");
 		ret = -EIO;
 		goto err_claim;
@@ -1447,7 +1444,7 @@ static void sm501_set_power(struct sm501_devdata *sm, int on)
 {
 	struct sm501_platdata *pd = sm->platdata;
 
-	if (pd = NULL)
+	if (!pd)
 		return;
 
 	if (pd->get_power) {
@@ -1571,7 +1568,7 @@ static int sm501_pci_probe(struct pci_dev *dev,
 	int err;
 	struct sm501_devdata *sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 
-	if (sm = NULL) {
+	if (!sm) {
 		err = -ENOMEM;
 		goto err1;
 	}
@@ -1622,15 +1619,14 @@ static int sm501_pci_probe(struct pci_dev *dev,
 
 	sm->regs_claim = request_mem_region(sm->io_res->start,
 					    0x100, "sm501");
-	if (sm->regs_claim = NULL) {
+	if (!sm->regs_claim) {
 		dev_err(&dev->dev, "cannot claim registers\n");
 		err= -EBUSY;
 		goto err3;
 	}
 
 	sm->regs = pci_ioremap_bar(dev, 1);
-
-	if (sm->regs = NULL) {
+	if (!sm->regs) {
 		dev_err(&dev->dev, "cannot remap registers\n");
 		err = -EIO;
 		goto err4;
-- 
2.15.1

