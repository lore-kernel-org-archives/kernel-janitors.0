From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:44 +0000
Subject: [Kernel-janitors] [patch 10/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190044.BC88A1ED3F@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27992455324954957=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27992455324954957==

--- kjt2/arch/sparc64/kernel/pci_common.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/sparc64/kernel/pci_common.c	2004-08-20 20:25:42.000000000 +0200
@@ -15,11 +15,9 @@
  */
 void __init pci_fixup_host_bridge_self(struct pci_bus *pbus)
 {
-	struct list_head *walk;
-
-	list_for_each(walk, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
+	struct pci_dev *pdev;
 
+	list_for_each_entry(pdev, &pbus->devices, bus_list) {
 		if (pdev->class >> 8 == PCI_CLASS_BRIDGE_HOST) {
 			pbus->self = pdev;
 			return;
@@ -214,18 +212,15 @@
 				    struct pci_pbm_info *pbm,
 				    int prom_node)
 {
-	struct list_head *walk, *walk_next;
+	struct pci_dev *pdev, *pdev_next;
+	struct pci_bus *this_pbus, *pbus_next;
 
 	/* This must be _safe because the cookie fillin
 	   routine can delete devices from the tree.  */
-	list_for_each_safe(walk, walk_next, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
-
+	list_for_each_entry_safe(pdev, pdev_next, &pbus->devices, bus_list)
 		pdev_cookie_fillin(pbm, pdev, prom_node);
-	}
 
-	list_for_each_safe(walk, walk_next, &pbus->children) {
-		struct pci_bus *this_pbus = pci_bus_b(walk);
+	list_for_each_entry_safe(this_pbus, pbus_next, &pbus->children, node) {
 		struct pcidev_cookie *pcp = this_pbus->self->sysdata;
 
 		pci_fill_in_pbm_cookies(this_pbus, pbm, pcp->prom_node);
@@ -418,13 +413,14 @@
 void __init pci_record_assignments(struct pci_pbm_info *pbm,
 				   struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *dev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices)
-		pdev_record_assignments(pbm, pci_dev_b(walk));
+	list_for_each_entry(dev, &pbus->devices, bus_list)
+		pdev_record_assignments(pbm, dev);
 
-	list_for_each(walk, &pbus->children)
-		pci_record_assignments(pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_record_assignments(pbm, bus);
 }
 
 /* Return non-zero if PDEV has implicit I/O resources even
@@ -535,13 +531,14 @@
 void __init pci_assign_unassigned(struct pci_pbm_info *pbm,
 				  struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *dev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices)
-		pdev_assign_unassigned(pbm, pci_dev_b(walk));
+	list_for_each_entry(dev, &pbus->devices, bus_list)
+		pdev_assign_unassigned(pbm, dev);
 
-	list_for_each(walk, &pbus->children)
-		pci_assign_unassigned(pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_assign_unassigned(pbm, bus);
 }
 
 static int __init pci_intmap_match(struct pci_dev *pdev, unsigned int *interrupt)
@@ -782,13 +779,14 @@
 void __init pci_fixup_irq(struct pci_pbm_info *pbm,
 			  struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *dev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices)
-		pdev_fixup_irq(pci_dev_b(walk));
+	list_for_each_entry(dev, &pbus->devices, bus_list)
+		pdev_fixup_irq(dev);
 
-	list_for_each(walk, &pbus->children)
-		pci_fixup_irq(pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_fixup_irq(pbm, bus);
 }
 
 static void pdev_setup_busmastering(struct pci_dev *pdev, int is_66mhz)
@@ -881,7 +879,7 @@
 void pci_determine_66mhz_disposition(struct pci_pbm_info *pbm,
 				     struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *pdev;
 	int all_are_66mhz;
 	u16 status;
 
@@ -891,9 +889,7 @@
 	}
 
 	all_are_66mhz = 1;
-	list_for_each(walk, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
-
+	list_for_each_entry(pdev, &pbus->devices, bus_list) {
 		pci_read_config_word(pdev, PCI_STATUS, &status);
 		if (!(status & PCI_STATUS_66MHZ)) {
 			all_are_66mhz = 0;
@@ -912,16 +908,17 @@
 void pci_setup_busmastering(struct pci_pbm_info *pbm,
 			    struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *dev;
+	struct pci_bus *bus;
 	int is_66mhz;
 
 	is_66mhz = pbm->is_66mhz_capable && pbm->all_devs_66mhz;
 
-	list_for_each(walk, &pbus->devices)
-		pdev_setup_busmastering(pci_dev_b(walk), is_66mhz);
+	list_for_each_entry(dev, &pbus->devices, bus_list)
+		pdev_setup_busmastering(dev, is_66mhz);
 
-	list_for_each(walk, &pbus->children)
-		pci_setup_busmastering(pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_setup_busmastering(pbm, bus);
 }
 
 void pci_register_legacy_regions(struct resource *io_res,
@@ -969,10 +966,10 @@
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *pdev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
+	list_for_each_entry(pdev, &pbus->devices, bus_list) {
 		u16 status, error_bits;
 
 		pci_read_config_word(pdev, PCI_STATUS, &status);
@@ -987,18 +984,18 @@
 		}
 	}
 
-	list_for_each(walk, &pbus->children)
-		pci_scan_for_target_abort(p, pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_scan_for_target_abort(p, pbm, bus);
 }
 
 void pci_scan_for_master_abort(struct pci_controller_info *p,
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *pdev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
+	list_for_each_entry(pdev, &pbus->devices, bus_list) {
 		u16 status, error_bits;
 
 		pci_read_config_word(pdev, PCI_STATUS, &status);
@@ -1012,18 +1009,18 @@
 		}
 	}
 
-	list_for_each(walk, &pbus->children)
-		pci_scan_for_master_abort(p, pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_scan_for_master_abort(p, pbm, bus);
 }
 
 void pci_scan_for_parity_error(struct pci_controller_info *p,
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk;
+	struct pci_dev *pdev;
+	struct pci_bus *bus;
 
-	list_for_each(walk, &pbus->devices) {
-		struct pci_dev *pdev = pci_dev_b(walk);
+	list_for_each_entry(pdev, &pbus->devices, bus_list) {
 		u16 status, error_bits;
 
 		pci_read_config_word(pdev, PCI_STATUS, &status);
@@ -1038,6 +1035,6 @@
 		}
 	}
 
-	list_for_each(walk, &pbus->children)
-		pci_scan_for_parity_error(p, pbm, pci_bus_b(walk));
+	list_for_each_entry(bus, &pbus->children, node)
+		pci_scan_for_parity_error(p, pbm, bus);
 }

--===============27992455324954957==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27992455324954957==--
