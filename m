From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 31 Mar 2005 14:57:42 +0000
Subject: [KJ] [PATCH 1/2] atm/he: Use the DMA_32BIT_MASK constant
Message-Id: <20050331145742.GA19882@argon.bioc.unizh.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45099824975049407=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45099824975049407==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/atm/he.c linux-2.6.11/drivers/atm/he.c
--- linux-2.6.11.orig/drivers/atm/he.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/atm/he.c	2005-03-30 14:37:35.000000000 +0200
@@ -70,6 +70,7 @@
 #include <linux/sched.h>
 #include <linux/timer.h>
 #include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
 #include <asm/io.h>
 #include <asm/byteorder.h>
 #include <asm/uaccess.h>
@@ -371,7 +372,7 @@ he_init_one(struct pci_dev *pci_dev, con
 
 	if (pci_enable_device(pci_dev))
 		return -EIO;
-	if (pci_set_dma_mask(pci_dev, HE_DMA_MASK) != 0) {
+	if (pci_set_dma_mask(pci_dev, DMA_32BIT_MASK) != 0) {
 		printk(KERN_WARNING "he: no suitable dma available\n");
 		err = -EIO;
 		goto init_one_failure;

--===============45099824975049407==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45099824975049407==--
