From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 18:59:36 +0000
Subject: [PATCH 15/25] char: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007152059.36733.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Stephen Hemminger <shemminger@vyatta.com>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
.subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
PCI_VDEVICE macro, and thus improves readability.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/char/synclinkmp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/synclinkmp.c b/drivers/char/synclinkmp.c
index e56caf7..9f9cd8f 100644
--- a/drivers/char/synclinkmp.c
+++ b/drivers/char/synclinkmp.c
@@ -482,7 +482,7 @@ static int synclinkmp_init_one(struct pci_dev *dev,const struct pci_device_id *e
 static void synclinkmp_remove_one(struct pci_dev *dev);
 
 static struct pci_device_id synclinkmp_pci_tbl[] = {
-	{ PCI_VENDOR_ID_MICROGATE, PCI_DEVICE_ID_MICROGATE_SCA, PCI_ANY_ID, PCI_ANY_ID, },
+	{ PCI_VDEVICE(MICROGATE, PCI_DEVICE_ID_MICROGATE_SCA), },
 	{ 0, }, /* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, synclinkmp_pci_tbl);
-- 
1.7.1

