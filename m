From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:10:30 +0000
Subject: [KJ] [PATCH 9/16] drivers/net/tg3: Use the DMA_{64,
Message-Id: <20050214151030.GL15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39873598974850433=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39873598974850433==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/tg3.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tg3.c	2005-02-13 17:43:14.000000000 +0100
@@ -8647,17 +8647,17 @@ static int __devinit tg3_init_one(struct
 	}
 
 	/* Configure DMA attributes. */
-	err = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+	err = pci_set_dma_mask(pdev, DMA_64BIT_MASK);
 	if (!err) {
 		pci_using_dac = 1;
-		err = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+		err = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
 		if (err < 0) {
 			printk(KERN_ERR PFX "Unable to obtain 64 bit DMA "
 			       "for consistent allocations\n");
 			goto err_out_free_res;
 		}
 	} else {
-		err = pci_set_dma_mask(pdev, 0xffffffffULL);
+		err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (err) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");

--===============39873598974850433==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39873598974850433==--
