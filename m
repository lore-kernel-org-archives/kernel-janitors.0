From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 17:11:11 +0000
Subject: [KJ] [PATCH 16/19] drivers/scsi/nsp32: Use the DMA_{64,
Message-Id: <20050220171111.GQ14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43501755510512585=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============43501755510512585==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/nsp32.c	2005-02-13 17:13:07.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/nsp32.c	2005-02-16 21:30:52.000000000 +0100
@@ -2779,7 +2779,7 @@ static int nsp32_detect(Scsi_Host_Templa
 	/*
 	 * setup DMA 
 	 */
-	if (pci_set_dma_mask(PCIDEV, 0xffffffffUL) != 0) {
+	if (pci_set_dma_mask(PCIDEV, DMA_32BIT_MASK) != 0) {
 		nsp32_msg (KERN_ERR, "failed to set PCI DMA mask");
 		goto scsi_unregister;
 	}

--===============43501755510512585==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43501755510512585==--
