From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 25 Nov 2005 12:48:52 +0000
Subject: [KJ] [PATCH] sound/pci/au88x0: Remove unneeded call to
Message-Id: <20051125124852.GA7376@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12013188382484508=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12013188382484508==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

pci_dma_supported() is called right before pci_set_dma_mask() which
already calls pci_dma_supported(). The attached patch removes the
unneeded call to pci_dma_supported()

Additionally the custom VORTEX_DMA_MASK macro is replaced by
DMA_32BIT_MASK from linux/dma-mapping.h

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 sound/pci/au88x0/au88x0.c |    4 ++--
 sound/pci/au88x0/au88x0.h |    2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff -urpN -X dontdiff linux-2.6.15-rc2/sound/pci/au88x0/au88x0.c linux-2.6.15-rc2~dma_mask/sound/pci/au88x0/au88x0.c
--- linux-2.6.15-rc2/sound/pci/au88x0/au88x0.c	2005-11-20 13:27:41.000000000 +0100
+++ linux-2.6.15-rc2~dma_mask/sound/pci/au88x0/au88x0.c	2005-11-22 23:01:59.000000000 +0100
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
+#include <linux/dma-mapping.h>
 #include <sound/initval.h>
 
 // module parameters (see "Module Parameters")
@@ -150,11 +151,10 @@ snd_vortex_create(snd_card_t * card, str
 	// check PCI availability (DMA).
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (!pci_dma_supported(pci, VORTEX_DMA_MASK)) {
+	if (pci_set_dma_mask(pci, DMA_32BIT_MASK)) {
 		printk(KERN_ERR "error to set DMA mask\n");
 		return -ENXIO;
 	}
-	pci_set_dma_mask(pci, VORTEX_DMA_MASK);
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
diff -urpN -X dontdiff linux-2.6.15-rc2/sound/pci/au88x0/au88x0.h linux-2.6.15-rc2~dma_mask/sound/pci/au88x0/au88x0.h
--- linux-2.6.15-rc2/sound/pci/au88x0/au88x0.h	2005-11-20 13:27:41.000000000 +0100
+++ linux-2.6.15-rc2~dma_mask/sound/pci/au88x0/au88x0.h	2005-11-22 18:19:18.000000000 +0100
@@ -39,8 +39,6 @@
 #include "au88x0_wt.h"
 #endif
 
-#define	VORTEX_DMA_MASK	0xffffffff
-
 #define	hwread(x,y) readl((x)+((y)>>2))
 #define	hwwrite(x,y,z) writel((z),(x)+((y)>>2))
 

--===============12013188382484508==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12013188382484508==--
