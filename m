From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 17:00:35 +0000
Subject: [KJ] [PATCH 06/19] drivers/scsi/aic7xxx/aic7xxx_osm: Use the
Message-Id: <20050220170035.GG14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20097258583718869=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============20097258583718869==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-13 17:13:06.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-16 21:07:01.000000000 +0100
@@ -1361,7 +1361,7 @@ ahc_dmamem_alloc(struct ahc_softc *ahc, 
 	 * our dma mask when doing allocations.
 	 */
 	if (ahc->dev_softc != NULL)
-		if (pci_set_dma_mask(ahc->dev_softc, 0xFFFFFFFF)) {
+		if (pci_set_dma_mask(ahc->dev_softc, DMA_32BIT_MASK)) {
 			printk(KERN_WARNING "aic7xxx: No suitable DMA available.\n");
 			kfree(map);
 			return (ENODEV);

--===============20097258583718869==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20097258583718869==--
