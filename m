From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:07:46 +0000
Subject: [KJ] [PATCH 6/16] drivers/net/s2io: Use the DMA_{64,
Message-Id: <20050214150746.GI15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013710170992960791=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============013710170992960791==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/s2io.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/s2io.c	2005-02-13 17:47:07.000000000 +0100
@@ -4626,19 +4626,19 @@ s2io_init_nic(struct pci_dev *pdev, cons
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

--===============013710170992960791==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013710170992960791==--
