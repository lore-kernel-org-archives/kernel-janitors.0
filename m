From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:18 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111118.GA3469@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11742912448213305=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11742912448213305==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Change for loops with list_for_each().

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/alpha/kernel/pci.c	Wed Jun 16 07:18:57 2004
+++ list_for_each/arch/alpha/kernel/pci.c	Thu Aug 15 17:58:22 2002
@@ -309,7 +309,7 @@
  		pcibios_fixup_device_resources(dev, bus);
 	} 
 
-	for (ln = bus->devices.next; ln != &bus->devices; ln = ln->next) {
+	list_for_each(ln, &bus->devices) {
 		struct pci_dev *dev = pci_dev_b(ln);
 
 		pdev_save_srm_config(dev);
@@ -411,7 +411,7 @@
 	struct list_head *ld;
 	struct pci_bus *child_bus;
 
-	for (ld = b->devices.next; ld != &b->devices; ld = ld->next) {
+	list_for_each(ld, &b->devices) {
 		struct pci_dev *dev = pci_dev_b(ld);
 		int i;
 
@@ -433,7 +433,7 @@
 {
 	struct list_head *lb;
 
-	for(lb = pci_root_buses.next; lb != &pci_root_buses; lb = lb->next) {
+	list_for_each(lb, &pci_root_buses) {
 		struct pci_bus *b = pci_bus_b(lb);
 		pcibios_claim_one_bus(b);
 	}

--===============11742912448213305==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11742912448213305==--
