From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:21:02 +0000
Subject: [KJ] [PATCH 11/18] drivers/pnp/ remove pci_find_{device, subsys}
Message-Id: <200502141139.03854.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0099162645729793386=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0099162645729793386==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


diff -uprN orig/drivers/pnp/resource.c linux-2.6.11-rc3/drivers/pnp/resource.c
--- orig/drivers/pnp/resource.c	2005-01-20 20:06:26.000000000 +0530
+++ linux-2.6.11-rc3/drivers/pnp/resource.c	2005-02-14 05:18:39.000000000 +0530
@@ -387,7 +387,7 @@ int pnp_check_irq(struct pnp_dev * dev, 
 	/* check if the resource is being used by a pci device */
 	if (!pnp_skip_pci_scan) {
 		struct pci_dev * pci = NULL;
-		while ((pci = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
+		while ((pci = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
 			if (pci->irq == *irq)
 				return 0;
 		}


--===============0099162645729793386==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0099162645729793386==--
