From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 14 May 2005 18:27:49 +0000
Subject: [KJ] [PATCH 4/4] sound/oss/via82cxxx_audio: Use the DMA_32BIT_MASK
Message-Id: <20050514182749.GD14294@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88922320354289686=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88922320354289686==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/sound/oss/via82cxxx_audio.c linux-2.6.12-rc4-tk/sound/oss/via82cxxx_audio.c
--- linux-2.6.12-rc4/sound/oss/via82cxxx_audio.c	2005-05-07 21:56:52.000000000 +0200
+++ linux-2.6.12-rc4-tk/sound/oss/via82cxxx_audio.c	2005-05-07 21:57:01.000000000 +0200
@@ -35,6 +35,7 @@
 #include <linux/smp_lock.h>
 #include <linux/ioport.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include <asm/semaphore.h>
@@ -3391,10 +3392,10 @@ static int __devinit via_init_one (struc
 	if (rc)
 		goto err_out_disable;
 
-	rc = pci_set_dma_mask(pdev, 0xffffffffULL);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_res;
-	rc = pci_set_consistent_dma_mask(pdev, 0xffffffffULL);
+	rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_res;
 

--===============88922320354289686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88922320354289686==--
