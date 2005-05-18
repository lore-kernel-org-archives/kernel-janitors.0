From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 18 May 2005 18:17:08 +0000
Subject: [KJ] [PATCH] sound/oss/esssolo1: Use the DMA_32BIT_MASK constant
Message-Id: <20050518181708.GB784@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77086677406402815=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77086677406402815==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/sound/oss/esssolo1.c linux-2.6.12-rc4~dma_mask/sound/oss/esssolo1.c
--- linux-2.6.12-rc4/sound/oss/esssolo1.c	2005-05-07 21:54:03.000000000 +0200
+++ linux-2.6.12-rc4~dma_mask/sound/oss/esssolo1.c	2005-05-16 13:00:20.000000000 +0200
@@ -104,6 +104,7 @@
 #include <linux/smp_lock.h>
 #include <linux/gameport.h>
 #include <linux/wait.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/page.h>
@@ -2326,7 +2327,7 @@ static int __devinit solo1_probe(struct 
 	 * to 24 bits first, then 32 bits (playback only) if that fails.
 	 */
 	if (pci_set_dma_mask(pcidev, 0x00ffffff) &&
-	    pci_set_dma_mask(pcidev, 0xffffffff)) {
+	    pci_set_dma_mask(pcidev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "solo1: architecture does not support 24bit or 32bit PCI busmaster DMA\n");
 		return -ENODEV;
 	}

--===============77086677406402815==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77086677406402815==--
