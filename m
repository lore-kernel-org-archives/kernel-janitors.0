From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:21 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111121.GA3487@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51217864993153794=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============51217864993153794==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	Wed Jul 14 19:14:46 2004
+++ list_for_each/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	Thu Aug 15 17:58:22 2002
@@ -863,7 +863,7 @@
 	/*
 	 * Initialize the pci bus vertex in the pci_bus struct.
 	 */
-	for( ln = pci_root_buses.next; ln != &pci_root_buses; ln = ln->next) {
+	list_for_each(ln, &pci_root_buses) {
 		pci_bus = pci_bus_b(ln);
 		ret = sn_pci_fixup_bus(pci_bus);
 		if ( ret ) {

--===============51217864993153794==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51217864993153794==--
