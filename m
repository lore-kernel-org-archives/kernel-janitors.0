From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:11:21 +0000
Subject: [KJ] [PATCH 10/18] remove pci_find_{device, subsys}
Message-Id: <200502141129.22609.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12832391121742548=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12832391121742548==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/parport/parport_pc.c linux-2.6.11-rc3/drivers/parport/parport_pc.c
--- orig/drivers/parport/parport_pc.c	2005-02-11 15:19:51.000000000 +0530
+++ linux-2.6.11-rc3/drivers/parport/parport_pc.c	2005-02-14 02:27:04.000000000 +0530
@@ -2966,7 +2966,7 @@ static int __init parport_pc_init_superi
 	struct pci_dev *pdev = NULL;
 	int ret = 0;
 
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		id = pci_match_device (parport_pc_pci_tbl, pdev);
 		if (id == NULL || id->driver_data >= last_sio)
 			continue;


--===============12832391121742548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12832391121742548==--
