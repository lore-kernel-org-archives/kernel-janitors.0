From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:24 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111124.GA3505@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39450206424848=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============39450206424848==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc64/kernel/pci.c	Wed Jun 16 07:19:52 2004
+++ list_for_each/arch/ppc64/kernel/pci.c	Thu Aug 15 17:58:22 2002
@@ -250,7 +250,7 @@
 	struct list_head *ld;
 	struct pci_bus *child_bus;
 
-	for (ld = b->devices.next; ld != &b->devices; ld = ld->next) {
+	list_for_each(ld, &b->devices) {
 		struct pci_dev *dev = pci_dev_b(ld);
 		int i;
 
@@ -272,7 +272,7 @@
 {
 	struct list_head *lb;
 
-	for (lb = pci_root_buses.next; lb != &pci_root_buses; lb = lb->next) {
+	list_for_each(lb, &pci_root_buses) {
 		struct pci_bus *b = pci_bus_b(lb);
 		pcibios_claim_one_bus(b);
 	}

--===============39450206424848==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39450206424848==--
