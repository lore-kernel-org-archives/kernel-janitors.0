From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:29 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111129.GA3529@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94822859142217042=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============94822859142217042==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each//

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/sparc64/kernel/pci_sabre.c	Wed Jun 16 07:20:16 2004
+++ list_for_each/arch/sparc64/kernel/pci_sabre.c	Thu Aug 15 17:58:22 2002
@@ -1113,9 +1113,9 @@
 
 static void __init apb_init(struct pci_controller_info *p, struct pci_bus *sabre_bus)
 {
-	struct list_head *walk = &sabre_bus->devices;
+	struct list_head *walk;
 
-	for (walk = walk->next; walk != &sabre_bus->devices; walk = walk->next) {
+	list_for_each(walk, &sabre_bus->devices) {
 		struct pci_dev *pdev = pci_dev_b(walk);
 
 		if (pdev->vendor == PCI_VENDOR_ID_SUN &&
@@ -1217,8 +1217,7 @@
 
 	sabres_scanned = 0;
 
-	walk = &sabre_bus->children;
-	for (walk = walk->next; walk != &sabre_bus->children; walk = walk->next) {
+	list_for_each(walk, &sabre_bus->children) {
 		struct pci_bus *pbus = pci_bus_b(walk);
 
 		if (pbus->number == p->pbm_A.pci_first_busno) {

--===============94822859142217042==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94822859142217042==--
