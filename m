From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:11:16 +0000
Subject: [KJ] [PATCH 10/16] drivers/net/tlan: Use the DMA_{64,
Message-Id: <20050214151116.GM15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85425367574985822=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85425367574985822==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/tlan.c	2005-02-13 17:13:01.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tlan.c	2005-02-13 17:48:05.000000000 +0100
@@ -555,7 +555,7 @@ static int __devinit TLan_probe1(struct 
 
 		priv->adapter = &board_info[ent->driver_data];
 
-		rc = pci_set_dma_mask(pdev, 0xFFFFFFFF);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR "TLAN: No suitable PCI mapping available.\n");
 			goto err_out_free_dev;

--===============85425367574985822==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85425367574985822==--
