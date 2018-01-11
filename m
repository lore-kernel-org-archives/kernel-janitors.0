From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:14:57 +0000
Subject: [PATCH -next] staging: ccree: remove redundant dev_err call in init_cc_resources()
Message-Id: <1515669297-125873-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/ccree/cc_driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/ccree/cc_driver.c b/drivers/staging/ccree/cc_driver.c
index 6682d9d..c27d5a8 100644
--- a/drivers/staging/ccree/cc_driver.c
+++ b/drivers/staging/ccree/cc_driver.c
@@ -174,10 +174,8 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	req_mem_cc_regs = platform_get_resource(plat_dev, IORESOURCE_MEM, 0);
 	/* Map registers space */
 	new_drvdata->cc_base = devm_ioremap_resource(dev, req_mem_cc_regs);
-	if (IS_ERR(new_drvdata->cc_base)) {
-		dev_err(dev, "Failed to ioremap registers");
+	if (IS_ERR(new_drvdata->cc_base))
 		return PTR_ERR(new_drvdata->cc_base);
-	}
 
 	dev_dbg(dev, "Got MEM resource (%s): %pR\n", req_mem_cc_regs->name,
 		req_mem_cc_regs);

