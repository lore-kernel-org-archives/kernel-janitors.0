From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:42:55 +0000
Subject: [PATCH 13/14] staging: comedi (cb_pcidas64): use PCI_DEVICE() macro
Message-Id: <1281163375.7976.20.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidas64.c |   60 +++++++++-----------------
 1 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidas64.c b/drivers/staging/comedi/drivers/cb_pcidas64.c
index 53e7015..9b1dd3c 100644
--- a/drivers/staging/comedi/drivers/cb_pcidas64.c
+++ b/drivers/staging/comedi/drivers/cb_pcidas64.c
@@ -1028,46 +1028,26 @@ static const struct pcidas64_board pcidas64_boards[] = {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(pcidas64_pci_table) = {
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x001d, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x001e, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0035, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0036, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0037, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0052, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x005d, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x005e, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x005f, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0061, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0062, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0063, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0064, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0066, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0067, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0068, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x006f, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0078, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0079, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x001d) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x001e) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0035) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0036) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0037) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0052) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x005d) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x005e) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x005f) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0061) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0062) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0063) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0064) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0066) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0067) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0068) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x006f) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0078) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0079) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, pcidas64_pci_table);
-- 
1.7.0.4



