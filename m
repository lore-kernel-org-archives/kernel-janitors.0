From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:14:00 +0000
Subject: [KJ] [PATCH 14/16] drivers/net/via-rhine: Use the DMA_{64,
Message-Id: <20050214151400.GQ15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12592490190622985=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12592490190622985==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/via-rhine.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/via-rhine.c	2005-02-13 17:39:39.000000000 +0100
@@ -740,7 +740,7 @@ static int __devinit rhine_init_one(stru
 		goto err_out;
 
 	/* this should always be supported */
-	rc = pci_set_dma_mask(pdev, 0xffffffff);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc) {
 		printk(KERN_ERR "32-bit PCI DMA addresses not supported by "
 		       "the card!?\n");

--===============12592490190622985==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12592490190622985==--
