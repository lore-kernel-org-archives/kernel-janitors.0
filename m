From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 11 Jun 2009 00:23:33 +0000
Subject: [PATCH] mtd: adding __init/__exit macros to init/exitfunctions of mtd drivers
Message-Id: <200906110223.33397.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions to the following modules from drivers/mtd/ 
 devices/m25p80.c
 devices/slram.c
 linux version 2.6.30
 ftl.c
 nand/cafe_nand.c
 nand/cmx270_nand.c

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index cc6369e..4ca4fab 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -772,13 +772,13 @@ static struct spi_driver m25p80_driver = {
 };
 
 
-static int m25p80_init(void)
+static int __init m25p80_init(void)
 {
 	return spi_register_driver(&m25p80_driver);
 }
 
 
-static void m25p80_exit(void)
+static void __exit m25p80_exit(void)
 {
 	spi_unregister_driver(&m25p80_driver);
 }
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 00248e8..7d846e9 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -303,7 +303,7 @@ __setup("slram=", mtd_slram_setup);
 
 #endif
 
-static int init_slram(void)
+static int __init init_slram(void)
 {
 	char *devname;
 	int i;
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index a790c06..e56d6b4 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1099,7 +1099,7 @@ static struct mtd_blktrans_ops ftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int init_ftl(void)
+static int __init init_ftl(void)
 {
 	return register_mtd_blktrans(&ftl_tr);
 }
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 29acd06..1b4690b 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -903,12 +903,12 @@ static struct pci_driver cafe_nand_pci_driver = {
 	.resume = cafe_nand_resume,
 };
 
-static int cafe_nand_init(void)
+static int __init cafe_nand_init(void)
 {
 	return pci_register_driver(&cafe_nand_pci_driver);
 }
 
-static void cafe_nand_exit(void)
+static void __exit cafe_nand_exit(void)
 {
 	pci_unregister_driver(&cafe_nand_pci_driver);
 }
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 10081e6..826cacf 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -147,7 +147,7 @@ static int cmx270_device_ready(struct mtd_info *mtd)
 /*
  * Main initialization routine
  */
-static int cmx270_init(void)
+static int __init cmx270_init(void)
 {
 	struct nand_chip *this;
 	const char *part_type;
@@ -261,7 +261,7 @@ module_init(cmx270_init);
 /*
  * Clean up routine
  */
-static void cmx270_cleanup(void)
+static void __exit cmx270_cleanup(void)
 {
 	/* Release resources, unregister device */
 	nand_release(cmx270_nand_mtd);
