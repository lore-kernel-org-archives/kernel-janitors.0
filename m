From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:43 +0000
Subject: [Kernel-janitors] [patch 9/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190043.EB1181ED3E@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46580108312028035=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46580108312028035==

--- kjt2/arch/sparc/kernel/pcic.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/sparc/kernel/pcic.c	2004-08-20 20:30:06.000000000 +0200
@@ -607,7 +607,7 @@
  */
 void __init pcibios_fixup_bus(struct pci_bus *bus)
 {
-	struct list_head *walk;
+	struct pci_dev *dev;
 	int i, has_io, has_mem;
 	unsigned int cmd;
 	struct linux_pcic *pcic;
@@ -629,8 +629,7 @@
 		return;
 	}
 
-	list_for_each(walk, &bus->devices) {
-		struct pci_dev *dev = pci_dev_b(walk);
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 
 		/*
 		 * Comment from i386 branch:

--===============46580108312028035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46580108312028035==--
