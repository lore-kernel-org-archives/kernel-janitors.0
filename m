From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 08:13:05 +0000
Subject: [PATCH] staging: ccree: remove unused pointer cc_base
Message-Id: <20171109081305.3659-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer cc_base is being assigned but is never read, hence it is
redundant and can be removed. Cleans up clang warning:

drivers/staging/ccree/ssi_driver.c:235:2: warning: Value stored to
'cc_base' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ccree/ssi_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/ccree/ssi_driver.c b/drivers/staging/ccree/ssi_driver.c
index 1a3c481fa92a..f4c0af8047e4 100644
--- a/drivers/staging/ccree/ssi_driver.c
+++ b/drivers/staging/ccree/ssi_driver.c
@@ -199,7 +199,6 @@ int init_cc_regs(struct ssi_drvdata *drvdata, bool is_probe)
 static int init_cc_resources(struct platform_device *plat_dev)
 {
 	struct resource *req_mem_cc_regs = NULL;
-	void __iomem *cc_base = NULL;
 	struct ssi_drvdata *new_drvdata;
 	struct device *dev = &plat_dev->dev;
 	struct device_node *np = dev->of_node;
@@ -232,8 +231,6 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	dev_dbg(dev, "CC registers mapped from %pa to 0x%p\n",
 		&req_mem_cc_regs->start, new_drvdata->cc_base);
 
-	cc_base = new_drvdata->cc_base;
-
 	/* Then IRQ */
 	new_drvdata->irq = platform_get_irq(plat_dev, 0);
 	if (new_drvdata->irq < 0) {
-- 
2.14.1

