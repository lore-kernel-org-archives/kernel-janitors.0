From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:47 +0000
Subject: [PATCH 19/19] drivers/usb/core: use for_each_pci_dev()
Message-Id: <1278173088-12051-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/core/hcd-pci.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 7e2d527..c1f0bba 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -66,10 +66,7 @@ static void companion_common(struct pci_dev *pdev, struct usb_hcd *hcd,
 	 * vice versa.
 	 */
 	companion = NULL;
-	for (;;) {
-		companion = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, companion);
-		if (!companion)
-			break;
+	for_each_pci_dev(companion) {
 		if (companion->bus != pdev->bus ||
 				PCI_SLOT(companion->devfn) != slot)
 			continue;
-- 
1.7.0.4

