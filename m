From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:06:19 +0000
Subject: [KJ] [PATCH 4/16] drivers/net/hp100: Use the DMA_{64,
Message-Id: <20050214150619.GG15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4874520910844975=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4874520910844975==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/hp100.c	2005-02-13 17:13:01.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/hp100.c	2005-02-13 17:37:36.000000000 +0100
@@ -562,7 +562,7 @@ static int __init hp100_probe1(struct ne
 			 * Also, we can have EISA Busmaster cards (not tested),
 			 * so beware !!! - Jean II */
 			if((bus == HP100_BUS_PCI) &&
-			   (pci_set_dma_mask(pci_dev, 0xffffffff))) {
+			   (pci_set_dma_mask(pci_dev, DMA_32BIT_MASK))) {
 				/* Gracefully fallback to shared memory */
 				goto busmasterfail;
 			}

--===============4874520910844975==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4874520910844975==--
