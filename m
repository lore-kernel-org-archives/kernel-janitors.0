From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 10:13:13 +0000
Subject: [KJ] [PATCH] Audit return code : drivers/char/applicom.c
Message-Id: <20050621101313.GE4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="t0UkRYy7tHLRMCai"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Audit return codes (and handle failure correctly) for misc_register.
 
Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="patch_drivers_char_applicom.c.diff"

diff -urpNX dontdiff 2.6.12-orig/drivers/char/applicom.c 2.6.12/drivers/char/applicom.c
--- 2.6.12-orig/drivers/char/applicom.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/char/applicom.c	2005-06-21 11:25:19.448714976 +0200
@@ -172,7 +172,7 @@ static int ac_register_board(unsigned lo
 
 void cleanup_module(void)
 {
-	int i;
+	unsigned int i;
 
 	misc_deregister(&ac_miscdev);
 
@@ -195,7 +195,7 @@ int __init applicom_init(void)
 	int i, numisa = 0;
 	struct pci_dev *dev = NULL;
 	void __iomem *RamIO;
-	int boardno;
+	int boardno, ret;
 
 	printk(KERN_INFO "Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $\n");
 
@@ -294,7 +294,7 @@ int __init applicom_init(void)
 	}
 
 	if (!numisa)
-		printk(KERN_WARNING"ac.o: No valid ISA Applicom boards found at mem 0x%lx\n",mem);
+		printk(KERN_WARNING "ac.o: No valid ISA Applicom boards found at mem 0x%lx\n",mem);
 
  fin:
 	init_waitqueue_head(&FlagSleepRec);
@@ -304,7 +304,10 @@ int __init applicom_init(void)
 	DeviceErrorCount = 0;
 
 	if (numboards) {
-		misc_register(&ac_miscdev);
+		if (ret = misc_register(&ac_miscdev)) {
+			printk(KERN_WARNING "Unable to register misc device\n");
+			goto out;
+		}
 		for (i = 0; i < MAX_BOARD; i++) {
 			int serial;
 			char boardname[(SERIAL_NUMBER - TYPE_CARD) + 1];
@@ -337,6 +340,17 @@ int __init applicom_init(void)
 
 	else
 		return -ENXIO;
+
+out:
+	for (i = 0 ; i < MAX_BOARD ; i++) {
+		if (apbs[i].RamIO)
+			continue;
+		if (apbs[i].irq)
+			free_irq(apbs[i].irq, &dummy);
+		iounmap(apbs[i].RamIO);
+	}
+	pci_disable_device(dev);
+	return ret ;
 }
 
 

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--t0UkRYy7tHLRMCai--
