From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:29 +0000
Subject: [KJ] [PATCH][10/26] drivers/media/video/* - compile warning cleanup
Message-Id: <420BEF85.16662.5877B4@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92711765241103505=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92711765241103505==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - Add MODULE definition compile 
fence so MODULE_DEVICE_TABLE vars not declared when compiled into the 
kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/media/video/zoran_card.c linux-2.6.11-rc3-mm/drivers/media/video/zoran_card.c
--- linux-2.6.11-rc3-mm-original/drivers/media/video/zoran_card.c	2005-02-03 03:55:53.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/media/video/zoran_card.c	2005-02-07 15:30:42.000000000 +0200
@@ -145,12 +145,14 @@ MODULE_DESCRIPTION("Zoran-36057/36067 JP
 MODULE_AUTHOR("Serguei Miridonov");
 MODULE_LICENSE("GPL");
 
+#ifdef MODULE
 static struct pci_device_id zr36067_pci_tbl[] = {
 	{PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36057,
 	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{0}
 };
 MODULE_DEVICE_TABLE(pci, zr36067_pci_tbl);
+#endif
 
 #define dprintk(num, format, args...) \
 	do { \




--===============92711765241103505==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92711765241103505==--
