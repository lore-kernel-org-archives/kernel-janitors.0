From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 17:39:03 +0000
Subject: [PATCH 4/7] usb: lh7a40x_udc: check return value of create_proc_read_entry()
Message-Id: <1280597943-8485-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

create_proc_read_entry() may fail, if so return -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/gadget/lh7a40x_udc.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/lh7a40x_udc.c b/drivers/usb/gadget/lh7a40x_udc.c
index fded3fc..b04a62f 100644
--- a/drivers/usb/gadget/lh7a40x_udc.c
+++ b/drivers/usb/gadget/lh7a40x_udc.c
@@ -244,7 +244,7 @@ udc_proc_read(char *page, char **start, off_t off, int count,
 
 #else	/* !CONFIG_USB_GADGET_DEBUG_FILES */
 
-#define create_proc_files() do {} while (0)
+#define create_proc_files() ({ (void *)1; })
 #define remove_proc_files() do {} while (0)
 
 #endif	/* CONFIG_USB_GADGET_DEBUG_FILES */
@@ -2092,7 +2092,12 @@ static int lh7a40x_udc_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
-	create_proc_files();
+	if (create_proc_files() = NULL) {
+		DEBUG(KERN_ERR "%s: can't get irq %i, err %d\n", driver_name,
+		      IRQ_USBINTR, retval);
+		free_irq(IRQ_USBINTR, dev);
+		return -ENOMEM;
+	}
 
 	return retval;
 }
-- 
1.7.0.4

