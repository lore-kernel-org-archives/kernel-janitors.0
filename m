From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:18:00 +0000
Subject: [KJ] [PATCH] [RESEND] [26/29] idt77252.c - vfree() checking cleanups
Message-Id: <auto-000001227504@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68904295635223844=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68904295635223844==

idt77252.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 idt77252.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)


--- linux-2.6.10-vanilla/drivers/atm/idt77252.c	2004-12-24 13:34:45.000000000 -0800
+++ linux-2.6.10/drivers/atm/idt77252.c	2005-01-04 11:27:04.338591184 -0800
@@ -3136,14 +3136,11 @@
 		}
 	}
 
-	if (card->soft_tst)
-		vfree(card->soft_tst);
+	vfree(card->soft_tst);
 
-	if (card->scd2vc)
-		vfree(card->scd2vc);
+	vfree(card->scd2vc);
 
-	if (card->vcs)
-		vfree(card->vcs);
+	vfree(card->vcs);
 
 	if (card->raw_cell_hnd) {
 		pci_free_consistent(card->pcidev, 2 * sizeof(u32),


--===============68904295635223844==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68904295635223844==--
