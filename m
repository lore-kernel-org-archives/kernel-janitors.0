From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 18:58:09 +0000
Subject: [PATCH 13/25] char: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007152058.10297.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Stephen Hemminger <shemminger@vyatta.com>, Jiri Slaby <jslaby@suse.cz>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
.subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
PCI_VDEVICE macro, and thus improves readability.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/char/synclink.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index a2a5800..a5941a4 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -889,8 +889,8 @@ static int synclink_init_one (struct pci_dev *dev,
 static void synclink_remove_one (struct pci_dev *dev);
 
 static struct pci_device_id synclink_pci_tbl[] = {
-	{ PCI_VENDOR_ID_MICROGATE, PCI_DEVICE_ID_MICROGATE_USC, PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_MICROGATE, 0x0210, PCI_ANY_ID, PCI_ANY_ID, },
+	{ PCI_VDEVICE(MICROGATE, PCI_DEVICE_ID_MICROGATE_USC), },
+	{ PCI_VDEVICE(MICROGATE, 0x0210), },
 	{ 0, }, /* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, synclink_pci_tbl);
-- 
1.7.1

