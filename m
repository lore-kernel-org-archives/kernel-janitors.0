From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:09:39 +0000
Subject: [KJ] [PATCH 8/16] drivers/net/sungem: Use the DMA_{64,
Message-Id: <20050214150939.GK15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63472507142455026=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63472507142455026==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/sungem.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/sungem.c	2005-02-13 17:44:29.000000000 +0100
@@ -2816,10 +2816,10 @@ static int __devinit gem_init_one(struct
 	 */
 	if (pdev->vendor == PCI_VENDOR_ID_SUN &&
 	    pdev->device == PCI_DEVICE_ID_SUN_GEM &&
-	    !pci_set_dma_mask(pdev, (u64) 0xffffffffffffffffULL)) {
+	    !pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		pci_using_dac = 1;
 	} else {
-		err = pci_set_dma_mask(pdev, (u64) 0xffffffff);
+		err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (err) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");

--===============63472507142455026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63472507142455026==--
