From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 14 May 2005 18:21:45 +0000
Subject: [KJ] [PATCH 1/4] sound/oss/cmpci: Use the DMA_32BIT_MASK constant
Message-Id: <20050514182145.GA14294@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63482243834335095=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63482243834335095==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/sound/oss/cmpci.c linux-2.6.12-rc4-tk/sound/oss/cmpci.c
--- linux-2.6.12-rc4/sound/oss/cmpci.c	2005-05-07 21:56:52.000000000 +0200
+++ linux-2.6.12-rc4-tk/sound/oss/cmpci.c	2005-05-07 21:57:01.000000000 +0200
@@ -123,6 +123,7 @@
 #include <linux/smp_lock.h>
 #include <linux/bitops.h>
 #include <linux/wait.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/page.h>
@@ -3058,7 +3059,7 @@ static int __devinit cm_probe(struct pci
 		return -ENODEV;
 	if (pcidev->irq == 0)
 		return -ENODEV;
-	i = pci_set_dma_mask(pcidev, 0xffffffff);
+	i = pci_set_dma_mask(pcidev, DMA_32BIT_MASK);
 	if (i) {
 		printk(KERN_WARNING "cmpci: architecture does not support 32bit PCI busmaster DMA\n");
 		return i;

--===============63482243834335095==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63482243834335095==--
