From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 13:43:28 +0000
Subject: [KJ] [PATCH] drivers/ieee1394/pcilynx.c: Use the DMA_{64,
Message-Id: <20050308134328.GB5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75061458603553333=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75061458603553333==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/ieee1394/pcilynx.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/ieee1394/pcilynx.c	2005-03-03 11:47:35.000000000 +0100
@@ -1527,7 +1527,7 @@ static int __devinit add_card(struct pci
 
         error = -ENXIO;
 
-        if (pci_set_dma_mask(dev, 0xffffffff))
+        if (pci_set_dma_mask(dev, DMA_32BIT_MASK))
                 FAIL("DMA address limits not supported for PCILynx hardware");
         if (pci_enable_device(dev))
                 FAIL("failed to enable PCILynx hardware");

--===============75061458603553333==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75061458603553333==--
