From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 May 2014 20:35:19 +0000
Subject: [patch] usb: phy: msm: fix bug in probe()
Message-Id: <20140519203519.GB5671@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My previous patch introduced a bug which prevented this driver from
loading.  devm_ioremap_resource() has a call to
devm_request_mem_region() which will fail because the address space is
shared between this PHY driver and CI device controller driver.

Fixes: 10f0577aa5cb ('usb: phy: msm: change devm_ioremap() to devm_ioremap_resource()')
Reported-by:"Ivan T. Ivanov" <iivanov@mm-sol.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 4f88174..ced34f3 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1586,9 +1586,11 @@ static int msm_otg_probe(struct platform_device *pdev)
 				      np ? "alt_core" : "usb_hs_core_clk");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	motg->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(motg->regs))
-		return PTR_ERR(motg->regs);
+	if (!res)
+		return -EINVAL;
+	motg->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!motg->regs)
+		return -ENOMEM;
 
 	/*
 	 * NOTE: The PHYs can be multiplexed between the chipidea controller
