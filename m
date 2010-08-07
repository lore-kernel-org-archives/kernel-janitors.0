From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:35:57 +0000
Subject: [PATCH 05/14] staging: comedi (me4000): use PCI_DEVICE() macro
Message-Id: <1281162957.7976.12.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/me4000.c |   29 ++++++++++++++---------------
 1 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/comedi/drivers/me4000.c b/drivers/staging/comedi/drivers/me4000.c
index 1471384..e6825c2 100644
--- a/drivers/staging/comedi/drivers/me4000.c
+++ b/drivers/staging/comedi/drivers/me4000.c
@@ -71,21 +71,20 @@ broken.
   ======================================*/
 
 static DEFINE_PCI_DEVICE_TABLE(me4000_pci_table) = {
-	{
-	PCI_VENDOR_ID_MEILHAUS, 0x4650, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4660, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4661, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4662, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4663, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4670, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4671, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4672, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4673, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4680, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4681, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4682, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_MEILHAUS, 0x4683, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4650) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4660) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4661) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4662) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4663) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4670) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4671) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4672) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4673) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4680) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4681) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4682) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEILHAUS, 0x4683) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, me4000_pci_table);
-- 
1.7.0.4



