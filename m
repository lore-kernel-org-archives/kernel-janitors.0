From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:12:28 +0000
Subject: [KJ] [PATCH 12/16] drivers/net/tulip/dmfe: Use the DMA_{64,
Message-Id: <20050214151228.GO15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85902211727977518=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85902211727977518==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/tulip/dmfe.c	2005-02-13 17:12:59.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tulip/dmfe.c	2005-02-13 17:54:20.000000000 +0100
@@ -354,7 +354,7 @@ static int __devinit dmfe_init_one (stru
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
-	if (pci_set_dma_mask(pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING DRV_NAME ": 32-bit PCI DMA not available.\n");
 		err = -ENODEV;
 		goto err_out_free;

--===============85902211727977518==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85902211727977518==--
