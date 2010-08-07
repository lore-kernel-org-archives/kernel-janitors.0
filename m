From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 07 Aug 2010 06:35:07 +0000
Subject: [PATCH 04/14] staging: comedi (rtd520): use PCI_DEVICE() macro
Message-Id: <1281162907.7976.11.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PCI_DEVICE() macro for pci table entries on comedi driver and thus improves readability.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/rtd520.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/rtd520.c b/drivers/staging/comedi/drivers/rtd520.c
index 0367d2b..5858d97 100644
--- a/drivers/staging/comedi/drivers/rtd520.c
+++ b/drivers/staging/comedi/drivers/rtd520.c
@@ -329,10 +329,9 @@ static const struct rtdBoard rtd520Boards[] = {
 };
 
 static DEFINE_PCI_DEVICE_TABLE(rtd520_pci_table) = {
-	{
-	PCI_VENDOR_ID_RTD, 0x7520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	PCI_VENDOR_ID_RTD, 0x4520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, {
-	0}
+	{ PCI_DEVICE(PCI_VENDOR_ID_RTD, 0x7520) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_RTD, 0x4520) },
+	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, rtd520_pci_table);
-- 
1.7.0.4



