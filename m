From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:13:22 +0000
Subject: [KJ] [PATCH 13/16] drivers/net/tulip/winbond-840: Use the DMA_{64,
Message-Id: <20050214151322.GP15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3332242638121572=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3332242638121572==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/tulip/winbond-840.c	2005-02-13 17:12:59.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tulip/winbond-840.c	2005-02-13 17:54:57.000000000 +0100
@@ -394,7 +394,7 @@ static int __devinit w840_probe1 (struct
 
 	irq = pdev->irq;
 
-	if (pci_set_dma_mask(pdev,0xFFFFffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "Winbond-840: Device %s disabled due to DMA limitations.\n",
 		       pci_name(pdev));
 		return -EIO;

--===============3332242638121572==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3332242638121572==--
