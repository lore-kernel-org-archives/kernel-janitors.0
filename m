From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:19 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111119.GA3475@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2559747567957058=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============2559747567957058==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replace for with more readable list_for_each.
Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/i386/pci/i386.c	Wed Jun 16 07:19:02 2004
+++ list_for_each/arch/i386/pci/i386.c	Thu Aug 15 17:58:22 2002
@@ -103,7 +103,7 @@
 	struct resource *r, *pr;
 
 	/* Depth-First Search on bus tree */
-	for (ln=bus_list->next; ln != bus_list; ln=ln->next) {
+	list_for_each(ln, bus_list) {
 		bus = pci_bus_b(ln);
 		if ((dev = bus->self)) {
 			for (idx = PCI_BRIDGE_RESOURCES; idx < PCI_NUM_RESOURCES; idx++) {

--===============2559747567957058==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2559747567957058==--
