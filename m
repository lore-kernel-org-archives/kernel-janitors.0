From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:11:48 +0000
Subject: [KJ] [PATCH 11/16] drivers/net/tokenring/lanstreamer: Use the
Message-Id: <20050214151148.GN15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82103988962259145=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82103988962259145==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/tokenring/lanstreamer.c	2005-02-13 17:13:00.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tokenring/lanstreamer.c	2005-02-13 17:57:10.000000000 +0100
@@ -257,7 +257,7 @@ static int __devinit streamer_init_one(s
 #endif
 #endif
 
-	rc = pci_set_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc) {
 		printk(KERN_ERR "%s: No suitable PCI mapping available.\n",
 				dev->name);

--===============82103988962259145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82103988962259145==--
