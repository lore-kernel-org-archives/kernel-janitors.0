From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:08:54 +0000
Subject: [KJ] [PATCH 7/16] drivers/net/sk98lin/skge: Use the DMA_{64,
Message-Id: <20050214150854.GJ15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76562349884475478=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76562349884475478==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/sk98lin/skge.c	2005-02-13 17:13:00.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/sk98lin/skge.c	2005-02-13 17:58:29.000000000 +0100
@@ -4912,8 +4912,8 @@ static int __devinit skge_probe_one(stru
 		goto out;
  
 	/* Configure DMA attributes. */
-	if (pci_set_dma_mask(pdev, (u64) 0xffffffffffffffffULL) &&
-	    pci_set_dma_mask(pdev, (u64) 0xffffffff))
+	if (pci_set_dma_mask(pdev, DMA_64BIT_MASK) &&
+	    pci_set_dma_mask(pdev, DMA_32BIT_MASK))
 		goto out_disable_device;
 
 

--===============76562349884475478==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76562349884475478==--
