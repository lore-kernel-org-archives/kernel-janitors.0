From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:37 +0000
Subject: [Kernel-janitors] [patch 2/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190037.4EB321ED35@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6553185994993409=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6553185994993409==

--- kjt2/arch/i386/pci/i386.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/i386/pci/i386.c	2004-08-20 19:47:08.000000000 +0200
@@ -96,15 +96,13 @@
 
 static void __init pcibios_allocate_bus_resources(struct list_head *bus_list)
 {
-	struct list_head *ln;
 	struct pci_bus *bus;
 	struct pci_dev *dev;
 	int idx;
 	struct resource *r, *pr;
 
 	/* Depth-First Search on bus tree */
-	list_for_each(ln, bus_list) {
-		bus = pci_bus_b(ln);
+	list_for_each_entry(bus, bus_list, node) {
 		if ((dev = bus->self)) {
 			for (idx = PCI_BRIDGE_RESOURCES; idx < PCI_NUM_RESOURCES; idx++) {
 				r = &dev->resource[idx];

--===============6553185994993409==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6553185994993409==--
