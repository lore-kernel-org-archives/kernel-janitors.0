From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:41 +0000
Subject: [Kernel-janitors] [patch 6/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190041.6FA991ED3B@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52780768587964833=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52780768587964833==

--- kjt2/arch/ppc64/kernel/pSeries_pci.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ppc64/kernel/pSeries_pci.c	2004-08-20 20:01:09.000000000 +0200
@@ -584,7 +584,7 @@
 void __devinit pcibios_fixup_bus(struct pci_bus *bus)
 {
 	struct pci_controller *hose = PCI_GET_PHB_PTR(bus);
-	struct list_head *ln;
+	struct pci_dev *dev;
 
 	/* XXX or bus->parent? */
 	struct pci_dev *dev = bus->self;
@@ -626,8 +626,7 @@
 	if (!pci_probe_only)
 		return;
 
-	list_for_each(ln, &bus->devices) {
-		struct pci_dev *dev = pci_dev_b(ln);
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 		if ((dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
 			pcibios_fixup_device_resources(dev, bus);
 	}

--===============52780768587964833==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52780768587964833==--
