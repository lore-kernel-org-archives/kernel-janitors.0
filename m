From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:40:20 +0000
Subject: [PATCH 10/14] staging: comedi (skel): use PCI_DEVICE() macro
Message-Id: <1281163220.7976.17.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/skel.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/skel.c b/drivers/staging/comedi/drivers/skel.c
index 0b9ecb1..ed69008 100644
--- a/drivers/staging/comedi/drivers/skel.c
+++ b/drivers/staging/comedi/drivers/skel.c
@@ -116,10 +116,9 @@ static const struct skel_board skel_boards[] = {
  * upstream. */
 #define PCI_VENDOR_ID_SKEL 0xdafe
 static DEFINE_PCI_DEVICE_TABLE(skel_pci_table) = {
-	{
-	PCI_VENDOR_ID_SKEL, 0x0100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_SKEL, 0x0200, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_SKEL, 0x0100) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SKEL, 0x0200) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, skel_pci_table);
-- 
1.7.0.4



