From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 16 May 2005 08:56:59 +0000
Subject: [KJ] [PATCH] sound/oss/cmpci.c : Use the DMA_32BIT_MASK constant
Message-Id: <20050516085659.GD6103@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc4_sound_oss_cmpci.c.patch"

diff -urpNX dontdiff a/sound/oss/cmpci.c b/sound/oss/cmpci.c
--- a/sound/oss/cmpci.c	2005-05-07 07:20:31.000000000 +0200
+++ b/sound/oss/cmpci.c	2005-05-16 10:24:19.532667784 +0200
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

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--sdtB3X0nJg68CQEu--
