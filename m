From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 08 Jan 2004 17:18:22 +0000
Subject: [Kernel-janitors] [REDIFF] Fix warning in drivers/ide/pci/siimage.c
Message-Id: <1073582302.6115.42.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

the some patch, only the new format in the if(), as noted by Randy.

diff -X dontdiff -Nru linux-2.6.1-rc3/drivers/ide/pci/siimage.c linux-2.6.1-rc3~/drivers/ide/pci/siimage.c
--- linux-2.6.1-rc3/drivers/ide/pci/siimage.c	2003-10-28 08:10:27.000000000 -0200
+++ linux-2.6.1-rc3~/drivers/ide/pci/siimage.c	2004-01-08 14:34:28.000000000 -0200
@@ -767,20 +767,17 @@
  
 static void proc_reports_siimage (struct pci_dev *dev, u8 clocking, const char *name)
 {
-	if(pdev_is_sata(dev))
-		goto sata_skip;
-
-	printk(KERN_INFO "%s: BASE CLOCK ", name);
-	clocking &= 0x03;
-	switch(clocking) {
-		case 0x03: printk("DISABLED !\n"); break;
-		case 0x02: printk("= 2X PCI \n"); break;
-		case 0x01: printk("= 133 \n"); break;
-		case 0x00: printk("= 100 \n"); break;
+	if(!pdev_is_sata(dev)) {
+		printk(KERN_INFO "%s: BASE CLOCK ", name);
+		clocking &= 0x03;
+		switch(clocking) {
+			case 0x03: printk("DISABLED !\n"); break;
+			case 0x02: printk("= 2X PCI \n"); break;
+			case 0x01: printk("= 133 \n"); break;
+			case 0x00: printk("= 100 \n"); break;
+		}
 	}
 
-sata_skip:
-
 #if defined(DISPLAY_SIIMAGE_TIMINGS) && defined(CONFIG_PROC_FS)
 	siimage_devs[n_siimage_devs++] = dev;
 

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
