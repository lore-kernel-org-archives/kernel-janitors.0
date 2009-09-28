From: Peter Huewe <PeterHuewe@gmx.de>
Date: Mon, 28 Sep 2009 23:53:16 +0000
Subject: [PATCH] staging/phison:  adding __init/__exit macros
Message-Id: <200909290153.16839.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of drivers/staging/phison/phison.c

Greg, please have a look at the small patch and either pull it through
your staging tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/staging/phison/phison.c b/drivers/staging/phison/phison.c
index 270ebcb..3817d74 100644
--- a/drivers/staging/phison/phison.c
+++ b/drivers/staging/phison/phison.c
@@ -87,12 +87,12 @@ static struct pci_driver phison_pci_driver = {
 #endif
 };
 
-static int phison_ide_init(void)
+static int __init phison_ide_init(void)
 {
 	return pci_register_driver(&phison_pci_driver);
 }
 
-static void phison_ide_exit(void)
+static void __exit phison_ide_exit(void)
 {
 	pci_unregister_driver(&phison_pci_driver);
 }
