From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:36:45 +0000
Subject: [PATCH 06/14] staging: comedi (cb_pcimdas): use PCI_DEVICE() macro
Message-Id: <1281163005.7976.13.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcimdas.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcimdas.c b/drivers/staging/comedi/drivers/cb_pcimdas.c
index ced346a..16c322d 100644
--- a/drivers/staging/comedi/drivers/cb_pcimdas.c
+++ b/drivers/staging/comedi/drivers/cb_pcimdas.c
@@ -126,10 +126,8 @@ static const struct cb_pcimdas_board cb_pcimdas_boards[] = {
 /* This is used by modprobe to translate PCI IDs to drivers.  Should
  * only be used for PCI and ISA-PnP devices */
 static DEFINE_PCI_DEVICE_TABLE(cb_pcimdas_pci_table) = {
-	{
-	PCI_VENDOR_ID_COMPUTERBOARDS, 0x0056, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_COMPUTERBOARDS, 0x0056) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, cb_pcimdas_pci_table);
-- 
1.7.0.4



