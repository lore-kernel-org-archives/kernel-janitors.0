From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:43 +0000
Subject: [Kernel-janitors] [patch 8/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190043.3B1E01ED3D@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30740668996267506=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30740668996267506==

--- kjt2/arch/ppc64/kernel/pci_dn.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ppc64/kernel/pci_dn.c	2004-08-20 20:03:51.000000000 +0200
@@ -196,11 +196,9 @@
 
 static void __init pci_fixup_bus_sysdata_list(struct list_head *bus_list)
 {
-	struct list_head *ln;
 	struct pci_bus *bus;
 
-	list_for_each(ln, bus_list) {
-		bus = pci_bus_b(ln);
+	list_for_each_entry(bus, bus_list, node) {
 		if (bus->self)
 			bus->sysdata = bus->self->sysdata;
 		pci_fixup_bus_sysdata_list(&bus->children);

--===============30740668996267506==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30740668996267506==--
