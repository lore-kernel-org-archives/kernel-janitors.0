From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:49 +0000
Subject: [Kernel-janitors] [patch 12/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190049.059531ED44@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24155407134919282=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24155407134919282==

--- kjt2/drivers/pci/setup-bus.c	2004-08-20 18:58:50.000000000 +0200
+++ kjt2-lfe/drivers/pci/setup-bus.c	2004-08-20 19:36:30.000000000 +0200
@@ -533,16 +533,16 @@
 void __init
 pci_assign_unassigned_resources(void)
 {
-	struct list_head *ln;
+	struct pci_bus *bus;
 
 	/* Depth first, calculate sizes and alignments of all
 	   subordinate buses. */
-	list_for_each(ln, &pci_root_buses) {
-		pci_bus_size_bridges(pci_bus_b(ln));
+	list_for_each_entry(bus, &pci_root_buses, node) {
+		pci_bus_size_bridges(bus);
 	}
 	/* Depth last, allocate resources and update the hardware. */
-	list_for_each(ln, &pci_root_buses) {
-		pci_bus_assign_resources(pci_bus_b(ln));
-		pci_enable_bridges(pci_bus_b(ln));
+	list_for_each_entry(bus, &pci_root_buses, node) {
+		pci_bus_assign_resources(bus);
+		pci_enable_bridges(bus);
 	}
 }

--===============24155407134919282==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24155407134919282==--
