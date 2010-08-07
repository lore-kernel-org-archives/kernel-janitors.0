From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:42:07 +0000
Subject: [PATCH 12/14] staging: comedi (adv_pci1723): use PCI_DEVICE() macro
Message-Id: <1281163327.7976.19.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/adv_pci1723.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1723.c b/drivers/staging/comedi/drivers/adv_pci1723.c
index b133bb8..1b56821 100644
--- a/drivers/staging/comedi/drivers/adv_pci1723.c
+++ b/drivers/staging/comedi/drivers/adv_pci1723.c
@@ -155,9 +155,8 @@ static const struct pci1723_board boardtypes[] = {
  * Should only be used for PCI and ISA-PnP devices
  */
 static DEFINE_PCI_DEVICE_TABLE(pci1723_pci_table) = {
-	{
-	PCI_VENDOR_ID_ADVANTECH, 0x1723, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_ADVANTECH, 0x1723) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, pci1723_pci_table);
-- 
1.7.0.4



