From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 19:35:15 +0000
Subject: [patch] USB: ohci-sm501: add iounmap on error path
Message-Id: <20100910193515.GH5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This ioremap() was leaked on an error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index cff2363..041d30f 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -168,7 +168,7 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 
 	retval = usb_add_hcd(hcd, irq, IRQF_DISABLED | IRQF_SHARED);
 	if (retval)
-		goto err4;
+		goto err5;
 
 	/* enable power and unmask interrupts */
 
@@ -176,6 +176,8 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	sm501_modify_reg(dev->parent, SM501_IRQ_MASK, 1 << 6, 0);
 
 	return 0;
+err5:
+	iounmap(hcd->regs);
 err4:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err3:
