From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:31:13 +0000
Subject: [KJ] [UPDATE PATCH 6/16] drivers/net/s2io: Use the DMA_{64,
Message-Id: <20050319213113.GF3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24578650227620114=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24578650227620114==
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

--- linux-2.6.11.orig/drivers/net/s2io.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/s2io.c	2005-03-19 20:33:01.000000000 +0100
@@ -42,6 +42,7 @@
 #include<linux/errno.h>
 #include<linux/ioport.h>
 #include<linux/pci.h>
+#include<linux/dma-mapping.h>
 #include<linux/kernel.h>
 #include<linux/netdevice.h>
 #include<linux/etherdevice.h>
@@ -4631,19 +4632,19 @@ s2io_init_nic(struct pci_dev *pdev, cons
 		return ret;
 	}
 
-	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		DBG_PRINT(INIT_DBG, "s2io_init_nic: Using 64bit DMA\n");
 		dma_flag = TRUE;
 
 		if (pci_set_consistent_dma_mask
-		    (pdev, 0xffffffffffffffffULL)) {
+		    (pdev, DMA_64BIT_MASK)) {
 			DBG_PRINT(ERR_DBG,
 				  "Unable to obtain 64bit DMA for \
 					consistent allocations\n");
 			pci_disable_device(pdev);
 			return -ENOMEM;
 		}
-	} else if (!pci_set_dma_mask(pdev, 0xffffffffUL)) {
+	} else if (!pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		DBG_PRINT(INIT_DBG, "s2io_init_nic: Using 32bit DMA\n");
 	} else {
 		pci_disable_device(pdev);

--===============24578650227620114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24578650227620114==--
