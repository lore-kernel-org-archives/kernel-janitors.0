From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:05:19 +0000
Subject: [KJ] [PATCH 3/16] drivers/net/e100: Use the DMA_{64,
Message-Id: <20050214150519.GF15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21990168634041973=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21990168634041973==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/e100.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/e100.c	2005-02-13 17:35:34.000000000 +0100
@@ -2201,7 +2201,7 @@ static int __devinit e100_probe(struct p
 		goto err_out_disable_pdev;
 	}
 
-	if((err = pci_set_dma_mask(pdev, 0xFFFFFFFFULL))) {
+	if((err = pci_set_dma_mask(pdev, DMA_32BIT_MASK))) {
 		DPRINTK(PROBE, ERR, "No usable DMA configuration, aborting.\n");
 		goto err_out_free_res;
 	}

--===============21990168634041973==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21990168634041973==--
