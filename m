From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:36 +0000
Subject: [Kernel-janitors] [patch 1/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190036.58D061ED32@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79801049216809972=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79801049216809972==

--- kjt2/arch/alpha/kernel/pci.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/alpha/kernel/pci.c	2004-08-20 19:45:27.000000000 +0200
@@ -285,7 +285,6 @@
 	/* Propagate hose info into the subordinate devices.  */
 
 	struct pci_controller *hose = bus->sysdata;
-	struct list_head *ln;
 	struct pci_dev *dev = bus->self;
 
 	if (!dev) {
@@ -309,9 +308,7 @@
  		pcibios_fixup_device_resources(dev, bus);
 	} 
 
-	list_for_each(ln, &bus->devices) {
-		struct pci_dev *dev = pci_dev_b(ln);
-
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 		pdev_save_srm_config(dev);
 		if ((dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
 			pcibios_fixup_device_resources(dev, bus);
@@ -408,11 +405,10 @@
 static void __init
 pcibios_claim_one_bus(struct pci_bus *b)
 {
-	struct list_head *ld;
+	struct pci_dev *dev;
 	struct pci_bus *child_bus;
 
-	list_for_each(ld, &b->devices) {
-		struct pci_dev *dev = pci_dev_b(ld);
+	list_for_each_entry(dev, &b->devices, bus_list) {
 		int i;
 
 		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
@@ -431,12 +427,10 @@
 static void __init
 pcibios_claim_console_setup(void)
 {
-	struct list_head *lb;
+	struct pci_bus *b;
 
-	list_for_each(lb, &pci_root_buses) {
-		struct pci_bus *b = pci_bus_b(lb);
+	list_for_each_entry(b, &pci_root_buses, node)
 		pcibios_claim_one_bus(b);
-	}
 }
 
 void __init

--===============79801049216809972==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79801049216809972==--
