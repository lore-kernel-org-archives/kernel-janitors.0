From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 17:13:31 +0000
Subject: [KJ] [PATCH 19/19] drivers/scsi/sata_vsc: Use the DMA_{64,
Message-Id: <20050220171331.GT14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91847492191518798=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============91847492191518798==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/sata_vsc.c	2005-02-13 17:13:07.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/sata_vsc.c	2005-02-16 21:25:01.000000000 +0100
@@ -280,10 +280,10 @@ static int __devinit vsc_sata_init_one (
 	/*
 	 * Use 32 bit DMA mask, because 64 bit address support is poor.
 	 */
-	rc = pci_set_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_regions;
-	rc = pci_set_consistent_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_regions;
 

--===============91847492191518798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91847492191518798==--
