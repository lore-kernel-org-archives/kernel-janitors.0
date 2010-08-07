From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:33:26 +0000
Subject: [PATCH 03/14] staging: comedi (cb_pcidio): user PCI_DEVICE() macro
Message-Id: <1281162806.7976.9.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidio.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidio.c b/drivers/staging/comedi/drivers/cb_pcidio.c
index c1693c9..79477a5 100644
--- a/drivers/staging/comedi/drivers/cb_pcidio.c
+++ b/drivers/staging/comedi/drivers/cb_pcidio.c
@@ -91,11 +91,10 @@ static const struct pcidio_board pcidio_boards[] = {
 /* Please add your PCI vendor ID to comedidev.h, and it will be forwarded
  * upstream. */
 static DEFINE_PCI_DEVICE_TABLE(pcidio_pci_table) = {
-	{
-	PCI_VENDOR_ID_CB, 0x0028, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x0014, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_CB, 0x000b, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0028) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x0014) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CB, 0x000b) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, pcidio_pci_table);
-- 
1.7.0.4






