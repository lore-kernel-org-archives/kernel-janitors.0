From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:49:50 +0000
Subject: [KJ] [PATCH 2/18] drivers/atm/ remove pci_find_{device, subsys}
Message-Id: <200502141107.53021.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25340846675937856=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25340846675937856==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/atm/fore200e.c linux-2.6.11-rc3/drivers/atm/fore200e.c
--- orig/drivers/atm/fore200e.c	2005-02-11 15:19:41.000000000 +0530
+++ linux-2.6.11-rc3/drivers/atm/fore200e.c	2005-02-14 05:14:27.000000000 +0530
@@ -645,7 +645,7 @@ fore200e_pca_detect(const struct fore200
     int              count = index;
     
     do {
-	pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
+	pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
 	if (pci_dev == NULL)
 	    return NULL;
     } while (count--);


--===============25340846675937856==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25340846675937856==--
