From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:04:30 +0000
Subject: [KJ] [PATCH 2/16] drivers/net/acenic: Use the DMA_{64,
Message-Id: <20050214150430.GE15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43687623897888161=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43687623897888161==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/acenic.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/acenic.c	2005-02-13 17:33:37.000000000 +0100
@@ -1167,9 +1167,9 @@ static int __devinit ace_init(struct net
 	/*
 	 * Configure DMA attributes.
 	 */
-	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		ap->pci_using_dac = 1;
-	} else if (!pci_set_dma_mask(pdev, 0xffffffffULL)) {
+	} else if (!pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		ap->pci_using_dac = 0;
 	} else {
 		ecode = -ENODEV;

--===============43687623897888161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43687623897888161==--
