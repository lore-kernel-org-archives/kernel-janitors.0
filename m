From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:39 +0000
Subject: [Kernel-janitors] [patch 4/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190039.056701ED39@trashy.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5850738194836258=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5850738194836258==

--- kjt2/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-08-20 18:58:55.000000000 +0200
+++ kjt2-lfe/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-08-20 19:59:24.000000000 +0200
@@ -816,7 +816,6 @@
 {
 	int i = 0;
 	struct pci_controller *controller;
-	struct list_head *ln;
 	struct pci_bus *pci_bus = NULL;
 	struct pci_dev *pci_dev = NULL;
 	int ret;
@@ -863,8 +862,7 @@
 	/*
 	 * Initialize the pci bus vertex in the pci_bus struct.
 	 */
-	list_for_each(ln, &pci_root_buses) {
-		pci_bus = pci_bus_b(ln);
+	list_for_each_entry(pci_bus, &pci_root_buses, node) {
 		ret = sn_pci_fixup_bus(pci_bus);
 		if ( ret ) {
 			printk(KERN_WARNING

--===============5850738194836258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5850738194836258==--
