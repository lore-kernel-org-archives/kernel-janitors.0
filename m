From: Peter Huewe <PeterHuewe@gmx.de>
Date: Mon, 28 Sep 2009 23:34:14 +0000
Subject: [PATCH] staging/et131x:  adding __init/__exit macros
Message-Id: <200909290134.15295.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of ./staging/et131x/et131x_initpci.c

Greg, please have a look at the small patch and either pull it through
your staging tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/staging/et131x/et131x_initpci.c b/drivers/staging/et131x/et131x_initpci.c
index 9db2056..5ec0d5b 100644
--- a/drivers/staging/et131x/et131x_initpci.c
+++ b/drivers/staging/et131x/et131x_initpci.c
@@ -989,7 +989,7 @@ static struct pci_driver et131x_driver = {
  *
  * Returns 0 on success, errno on failure (as defined in errno.h)
  */
-static int et131x_init_module(void)
+static int __init et131x_init_module(void)
 {
 	if (et131x_speed_set < PARM_SPEED_DUPLEX_MIN ||
 	    et131x_speed_set > PARM_SPEED_DUPLEX_MAX) {
@@ -1002,7 +1002,7 @@ static int et131x_init_module(void)
 /**
  * et131x_cleanup_module - The entry point called on driver cleanup
  */
-static void et131x_cleanup_module(void)
+static void __exit et131x_cleanup_module(void)
 {
 	pci_unregister_driver(&et131x_driver);
 }
