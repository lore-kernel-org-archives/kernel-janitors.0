From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 16:56:32 +0000
Subject: [KJ] [PATCH 05/19] drivers/scsi/aic7xxx/aic79xx_osm: Use the
Message-Id: <20050220165632.GE14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67535607018770039=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============67535607018770039==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-13 17:13:06.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-16 21:07:35.000000000 +0100
@@ -1706,7 +1706,7 @@ ahd_dmamem_alloc(struct ahd_softc *ahd, 
 	 * our dma mask when doing allocations.
 	 */
 	if (ahd->dev_softc != NULL)
-		if (pci_set_dma_mask(ahd->dev_softc, 0xFFFFFFFF)) {
+		if (pci_set_dma_mask(ahd->dev_softc, DMA_32BIT_MASK)) {
 			printk(KERN_WARNING "aic79xx: No suitable DMA available.\n");
 			kfree(map);
 			return (ENODEV);

--===============67535607018770039==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67535607018770039==--
