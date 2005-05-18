From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 18 May 2005 18:18:43 +0000
Subject: [KJ] [PATCH] sound/pci/ca0106: Use the DMA_32BIT_MASK constant
Message-Id: <20050518181843.GC784@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============014868892676041412=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050514183143.GE14294@neon>
In-Reply-To: <20050514183143.GE14294@neon>
To: kernel-janitors@vger.kernel.org

--===============014868892676041412==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/sound/pci/ca0106/ca0106_main.c linux-2.6.12-rc4~dma_mask/sound/pci/ca0106/ca0106_main.c
--- linux-2.6.12-rc4/sound/pci/ca0106/ca0106_main.c	2005-05-07 21:56:52.000000000 +0200
+++ linux-2.6.12-rc4~dma_mask/sound/pci/ca0106/ca0106_main.c	2005-05-16 12:40:21.000000000 +0200
@@ -136,6 +136,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/moduleparam.h>
+#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
@@ -1003,8 +1004,8 @@ static int __devinit snd_ca0106_create(s
   
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (pci_set_dma_mask(pci, 0xffffffffUL) < 0 ||
-	    pci_set_consistent_dma_mask(pci, 0xffffffffUL) < 0) {
+	if (pci_set_dma_mask(pci, DMA_32BIT_MASK) < 0 ||
+	    pci_set_consistent_dma_mask(pci, DMA_32BIT_MASK) < 0) {
 		printk(KERN_ERR "error to set 32bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;

--===============014868892676041412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============014868892676041412==--
