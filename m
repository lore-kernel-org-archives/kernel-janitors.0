From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:46:28 +0000
Subject: [KJ] [UPDATE PATCH 15/16] drivers/net/wan/wanxl: Use the
Message-Id: <20050319214628.GO3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83355665695889813=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83355665695889813==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/net/wan/wanxl.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/wan/wanxl.c	2005-03-19 20:33:01.000000000 +0100
@@ -26,6 +26,7 @@
 #include <linux/netdevice.h>
 #include <linux/hdlc.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <asm/io.h>
 #include <asm/delay.h>
 
@@ -630,8 +631,8 @@ static int __devinit wanxl_pci_init_one(
 	/* FIXME when PCI/DMA subsystems are fixed.
 	   We set both dma_mask and consistent_dma_mask back to 32 bits
 	   to indicate the card can do 32-bit DMA addressing */
-	if (pci_set_consistent_dma_mask(pdev, 0xFFFFFFFF) ||
-	    pci_set_dma_mask(pdev, 0xFFFFFFFF)) {
+	if (pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK) ||
+	    pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_ERR "wanXL: No usable DMA configuration\n");
 		wanxl_pci_remove_one(pdev);
 		return -EIO;

--===============83355665695889813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83355665695889813==--
