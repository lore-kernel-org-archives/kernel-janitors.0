From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:26 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111126.GA3523@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============060371048316507636=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============060371048316507636==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replace for/while loops with list_for_each*.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/sparc64/kernel/pci_common.c	Wed Jun 16 07:19:02 2004
+++ list_for_each/arch/sparc64/kernel/pci_common.c	Thu Aug 15 17:58:22 2002
@@ -15,18 +15,15 @@
  */
 void __init pci_fixup_host_bridge_self(struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	walk = walk->next;
-	while (walk != &pbus->devices) {
+	list_for_each(walk, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 
 		if (pdev->class >> 8 == PCI_CLASS_BRIDGE_HOST) {
 			pbus->self = pdev;
 			return;
 		}
-
-		walk = walk->next;
 	}
 
 	prom_printf("PCI: Critical error, cannot find host bridge PDEV.\n");
@@ -217,31 +214,21 @@
 				    struct pci_pbm_info *pbm,
 				    int prom_node)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk, *walk_next;
 
-	/* This loop is coded like this because the cookie
-	 * fillin routine can delete devices from the tree.
-	 */
-	walk = walk->next;
-	while (walk != &pbus->devices) {
+	/* This must be _safe because the cookie fillin
+	   routine can delete devices from the tree.  */
+	list_for_each_safe(walk, walk_next, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
-		struct list_head *walk_next = walk->next;
 
 		pdev_cookie_fillin(pbm, pdev, prom_node);
-
-		walk = walk_next;
 	}
 
-	walk = &pbus->children;
-	walk = walk->next;
-	while (walk != &pbus->children) {
+	list_for_each_safe(walk, walk_next, &pbus->children) {
 		struct pci_bus *this_pbus = pci_bus_b(walk);
 		struct pcidev_cookie *pcp = this_pbus->self->sysdata;
-		struct list_head *walk_next = walk->next;
 
 		pci_fill_in_pbm_cookies(this_pbus, pbm, pcp->prom_node);
-
-		walk = walk_next;
 	}
 }
 
@@ -431,13 +418,12 @@
 void __init pci_record_assignments(struct pci_pbm_info *pbm,
 				   struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next)
+	list_for_each(walk, &pbus->devices)
 		pdev_record_assignments(pbm, pci_dev_b(walk));
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_record_assignments(pbm, pci_bus_b(walk));
 }
 
@@ -549,13 +535,12 @@
 void __init pci_assign_unassigned(struct pci_pbm_info *pbm,
 				  struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next)
+	list_for_each(walk, &pbus->devices)
 		pdev_assign_unassigned(pbm, pci_dev_b(walk));
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_assign_unassigned(pbm, pci_bus_b(walk));
 }
 
@@ -797,13 +782,12 @@
 void __init pci_fixup_irq(struct pci_pbm_info *pbm,
 			  struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next)
+	list_for_each(walk, &pbus->devices)
 		pdev_fixup_irq(pci_dev_b(walk));
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_fixup_irq(pbm, pci_bus_b(walk));
 }
 
@@ -906,9 +890,8 @@
 		goto out;
 	}
 
-	walk = &pbus->devices;
 	all_are_66mhz = 1;
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next) {
+	list_for_each(walk, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 
 		pci_read_config_word(pdev, PCI_STATUS, &status);
@@ -929,16 +912,15 @@
 void pci_setup_busmastering(struct pci_pbm_info *pbm,
 			    struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 	int is_66mhz;
 
 	is_66mhz = pbm->is_66mhz_capable && pbm->all_devs_66mhz;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next)
+	list_for_each(walk, &pbus->devices)
 		pdev_setup_busmastering(pci_dev_b(walk), is_66mhz);
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_setup_busmastering(pbm, pci_bus_b(walk));
 }
 
@@ -987,9 +969,9 @@
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next) {
+	list_for_each(walk, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 		u16 status, error_bits;
 
@@ -1005,8 +987,7 @@
 		}
 	}
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_scan_for_target_abort(p, pbm, pci_bus_b(walk));
 }
 
@@ -1014,9 +995,9 @@
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next) {
+	list_for_each(walk, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 		u16 status, error_bits;
 
@@ -1031,8 +1012,7 @@
 		}
 	}
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_scan_for_master_abort(p, pbm, pci_bus_b(walk));
 }
 
@@ -1040,9 +1020,9 @@
 			       struct pci_pbm_info *pbm,
 			       struct pci_bus *pbus)
 {
-	struct list_head *walk = &pbus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &pbus->devices; walk = walk->next) {
+	list_for_each(walk, &pbus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 		u16 status, error_bits;
 
@@ -1058,7 +1038,6 @@
 		}
 	}
 
-	walk = &pbus->children;
-	for (walk = walk->next; walk != &pbus->children; walk = walk->next)
+	list_for_each(walk, &pbus->children)
 		pci_scan_for_parity_error(p, pbm, pci_bus_b(walk));
 }

--===============060371048316507636==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============060371048316507636==--
