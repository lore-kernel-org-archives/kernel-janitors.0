From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:14:48 +0000
Subject: [KJ] [PATCH 15/16] drivers/net/wan/wanxl: Use the DMA_{64,
Message-Id: <20050214151448.GR15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49531622497905337=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49531622497905337==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/wan/wanxl.c	2005-02-13 17:13:00.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/wan/wanxl.c	2005-02-13 17:53:11.000000000 +0100
@@ -630,8 +630,8 @@ static int __devinit wanxl_pci_init_one(
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

--===============49531622497905337==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49531622497905337==--
