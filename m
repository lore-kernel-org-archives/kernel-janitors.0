From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:29:02 +0000
Subject: [KJ] [UPDATE PATCH 5/16] drivers/net/ns83820: Use the DMA_{64,
Message-Id: <20050319212902.GE3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52513871022833358=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52513871022833358==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/net/ns83820.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/ns83820.c	2005-03-19 20:33:01.000000000 +0100
@@ -99,6 +99,7 @@
 #include <linux/moduleparam.h>
 #include <linux/types.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/delay.h>
@@ -1841,9 +1842,9 @@ static int __devinit ns83820_init_one(st
 	int using_dac = 0;
 
 	/* See if we can set the dma mask early on; failure is fatal. */
-	if (TRY_DAC && !pci_set_dma_mask(pci_dev, 0xffffffffffffffffULL)) {
+	if (TRY_DAC && !pci_set_dma_mask(pci_dev, DMA_64BIT_MASK)) {
 		using_dac = 1;
-	} else if (!pci_set_dma_mask(pci_dev, 0xffffffff)) {
+	} else if (!pci_set_dma_mask(pci_dev, DMA_32BIT_MASK)) {
 		using_dac = 0;
 	} else {
 		printk(KERN_WARNING "ns83820.c: pci_set_dma_mask failed!\n");

--===============52513871022833358==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52513871022833358==--
