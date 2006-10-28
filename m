From: Ethan A Burns <eaburns@zeno.unh.edu>
Date: Sat, 28 Oct 2006 20:10:39 +0000
Subject: [KJ] [PATCH] Changed all calls to pci_module_init to be
Message-Id: <20061028201039.GB20208@zeno.unh.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Ethan A. Burns <burns.ethan@gmail.com>

This change was necessary because pci_module_init is obsolete.

Signed-off-by: Ethan A. Burns <eaburns@unh.edu>
---
 drivers/ata/ata_generic.c        |    2 +-
 drivers/ata/pata_pdc2027x.c      |    2 +-
 drivers/char/ipmi/ipmi_si_intf.c |    2 +-
 drivers/net/hp100.c              |    2 +-
 drivers/net/tokenring/olympic.c  |    2 +-
 drivers/scsi/megaraid.c          |    2 +-
 drivers/scsi/tmscsim.c           |    2 +-
 include/linux/pci.h              |    6 ------
 8 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/ata/ata_generic.c b/drivers/ata/ata_generic.c
index 377425e..f4625ec 100644
--- a/drivers/ata/ata_generic.c
+++ b/drivers/ata/ata_generic.c
@@ -230,7 +230,7 @@ static struct pci_driver ata_generic_pci

 static int __init ata_generic_init(void)
 {
-	return pci_module_init(&ata_generic_pci_driver);
+	return pci_register_driver(&ata_generic_pci_driver);
 }


diff --git a/drivers/ata/pata_pdc2027x.c b/drivers/ata/pata_pdc2027x.c
index d894d99..56e0287 100644
--- a/drivers/ata/pata_pdc2027x.c
+++ b/drivers/ata/pata_pdc2027x.c
@@ -853,7 +853,7 @@ static void __devexit pdc2027x_remove_on
  */
 static int __init pdc2027x_init(void)
 {
-	return pci_module_init(&pdc2027x_pci_driver);
+	return pci_register_driver(&pdc2027x_pci_driver);
 }

 /**
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index e5cfb1f..fbfab65 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2483,7 +2483,7 @@ #ifdef CONFIG_ACPI
 #endif

 #ifdef CONFIG_PCI
-	pci_module_init(&ipmi_pci_driver);
+	pci_register_driver(&ipmi_pci_driver);
 #endif

 	if (si_trydefaults) {
diff --git a/drivers/net/hp100.c b/drivers/net/hp100.c
index 844c136..7dc5185 100644
--- a/drivers/net/hp100.c
+++ b/drivers/net/hp100.c
@@ -3034,7 +3034,7 @@ #ifdef CONFIG_EISA
 		goto out2;
 #endif
 #ifdef CONFIG_PCI
-	err = pci_module_init(&hp100_pci_driver);
+	err = pci_register_driver(&hp100_pci_driver);
 	if (err && err != -ENODEV)
 		goto out3;
 #endif
diff --git a/drivers/net/tokenring/olympic.c b/drivers/net/tokenring/olympic.c
index cd142d0..e9c45fe 100644
--- a/drivers/net/tokenring/olympic.c
+++ b/drivers/net/tokenring/olympic.c
@@ -1771,7 +1771,7 @@ static struct pci_driver olympic_driver

 static int __init olympic_pci_init(void)
 {
-	return pci_module_init (&olympic_driver) ;
+	return pci_register_driver(&olympic_driver) ;
 }

 static void __exit olympic_pci_cleanup(void)
diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index 86099fd..df5329d 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -5069,7 +5069,7 @@ #ifdef CONFIG_PROC_FS
 				"megaraid: failed to create megaraid root\n");
 	}
 #endif
-	error = pci_module_init(&megaraid_pci_driver);
+	error = pci_register_driver(&megaraid_pci_driver);
 	if (error) {
 #ifdef CONFIG_PROC_FS
 		remove_proc_entry("megaraid", &proc_root);
diff --git a/drivers/scsi/tmscsim.c b/drivers/scsi/tmscsim.c
index fa5382e..ce8845e 100644
--- a/drivers/scsi/tmscsim.c
+++ b/drivers/scsi/tmscsim.c
@@ -2681,7 +2681,7 @@ static int __init dc390_module_init(void
 		printk (KERN_INFO "DC390: Using safe settings.\n");
 	}

-	return pci_module_init(&dc390_driver);
+	return pci_register_driver(&dc390_driver);
 }

 static void __exit dc390_module_exit(void)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 09be0f8..70278cc 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -389,12 +389,6 @@ #define PCI_DEVICE_CLASS(dev_class,dev_c
 	.vendor = PCI_ANY_ID, .device = PCI_ANY_ID, \
 	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID

-/*
- * pci_module_init is obsolete, this stays here till we fix up all usages of it
- * in the tree.
- */
-#define pci_module_init	pci_register_driver
-
 /* these external functions are only available when PCI support is enabled */
 #ifdef CONFIG_PCI

--
1.4.1.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
