From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Mon, 13 Jul 2020 14:44:53 +0000
Subject: [PATCH v2] staging: comedi: s626: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200713143253.GA14953@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
List-Id: <kernel-janitors.vger.kernel.org>
To: gregkh@linuxfoundation.org, abbotti@mev.co.uk, hsweeten@visionengravers.com, christophe.jaillet@wanadoo.fr
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The legacy API wrappers in include/linux/pci-dma-compat.h
should go away as it creates unnecessary midlayering
for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
APIs directly.

The patch has been generated with the coccinelle script below
and compile-tested.

@@@@
- PCI_DMA_BIDIRECTIONAL
+ DMA_BIDIRECTIONAL

@@@@
- PCI_DMA_TODEVICE
+ DMA_TO_DEVICE

@@@@
- PCI_DMA_FROMDEVICE
+ DMA_FROM_DEVICE

@@@@
- PCI_DMA_NONE
+ DMA_NONE

@@ expression E1, E2, E3; @@
- pci_alloc_consistent(E1, E2, E3)
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)

@@ expression E1, E2, E3; @@
- pci_zalloc_consistent(E1, E2, E3)
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)

@@ expression E1, E2, E3, E4; @@
- pci_free_consistent(E1, E2, E3, E4)
+ dma_free_coherent(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_single(E1, E2, E3, E4)
+ dma_map_single(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_single(E1, E2, E3, E4)
+ dma_unmap_single(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4, E5; @@
- pci_map_page(E1, E2, E3, E4, E5)
+ dma_map_page(&E1->dev, E2, E3, E4, (enum dma_data_direction)E5)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_page(E1, E2, E3, E4)
+ dma_unmap_page(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_sg(E1, E2, E3, E4)
+ dma_map_sg(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_sg(E1, E2, E3, E4)
+ dma_unmap_sg(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_cpu(E1, E2, E3, E4)
+ dma_sync_single_for_cpu(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_device(E1, E2, E3, E4)
+ dma_sync_single_for_device(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_cpu(E1, E2, E3, E4)
+ dma_sync_sg_for_cpu(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_device(E1, E2, E3, E4)
+ dma_sync_sg_for_device(&E1->dev, E2, E3, (enum dma_data_direction)E4)

@@ expression E1, E2; @@
- pci_dma_mapping_error(E1, E2)
+ dma_mapping_error(&E1->dev, E2)

@@ expression E1, E2; @@
- pci_set_consistent_dma_mask(E1, E2)
+ dma_set_coherent_mask(&E1->dev, E2)

@@ expression E1, E2; @@
- pci_set_dma_mask(E1, E2)
+ dma_set_mask(&E1->dev, E2)

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
Changes:
	v2: Converted the GFP_ATOMIC flag to GFP_KERNEL to suit for the
	context. On reviewer's advise.

 drivers/staging/comedi/drivers/s626.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/comedi/drivers/s626.c b/drivers/staging/comedi=
/drivers/s626.c
index 084a8e7b9fc2..e7aba937d896 100644
--- a/drivers/staging/comedi/drivers/s626.c
+++ b/drivers/staging/comedi/drivers/s626.c
@@ -2130,13 +2130,15 @@ static int s626_allocate_dma_buffers(struct comedi_=
device *dev)
 	void *addr;
 	dma_addr_t appdma;
=20
-	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
+	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
+				  GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
 	devpriv->ana_buf.logical_base =3D addr;
 	devpriv->ana_buf.physical_base =3D appdma;
=20
-	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
+	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
+				  GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
 	devpriv->rps_buf.logical_base =3D addr;
@@ -2154,13 +2156,13 @@ static void s626_free_dma_buffers(struct comedi_dev=
ice *dev)
 		return;
=20
 	if (devpriv->rps_buf.logical_base)
-		pci_free_consistent(pcidev, S626_DMABUF_SIZE,
-				    devpriv->rps_buf.logical_base,
-				    devpriv->rps_buf.physical_base);
+		dma_free_coherent(&pcidev->dev, S626_DMABUF_SIZE,
+				  devpriv->rps_buf.logical_base,
+				  devpriv->rps_buf.physical_base);
 	if (devpriv->ana_buf.logical_base)
-		pci_free_consistent(pcidev, S626_DMABUF_SIZE,
-				    devpriv->ana_buf.logical_base,
-				    devpriv->ana_buf.physical_base);
+		dma_free_coherent(&pcidev->dev, S626_DMABUF_SIZE,
+				  devpriv->ana_buf.logical_base,
+				  devpriv->ana_buf.physical_base);
 }
=20
 static int s626_initialize(struct comedi_device *dev)
--=20
2.17.1


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8McIcACgkQ+gRsbIfe
747WIQ/7BdADpPXhYh4IdHYtyRfgR/Kma0OpFegNzOM2kJ5I5c9VX0g90U2ZQCVS
JYO/OgeJDFcj3fdX6JnN2cTTh5UItDsQeh0m35KXqUk1F2AxyPb63DyweF15z53U
sQA9w/o6xgTgcjTpUI83QyllrVbJ0gwYvN59nTenZYPE0j2lvkbnEURDjaziFrkt
z2TQfpVoxNCgGYdkO310R5qFpEaJj/pVtx1ZENI+WPYD0gQ8ywSDyhdN5IBX6RhZ
vqjv/A6LnbBuRg7A9JwmR4eJa9l4DIAfom4rJjk4t2KDHLz2sbNbsPS/G2xPhCVY
cqxqLVqRkWbTdgs8wmov2BAZDV2ZIAGA3jhLz1Ug/oMxBAeUgGSevwTTBcoQfXkq
wwMW8lJ58htd7Fiv96Eti+rzPz0CQRZvOF8zKiQIllAqcInm7LcoooKK8JGREvI8
PVrRk8Qq7XW+FwQP+RVDnLoJp7YIAWa7vpaKgWZR6cKs/cWAbyhUorn8KLT8qRx1
LGVsR0RVP5IQj1U60h8hlpN0Z09/nfBMMLand81mjOQzFl2KD30z0g+A4n0Lcsei
Kfdnez8/h75g+r109BrfCEv/LZWBjTPlkO4rVpcEv2pxlyOXXogIxjezcRxNG3cY
5aQQo6vfWUVPCVTXOhSeh5hM3p7W53F3B0l5o9VypIOTQ9pcmME=
=fF19
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
