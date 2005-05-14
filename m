From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 14 May 2005 18:25:57 +0000
Subject: [KJ] [PATCH 3/4] sound/oss/es1371: Use the DMA_32BIT_MASK constant
Message-Id: <20050514182557.GC14294@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72867708353760041=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72867708353760041==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/sound/oss/es1371.c linux-2.6.12-rc4-tk/sound/oss/es1371.c
--- linux-2.6.12-rc4/sound/oss/es1371.c	2005-05-07 21:56:52.000000000 +0200
+++ linux-2.6.12-rc4-tk/sound/oss/es1371.c	2005-05-07 21:57:01.000000000 +0200
@@ -128,6 +128,7 @@
 #include <linux/ac97_codec.h>
 #include <linux/gameport.h>
 #include <linux/wait.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/page.h>
@@ -2804,7 +2805,7 @@ static int __devinit es1371_probe(struct
 		return -ENODEV;
 	if (pcidev->irq == 0) 
 		return -ENODEV;
-	i = pci_set_dma_mask(pcidev, 0xffffffff);
+	i = pci_set_dma_mask(pcidev, DMA_32BIT_MASK);
 	if (i) {
 		printk(KERN_WARNING "es1371: architecture does not support 32bit PCI busmaster DMA\n");
 		return i;

--===============72867708353760041==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72867708353760041==--
