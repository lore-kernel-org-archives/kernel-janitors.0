From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:30 +0000
Subject: [KJ] [PATCH][3/26] drivers/char/* - compile warning cleanup
Message-Id: <420BEF86.31360.587BBB@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013116875244254533=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============013116875244254533==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - Add MODULE definition compile 
fence so MODULE_DEVICE_TABLE vars not declared when compiled into the 
kernel.

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/char/applicom.c linux-2.6.11-rc3-mm/drivers/char/applicom.c
--- linux-2.6.11-rc3-mm-original/drivers/char/applicom.c	2005-02-03 03:56:48.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/applicom.c	2005-02-07 15:37:40.000000000 +0200
@@ -65,6 +65,7 @@ static char *applicom_pci_devnames[] = {
 	"PCI2000PFB"
 };
 
+#ifdef MODULE
 static struct pci_device_id applicom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_APPLICOM, PCI_DEVICE_ID_APPLICOM_PCIGENERIC,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
@@ -75,6 +76,7 @@ static struct pci_device_id applicom_pci
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, applicom_pci_tbl);
+#endif
 
 MODULE_AUTHOR("David Woodhouse & Applicom International");
 MODULE_DESCRIPTION("Driver for Applicom Profibus card");
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/char/sx.c linux-2.6.11-rc3-mm/drivers/char/sx.c
--- linux-2.6.11-rc3-mm-original/drivers/char/sx.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/sx.c	2005-02-07 15:37:10.000000000 +0200
@@ -252,11 +252,13 @@
 #endif
 
 #ifdef CONFIG_PCI
+#ifdef MODULE
 static struct pci_device_id sx_pci_tbl[] = {
 	{ PCI_VENDOR_ID_SPECIALIX, PCI_DEVICE_ID_SPECIALIX_SX_XIO_IO8, PCI_ANY_ID, PCI_ANY_ID },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, sx_pci_tbl);
+#endif
 #endif /* CONFIG_PCI */
 
 /* Configurable options: 




--===============013116875244254533==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013116875244254533==--
