From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:42 +0000
Subject: [Kernel-janitors] [patch 7/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190042.3FFE01ED3C@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============086246074409316531=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============086246074409316531==

--- kjt2/arch/ppc64/kernel/pci.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ppc64/kernel/pci.c	2004-08-20 20:03:05.000000000 +0200
@@ -247,11 +247,10 @@
 
 static void __init pcibios_claim_one_bus(struct pci_bus *b)
 {
-	struct list_head *ld;
+	struct pci_dev *dev;
 	struct pci_bus *child_bus;
 
-	list_for_each(ld, &b->devices) {
-		struct pci_dev *dev = pci_dev_b(ld);
+	list_for_each_entry(dev, &b->devices, bus_list) {
 		int i;
 
 		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
@@ -270,12 +269,10 @@
 #ifndef CONFIG_PPC_ISERIES
 static void __init pcibios_claim_of_setup(void)
 {
-	struct list_head *lb;
+	struct pci_bus *b;
 
-	list_for_each(lb, &pci_root_buses) {
-		struct pci_bus *b = pci_bus_b(lb);
+	list_for_each_entry(b, &pci_root_buses, node)
 		pcibios_claim_one_bus(b);
-	}
 }
 #endif
 

--===============086246074409316531==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============086246074409316531==--
