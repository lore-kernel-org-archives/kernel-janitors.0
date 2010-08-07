From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 07:06:52 +0000
Subject: [PATCH] staging: xgifb: use DEFINE_PCI_DEVICE_TABLE() macro
Message-Id: <1281164812.7976.25.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Bill Pemberton <wfp5p@virginia.edu>, Arnaud Patard <apatard@mandriva.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use DEFINE_PCI_DEVICE_TABLE() to make xgifb_pci_table const and marked as __devinitconst 


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_main.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_main.h b/drivers/staging/xgifb/XGI_main.h
index fd1152e..06f62ee 100644
--- a/drivers/staging/xgifb/XGI_main.h
+++ b/drivers/staging/xgifb/XGI_main.h
@@ -46,8 +46,7 @@
 #define XGI_IOTYPE2 __iomem
 #define XGIINITSTATIC static
 
-static struct pci_device_id __devinitdata xgifb_pci_table[] = {
-
+static DEFINE_PCI_DEVICE_TABLE(xgifb_pci_table) = {
 	{ PCI_VENDOR_ID_XG, PCI_DEVICE_ID_XG_20, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{ PCI_VENDOR_ID_XG, PCI_DEVICE_ID_XG_27, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
 	{ PCI_VENDOR_ID_XG, PCI_DEVICE_ID_XG_40, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
-- 
1.7.0.4



