From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 23 Jan 2004 16:09:18 +0000
Subject: [Kernel-janitors] [PATCH] Fix warning in drivers/ide/pci/triflex.c
Message-Id: <1074874158.5269.3.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi all,

this patch fixes this warning:

drivers/ide/pci/triflex.c:49: warning: `triflex_get_info' defined but not used

here is:

diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/ide/pci/triflex.c linux-2.6.2-rc2~/drivers/ide/pci/triflex.c
--- linux-2.6.2-rc2/drivers/ide/pci/triflex.c	2003-10-08 16:24:04.000000000 -0300
+++ linux-2.6.2-rc2~/drivers/ide/pci/triflex.c	2004-01-26 11:02:33.000000000 -0200
@@ -45,6 +45,7 @@
 
 static struct pci_dev *triflex_dev;
 
+#ifdef CONFIG_PROC_FS
 static int triflex_get_info(char *buf, char **addr, off_t offset, int count)
 {
 	char *p = buf;
@@ -91,6 +92,7 @@
 	
 	return len > count ? count : len;
 }
+#endif
 
 static int triflex_tune_chipset(ide_drive_t *drive, u8 xferspeed)
 {
diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/ide/pci/triflex.h linux-2.6.2-rc2~/drivers/ide/pci/triflex.h
--- linux-2.6.2-rc2/drivers/ide/pci/triflex.h	2003-10-08 16:24:26.000000000 -0300
+++ linux-2.6.2-rc2~/drivers/ide/pci/triflex.h	2004-01-26 11:02:33.000000000 -0200
@@ -14,8 +14,16 @@
 
 static unsigned int __devinit init_chipset_triflex(struct pci_dev *, const char *);
 static void init_hwif_triflex(ide_hwif_t *);
+#ifdef CONFIG_PROC_FS
 static int triflex_get_info(char *, char **, off_t, int);
 
+static ide_pci_host_proc_t triflex_proc __initdata = {
+	.name		= "triflex",
+	.set		= 1,
+	.get_info 	= triflex_get_info,
+};
+#endif
+
 static ide_pci_device_t triflex_devices[] __devinitdata = {
 	{
 		.vendor 	= PCI_VENDOR_ID_COMPAQ,
@@ -33,14 +41,6 @@
 	}
 };
 
-#ifdef CONFIG_PROC_FS
-static ide_pci_host_proc_t triflex_proc __initdata = {
-	.name		= "triflex",
-	.set		= 1,
-	.get_info 	= triflex_get_info,
-};
-#endif
-
 static struct pci_device_id triflex_pci_tbl[] = {
 	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE, PCI_ANY_ID, 
 		PCI_ANY_ID, 0, 0, 0 },

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
