From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:43:44 +0000
Subject: [PATCH 14/14] staging: comedi (dt3000): use PCI_DEVICE() macro
Message-Id: <1281163424.7976.21.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/dt3000.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/comedi/drivers/dt3000.c b/drivers/staging/comedi/drivers/dt3000.c
index 656e7bb..6170f7b 100644
--- a/drivers/staging/comedi/drivers/dt3000.c
+++ b/drivers/staging/comedi/drivers/dt3000.c
@@ -165,15 +165,14 @@ static const struct dt3k_boardtype dt3k_boardtypes[] = {
 #define this_board ((const struct dt3k_boardtype *)dev->board_ptr)
 
 static DEFINE_PCI_DEVICE_TABLE(dt3k_pci_table) = {
-	{
-	PCI_VENDOR_ID_DT, 0x0022, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0027, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0023, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0024, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0028, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0025, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_DT, 0x0026, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0022) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0027) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0023) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0024) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0028) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0025) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_DT, 0x0026) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, dt3k_pci_table);
-- 
1.7.0.4



