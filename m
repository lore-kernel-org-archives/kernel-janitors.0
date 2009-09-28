From: Peter Huewe <PeterHuewe@gmx.de>
Date: Mon, 28 Sep 2009 23:40:59 +0000
Subject: [PATCH] staging/cx25821:  adding __init/__exit macros
Message-Id: <200909290141.00324.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Palash Bandyopadhyay <palash.bandyopadhyay@conexant.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of ./staging/cx25821/cx25821-core.c

Greg, please have a look at the small patch and either pull it through
your staging tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/staging/cx25821/cx25821-core.c b/drivers/staging/cx25821/cx25821-core.c
index 8aceae5..67f689d 100644
--- a/drivers/staging/cx25821/cx25821-core.c
+++ b/drivers/staging/cx25821/cx25821-core.c
@@ -1521,7 +1521,7 @@ static struct pci_driver cx25821_pci_driver = {
 	.resume = NULL,
 };
 
-static int cx25821_init(void)
+static int __init cx25821_init(void)
 {
 	INIT_LIST_HEAD(&cx25821_devlist);
 	printk(KERN_INFO "cx25821 driver version %d.%d.%d loaded\n",
@@ -1530,7 +1530,7 @@ static int cx25821_init(void)
 	return pci_register_driver(&cx25821_pci_driver);
 }
 
-static void cx25821_fini(void)
+static void __exit cx25821_fini(void)
 {
 	pci_unregister_driver(&cx25821_pci_driver);
 }
