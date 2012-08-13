From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Aug 2012 16:57:03 +0000
Subject: [patch] xhci: Fix a logical vs bitwise AND bug
Message-Id: <20120813165703.GA5363@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The intent was to test whether the flag was set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c59d5b5..617b0a7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -659,7 +659,7 @@ void xhci_shutdown(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
-	if (xhci->quirks && XHCI_SPURIOUS_REBOOT)
+	if (xhci->quirks & XHCI_SPURIOUS_REBOOT)
 		usb_disable_xhci_ports(to_pci_dev(hcd->self.controller));
 
 	spin_lock_irq(&xhci->lock);
