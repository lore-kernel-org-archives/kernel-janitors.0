From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:51 +0000
Subject: [KJ] [PATCH] [7/29] trident_main.c - vfree() checking cleanups
Message-Id: <41db1123.54305500.2568.07b4@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30811423701168161=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30811423701168161==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

trident_main.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 trident_main.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/sound/pci/trident/trident_main.c	2004-12-24 13:35:01.000000000 -0800
+++ linux-2.6.10/sound/pci/trident/trident_main.c	2005-01-04 11:21:37.997202616 -0800
@@ -3679,8 +3679,7 @@
 			snd_util_memhdr_free(trident->tlb.memhdr);
 		if (trident->tlb.silent_page.area)
 			snd_dma_free_pages(&trident->tlb.silent_page);
-		if (trident->tlb.shadow_entries)
-			vfree(trident->tlb.shadow_entries);
+		vfree(trident->tlb.shadow_entries);
 		snd_dma_free_pages(&trident->tlb.buffer);
 	}
 	if (trident->irq >


--===============30811423701168161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30811423701168161==--
