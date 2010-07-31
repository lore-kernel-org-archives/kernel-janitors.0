From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 17:38:44 +0000
Subject: [PATCH 3/7] usb: goku_udc: fix error path
Message-Id: <1280597924-8445-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, Dan Carpenter <error27@gmail.com>, =?UTF-8?q?N=C3=A9meth=20M=C3=A1rton?= <nm127@freemail.hu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

create_proc_read_entry() may fail, if so return -ENOMEM.
Also call pci_set_drvdata() a bit earlier as private data is used in
cleanup code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/gadget/goku_udc.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/goku_udc.c b/drivers/usb/gadget/goku_udc.c
index 1088d08..d62e214 100644
--- a/drivers/usb/gadget/goku_udc.c
+++ b/drivers/usb/gadget/goku_udc.c
@@ -1784,6 +1784,7 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		retval = -ENOMEM;
 		goto done;
 	}
+	pci_set_drvdata(pdev, dev);
 
 	spin_lock_init(&dev->lock);
 	dev->pdev = pdev;
@@ -1821,7 +1822,6 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 	dev->regs = (struct goku_udc_regs __iomem *) base;
 
-	pci_set_drvdata(pdev, dev);
 	INFO(dev, "%s\n", driver_desc);
 	INFO(dev, "version: " DRIVER_VERSION " %s\n", dmastr());
 	INFO(dev, "irq %d, pci mem %p\n", pdev->irq, base);
@@ -1841,7 +1841,11 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 
 #ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	create_proc_read_entry(proc_node_name, 0, NULL, udc_proc_read, dev);
+	if (create_proc_read_entry(proc_node_name, 0, NULL,
+			    udc_proc_read, dev) = NULL) {
+		retval = -ENOMEM;
+		goto done;
+	}
 #endif
 
 	/* done */
-- 
1.7.0.4

