From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:32:43 +0000
Subject: [PATCH 02/14] staging: comedi (cb_pcidda): use PCI_DEVICE() macro
Message-Id: <1281162763.7976.8.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidda.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidda.c b/drivers/staging/comedi/drivers/cb_pcidda.c
index 2d35143..6383fc9 100644
--- a/drivers/staging/comedi/drivers/cb_pcidda.c
+++ b/drivers/staging/comedi/drivers/cb_pcidda.c
@@ -196,14 +196,13 @@ static const struct cb_pcidda_board cb_pcidda_boards[] = {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(cb_pcidda_pci_table) = {
-	{
-	PCI_VENDOR_ID_CB, 0x0020, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0021, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0022, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0023, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0024, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0025, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0020) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0021) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0022) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0023) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0024) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0025) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, cb_pcidda_pci_table);
-- 
1.7.0.4



