From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 18:49:15 +0000
Subject: [PATCH 1/6] drivers:usb:host:xhci.h Removing xhci_hcd from argument
Message-Id: <1376678922-15217-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed struct xhci_hcd from xhci_readl fucntion as it's no more in use.
---
 drivers/usb/host/xhci.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c338741..7cf0e41 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1598,8 +1598,7 @@ static inline struct usb_hcd *xhci_to_hcd(struct xhci_hcd *xhci)
 
 /* TODO: copied from ehci.h - can be refactored? */
 /* xHCI spec says all registers are little endian */
-static inline unsigned int xhci_readl(const struct xhci_hcd *xhci,
-		__le32 __iomem *regs)
+static inline unsigned int xhci_readl(__le32 __iomem *regs)
 {
 	return readl(regs);
 }
-- 
1.7.9.5

