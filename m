From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:53:26 +0000
Subject: [PATCH] usb: gadget: snps_udc_plat: testing the wrong variable
Message-Id: <20170712075326.arqwm2glxo4657q4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"udc->regs" is zero here.  We don't set it until a couple lines later.
The intent was to test "udc->virt_addr".

Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 2e11f19e07ae..b8d1280faafc 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -122,8 +122,8 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	udc->virt_addr = devm_ioremap_resource(dev, res);
-	if (IS_ERR(udc->regs))
-		return PTR_ERR(udc->regs);
+	if (IS_ERR(udc->virt_addr))
+		return PTR_ERR(udc->virt_addr);
 
 	/* udc csr registers base */
 	udc->csr = udc->virt_addr + UDC_CSR_ADDR;
