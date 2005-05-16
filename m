From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 16 May 2005 08:59:02 +0000
Subject: [KJ] [PATCH] sound/pci/mixart/mixart.c : Use the DMA_32BIT_MASK
Message-Id: <20050516085902.GE6103@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i9LlY+UWpKt15+FH"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc4_sound_pci_mixart_mixart.c.patch"

diff -urpNX dontdiff a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
--- a/sound/pci/mixart/mixart.c	2005-05-07 07:20:31.000000000 +0200
+++ b/sound/pci/mixart/mixart.c	2005-05-16 10:28:04.998391784 +0200
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/moduleparam.h>
+#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/initval.h>
 #include <sound/info.h>
@@ -1284,7 +1285,7 @@ static int __devinit snd_mixart_probe(st
 	pci_set_master(pci);
 
 	/* check if we can restrict PCI DMA transfers to 32 bits */
-	if (pci_set_dma_mask(pci, 0xffffffff) < 0) {
+	if (pci_set_dma_mask(pci, DMA_32BIT_MASK) < 0) {
 		snd_printk(KERN_ERR "architecture does not support 32bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;

--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--i9LlY+UWpKt15+FH--
