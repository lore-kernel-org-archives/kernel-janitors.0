From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:47 +0000
Subject: [Kernel-janitors] [patch 11/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190047.3B7CC1ED41@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21214732613887644=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21214732613887644==

--- kjt2/arch/sparc64/kernel/pci_sabre.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/sparc64/kernel/pci_sabre.c	2004-08-20 20:28:57.000000000 +0200
@@ -1113,10 +1113,9 @@
 
 static void __init apb_init(struct pci_controller_info *p, struct pci_bus *sabre_bus)
 {
-	struct list_head *walk;
+	struct pci_dev *pdev;
 
-	list_for_each(walk, &sabre_bus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
+	list_for_each_entry(pdev, &sabre_bus->devices, bus_list) {
 
 		if (pdev->vendor == PCI_VENDOR_ID_SUN &&
 		    pdev->device == PCI_DEVICE_ID_SUN_SIMBA) {
@@ -1178,10 +1177,9 @@
 static void __init sabre_scan_bus(struct pci_controller_info *p)
 {
 	static int once;
-	struct pci_bus *sabre_bus;
+	struct pci_bus *sabre_bus, *pbus;
 	struct pci_pbm_info *pbm;
 	struct pcidev_cookie *cookie;
-	struct list_head *walk;
 	int sabres_scanned;
 
 	/* The APB bridge speaks to the Sabre host PCI bridge
@@ -1217,8 +1215,7 @@
 
 	sabres_scanned = 0;
 
-	list_for_each(walk, &sabre_bus->children) {
-		struct pci_bus *pbus = pci_bus_b(walk);
+	list_for_each_entry(pbus, &sabre_bus->children, node) {
 
 		if (pbus->number == p->pbm_A.pci_first_busno) {
 			pbm = &p->pbm_A;

--===============21214732613887644==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21214732613887644==--
