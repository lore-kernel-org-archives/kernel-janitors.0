From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 19:58:29 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 alim15x3.c] [3/8] Replace
Message-Id: <13230000.1096487909@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14611023626525377=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, hannal@us.ibm.com, greg@kroah.com, B.Zolnierkiewicz@elka.pw.edu.pl, andre@linux-ide.org

--===============14611023626525377==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


The dev returned from pci_find_device was not used so it can be replaced
with pci_dev_present. Has been compile tested.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/ide/pci/alim15x3.c linux-2.6.9-rc2-mm4-patch2/drivers/ide/pci/alim15x3.c
--- linux-2.6.9-rc2-mm4cln/drivers/ide/pci/alim15x3.c	2004-09-28 14:58:26.000000000 -0700
+++ linux-2.6.9-rc2-mm4-patch2/drivers/ide/pci/alim15x3.c	2004-09-29 12:43:49.472236824 -0700
@@ -874,9 +874,14 @@ static ide_pci_device_t ali15x3_chipset 
  
 static int __devinit alim15x3_init_one(struct pci_dev *dev, const struct pci_device_id *id)
 {
+	static struct pci_device_id ati_rs100[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RS100) },
+		{ },
+	};
+
 	ide_pci_device_t *d = &ali15x3_chipset;
 
-	if(pci_find_device(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RS100, NULL))
+	if(pci_dev_present(ati_rs100))
 		printk(KERN_ERR "Warning: ATI Radeon IGP Northbridge is not yet fully tested.\n");
 
 #if defined(CONFIG_SPARC64)


--===============14611023626525377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14611023626525377==--
