From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:39 +0000
Subject: [Kernel-janitors] [patch 5/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190039.D72D51ED3A@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52008188470137573=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52008188470137573==

--- kjt2/arch/ppc/kernel/pci.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ppc/kernel/pci.c	2004-08-20 20:08:05.000000000 +0200
@@ -246,14 +246,12 @@
 static void __init
 pcibios_allocate_bus_resources(struct list_head *bus_list)
 {
-	struct list_head *ln;
 	struct pci_bus *bus;
 	int i;
 	struct resource *res, *pr;
 
 	/* Depth-First Search on bus tree */
-	list_for_each(ln, bus_list) {
-		bus = pci_bus_b(ln);
+	list_for_each_entry(bus, bus_list, node) {
 		for (i = 0; i < 4; ++i) {
 			if ((res = bus->resource[i]) == NULL || !res->flags
 			    || res->start > res->end)
@@ -396,7 +394,6 @@
 	struct pci_bus *bus;
 	struct pci_dev *dev;
 	struct resource *r;
-	struct list_head *ln;
 	int i;
 
 	for (r = pr->child; r != NULL; r = r->sibling) {
@@ -405,8 +402,7 @@
 			return 1;
 		}
 	}
-	list_for_each(ln, &parent->children) {
-		bus = pci_bus_b(ln);
+	list_for_each_entry(bus, &parent->children, node) {
 		for (i = 0; i < 4; ++i) {
 			if ((r = bus->resource[i]) == NULL)
 				continue;
@@ -420,8 +416,7 @@
 			}
 		}
 	}
-	list_for_each(ln, &parent->devices) {
-		dev = pci_dev_b(ln);
+	list_for_each_entry(dev, &parent->devices, bus_list) {
 		for (i = 0; i < 6; ++i) {
 			r = &dev->resource[i];
 			if (!r->flags || (r->flags & IORESOURCE_UNSET))
@@ -1116,7 +1111,7 @@
 static int __init
 check_for_io_childs(struct pci_bus *bus, struct resource* res, int *found_vga)
 {
-	struct list_head *ln;
+	struct pci_dev *dev;
 	int	i;
 	int	rc = 0;
 
@@ -1124,8 +1119,7 @@
 	res->end = ((res->end + __sz) / (__sz + 1)) * (__sz + 1) + __sz; \
     } while (0)
 
-	list_for_each(ln, &bus->devices) {
-		struct pci_dev *dev = pci_dev_b(ln);
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 		u16 class = dev->class >> 8;
 
 		if (class == PCI_CLASS_DISPLAY_VGA ||
@@ -1166,7 +1160,7 @@
 static void __init
 do_fixup_p2p_level(struct pci_bus *bus)
 {
-	struct list_head *ln;
+	struct pci_bus *b;
 	int i, parent_io;
 	int has_vga = 0;
 
@@ -1177,8 +1171,7 @@
 	if (parent_io >= 4)
 		return;
 
-	list_for_each(ln, &bus->children) {
-		struct pci_bus *b = pci_bus_b(ln);
+	list_for_each_entry(b, &bus->children, node) {
 		struct pci_dev *d = b->self;
 		struct pci_controller* hose = (struct pci_controller *)d->sysdata;
 		struct resource *res = b->resource[0];
@@ -1251,12 +1244,10 @@
 static void
 pcibios_fixup_p2p_bridges(void)
 {
-	struct list_head *ln;
+	struct pci_bus *b;
 
-	list_for_each(ln, &pci_root_buses) {
-		struct pci_bus *b = pci_bus_b(ln);
+	list_for_each_entry(b, &pci_root_buses, node)
 		do_fixup_p2p_level(b);
-	}
 }
 
 #endif /* CONFIG_PPC_PMAC */

--===============52008188470137573==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52008188470137573==--
