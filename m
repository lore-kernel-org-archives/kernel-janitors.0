From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:15:25 +0000
Subject: [KJ] [PATCH 16/16] drivers/net/wireless/prism54/islpci_hotplug: Use
Message-Id: <20050214151525.GS15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58293322924761082=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58293322924761082==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-13 17:13:00.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-13 17:39:00.000000000 +0100
@@ -125,7 +125,7 @@ prism54_probe(struct pci_dev *pdev, cons
 	}
 
 	/* enable PCI DMA */
-	if (pci_set_dma_mask(pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_ERR "%s: 32-bit PCI DMA not supported", DRV_NAME);
 		goto do_pci_disable_device;
         }

--===============58293322924761082==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58293322924761082==--
