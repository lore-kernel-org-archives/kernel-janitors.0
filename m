From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:49 +0000
Subject: [KJ] [PATCH] [RESEND] [16/29] emu10k1_main.c - vfree() checking
Message-Id: <auto-000001227495@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47323093859706811=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47323093859706811==

emu10k1_main.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 emu10k1_main.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/sound/pci/emu10k1/emu10k1_main.c	2004-12-24 13:35:39.000000000 -0800
+++ linux-2.6.10/sound/pci/emu10k1/emu10k1_main.c	2005-01-04 11:20:41.882733312 -0800
@@ -553,10 +553,8 @@
 		snd_dma_free_pages(&emu->silent_page);
 	if (emu->ptb_pages.area)
 		snd_dma_free_pages(&emu->ptb_pages);
-	if (emu->page_ptr_table)
-		vfree(emu->page_ptr_table);
-	if (emu->page_addr_table)
-		vfree(emu->page_addr_table);
+	vfree(emu->page_ptr_table);
+	vfree(emu->page_addr_table);
 	if (emu->irq >= 0)
 		free_irq(emu->irq, (void *)emu);
 	if (emu->port)


--===============47323093859706811==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47323093859706811==--
