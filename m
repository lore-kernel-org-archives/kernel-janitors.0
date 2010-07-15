From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 18:58:57 +0000
Subject: [PATCH 14/25] char: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007152058.57703.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Stephen Hemminger <shemminger@vyatta.com>, Andrew Morton <akpm@linux-foundation.org>, Paul Fulghum <paulkf@microgate.com>, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>


This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
.subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
PCI_VDEVICE macro, and thus improves readability.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/char/synclink_gt.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/synclink_gt.c b/drivers/char/synclink_gt.c
index 99fae38..2bb71cb 100644
--- a/drivers/char/synclink_gt.c
+++ b/drivers/char/synclink_gt.c
@@ -97,10 +97,10 @@ MODULE_LICENSE("GPL");
 #define MAX_DEVICES 32
 
 static struct pci_device_id pci_table[] = {
-	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_GT_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
-	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_GT2_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
-	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_GT4_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
-	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_AC_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
+	{ PCI_VDEVICE(MICROGATE, SYNCLINK_GT_DEVICE_ID), },
+	{ PCI_VDEVICE(MICROGATE, SYNCLINK_GT2_DEVICE_ID), },
+	{ PCI_VDEVICE(MICROGATE, SYNCLINK_GT4_DEVICE_ID), },
+	{ PCI_VDEVICE(MICROGATE, SYNCLINK_AC_DEVICE_ID), },
 	{0,}, /* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, pci_table);
-- 
1.7.1

