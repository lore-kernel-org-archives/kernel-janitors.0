From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:22 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111122.GA3493@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83696968960797724=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============83696968960797724==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc/kernel/pci.c	Sat Aug 14 10:56:31 2004
+++ list_for_each/arch/ppc/kernel/pci.c	Wed Aug 18 17:15:40 2004
@@ -252,7 +252,7 @@
 	struct resource *res, *pr;
 
 	/* Depth-First Search on bus tree */
-	for (ln = bus_list->next; ln != bus_list; ln=ln->next) {
+	list_for_each(ln, bus_list) {
 		bus = pci_bus_b(ln);
 		for (i = 0; i < 4; ++i) {
 			if ((res = bus->resource[i]) == NULL || !res->flags
@@ -405,8 +405,7 @@
 			return 1;
 		}
 	}
-	for (ln = parent->children.next; ln != &parent->children;
-	     ln = ln->next) {
+	list_for_each(ln, &parent->children) {
 		bus = pci_bus_b(ln);
 		for (i = 0; i < 4; ++i) {
 			if ((r = bus->resource[i]) == NULL)
@@ -421,7 +420,7 @@
 			}
 		}
 	}
-	for (ln = parent->devices.next; ln != &parent->devices; ln=ln->next) {
+	list_for_each(ln, &parent->devices) {
 		dev = pci_dev_b(ln);
 		for (i = 0; i < 6; ++i) {
 			r = &dev->resource[i];
@@ -1125,7 +1124,7 @@
 	res->end = ((res->end + __sz) / (__sz + 1)) * (__sz + 1) + __sz; \
     } while (0)
 
-	for (ln=bus->devices.next; ln != &bus->devices; ln=ln->next) {
+	list_for_each(ln, &bus->devices) {
 		struct pci_dev *dev = pci_dev_b(ln);
 		u16 class = dev->class >> 8;
 
@@ -1178,7 +1177,7 @@
 	if (parent_io >= 4)
 		return;
 
-	for (ln=bus->children.next; ln != &bus->children; ln=ln->next) {
+	list_for_each(ln, &bus->children) {
 		struct pci_bus *b = pci_bus_b(ln);
 		struct pci_dev *d = b->self;
 		struct pci_controller* hose = (struct pci_controller *)d->sysdata;
@@ -1254,7 +1253,7 @@
 {
 	struct list_head *ln;
 
-	for(ln=pci_root_buses.next; ln != &pci_root_buses; ln=ln->next) {
+	list_for_each(ln, &pci_root_buses) {
 		struct pci_bus *b = pci_bus_b(ln);
 		do_fixup_p2p_level(b);
 	}

--===============83696968960797724==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83696968960797724==--
