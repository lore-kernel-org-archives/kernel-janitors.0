From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:24 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111124.GA3511@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14707970114907054=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============14707970114907054==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc64/kernel/pci_dn.c	Sat Aug 14 10:57:26 2004
+++ list_for_each/arch/ppc64/kernel/pci_dn.c	Wed Aug 18 17:22:35 2004
@@ -199,7 +199,7 @@
 	struct list_head *ln;
 	struct pci_bus *bus;
 
-	for (ln = bus_list->next; ln != bus_list; ln = ln->next) {
+	list_for_each(ln, bus_list) {
 		bus = pci_bus_b(ln);
 		if (bus->self)
 			bus->sysdata = bus->self->sysdata;

--===============14707970114907054==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14707970114907054==--
