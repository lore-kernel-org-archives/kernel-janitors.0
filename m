From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:31:07 +0000
Subject: [PATCH 01/14] staging: comedi (cb_pcidas): use PCI_DEVICE() macro
Message-Id: <1281162667.7976.6.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is the first of a patch series that uses PCI_DEVICE() macro for pci table entries on comedi drivers and thus improving readability.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidas.c |   19 +++++++++----------
 1 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidas.c b/drivers/staging/comedi/drivers/cb_pcidas.c
index 6530b6c..3275fc5 100644
--- a/drivers/staging/comedi/drivers/cb_pcidas.c
+++ b/drivers/staging/comedi/drivers/cb_pcidas.c
@@ -377,16 +377,15 @@ static const struct cb_pcidas_board cb_pcidas_boards[] = {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(cb_pcidas_pci_table) = {
-	{
-	PCI_VENDOR_ID_CB, 0x0001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x000f, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0010, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0019, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x001c, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x004c, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x001a, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x001b, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0001) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x000f) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0010) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0019) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x001c) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x004c) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x001a) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x001b) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, cb_pcidas_pci_table);
-- 
1.7.0.4





