From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:39:33 +0000
Subject: [PATCH 09/14] staging: comedi (adl_pci9118): use PCI_DEVICE() macro
Message-Id: <1281163173.7976.16.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/adl_pci9118.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adl_pci9118.c b/drivers/staging/comedi/drivers/adl_pci9118.c
index b0e39cb..a2bd4e6 100644
--- a/drivers/staging/comedi/drivers/adl_pci9118.c
+++ b/drivers/staging/comedi/drivers/adl_pci9118.c
@@ -252,9 +252,8 @@ struct boardtype {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(pci9118_pci_table) = {
-	{
-	PCI_VENDOR_ID_AMCC, 0x80d9, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMCC, 0x80d9) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, pci9118_pci_table);
-- 
1.7.0.4



