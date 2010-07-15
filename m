From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 18:42:12 +0000
Subject: [PATCH 06/25] atm: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007152042.13091.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Chas Williams <chas@cmf.nrl.navy.mil>, "David S. Miller" <davem@davemloft.net>, Tejun Heo <tj@kernel.org>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
.subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
PCI_VDEVICE macro, and thus improves readability.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/atm/firestream.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index 6e600af..8717809 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -2027,10 +2027,8 @@ static void __devexit firestream_remove_one (struct pci_dev *pdev)
 }
 
 static struct pci_device_id firestream_pci_tbl[] = {
-	{ PCI_VENDOR_ID_FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS50, 
-	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, FS_IS50},
-	{ PCI_VENDOR_ID_FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS155, 
-	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, FS_IS155},
+	{ PCI_VDEVICE(FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS50), FS_IS50},
+	{ PCI_VDEVICE(FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS155), FS_IS155},
 	{ 0, }
 };
 
-- 
1.7.1

