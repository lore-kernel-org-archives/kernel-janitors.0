From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 16:54:20 +0000
Subject: [KJ] [PATCH 03/19] drivers/scsi/aacraid/linit: Use the DMA_{64,
Message-Id: <20050220165420.GC14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2445918229570303=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============2445918229570303==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/aacraid/linit.c	2005-02-13 17:13:06.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/aacraid/linit.c	2005-02-16 21:26:46.000000000 +0100
@@ -545,8 +545,8 @@ static int __devinit aac_probe_one(struc
 	if (pci_enable_device(pdev))
 		goto out;
 
-	if (pci_set_dma_mask(pdev, 0xFFFFFFFFULL) || 
-			pci_set_consistent_dma_mask(pdev, 0xFFFFFFFFULL))
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK) || 
+			pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK))
 		goto out;
 	/*
 	 * If the quirk31 bit is set, the adapter needs adapter
@@ -589,7 +589,7 @@ static int __devinit aac_probe_one(struc
 	 * address space.
 	 */
 	if (aac_drivers[index].quirks & AAC_QUIRK_31BIT)
-		if (pci_set_dma_mask(pdev, 0xFFFFFFFFULL))
+		if (pci_set_dma_mask(pdev, DMA_32BIT_MASK))
 			goto out_free_fibs;
 
 	aac_get_adapter_info(aac);

--===============2445918229570303==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2445918229570303==--
