From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:41:17 +0000
Subject: [PATCH 11/14] staging: comedi (adv_pci1710): use PCI_DEVICE() macro
Message-Id: <1281163277.7976.18.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index bdd6954..466e69f 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -217,13 +217,12 @@ struct boardtype {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(pci1710_pci_table) = {
-	{
-	PCI_VENDOR_ID_ADVANTECH, 0x1710, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_ADVANTECH, 0x1711, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_ADVANTECH, 0x1713, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_ADVANTECH, 0x1720, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_ADVANTECH, 0x1731, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1710) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1711) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1713) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1720) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1731) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, pci1710_pci_table);
-- 
1.7.0.4



