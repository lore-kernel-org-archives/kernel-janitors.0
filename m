From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:20 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each: arch-ia64-pci-pci.c
Message-Id: <20040819111120.GA3481@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53069038997612528=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============53069038997612528==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replace for with a more readable list_for_each.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ia64/pci/pci.c	Wed Jul 14 19:14:46 2004
+++ list_for_each/arch/ia64/pci/pci.c	Thu Aug 15 17:58:22 2002
@@ -364,7 +364,7 @@
 {
 	struct list_head *ln;
 
-	for (ln = b->devices.next; ln != &b->devices; ln = ln->next)
+	list_for_each(ln, &b->devices)
 		pcibios_fixup_device_resources(pci_dev_b(ln), b);
 
 	return;

--===============53069038997612528==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53069038997612528==--
