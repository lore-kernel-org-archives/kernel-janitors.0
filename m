From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:38 +0000
Subject: [Kernel-janitors] [patch 3/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190038.49C5B1ED38@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67793105357807293=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67793105357807293==

--- kjt2/arch/ia64/pci/pci.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ia64/pci/pci.c	2004-08-20 19:57:47.000000000 +0200
@@ -362,10 +362,10 @@
 void __devinit
 pcibios_fixup_bus (struct pci_bus *b)
 {
-	struct list_head *ln;
+	struct pci_dev *dev;
 
-	list_for_each(ln, &b->devices)
-		pcibios_fixup_device_resources(pci_dev_b(ln), b);
+	list_for_each_entry(dev, &b->devices, bus_list)
+		pcibios_fixup_device_resources(dev, b);
 
 	return;
 }

--===============67793105357807293==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67793105357807293==--
