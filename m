From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 11 Jul 2020 12:47:33 +0000
Subject: [PATCH] staging: comedi: s626: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200711123533.GA15038@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
List-Id: <kernel-janitors.vger.kernel.org>
To: gregkh@linuxfoundation.org, abbotti@mev.co.uk, hsweeten@visionengravers.com
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
	This change is proposed by Christoph Hellwig <hch@infradead.org>
	in the post https://marc.info/?l=3Dkernel-janitors&m=3D158745678307186&w=
=3D4
	on kernel-janitors Mailing List.

 drivers/staging/comedi/drivers/s626.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/comedi/drivers/s626.c b/drivers/staging/comedi=
/drivers/s626.c
index 084a8e7b9fc2..c159416662fd 100644
--- a/drivers/staging/comedi/drivers/s626.c
+++ b/drivers/staging/comedi/drivers/s626.c
@@ -2130,13 +2130,15 @@ static int s626_allocate_dma_buffers(struct comedi_=
device *dev)
 	void *addr;
 	dma_addr_t appdma;
=20
-	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
+	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
+				  GFP_ATOMIC);
 	if (!addr)
 		return -ENOMEM;
 	devpriv->ana_buf.logical_base =3D addr;
 	devpriv->ana_buf.physical_base =3D appdma;
=20
-	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
+	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
+				  GFP_ATOMIC);
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

iQIyBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8JsgwACgkQ+gRsbIfe
7474BQ/4kb5fufct1WPXGSk5GazzpLTQpggErwbo+mTWR8xrR0hu0JEkSq3rlcJC
PlyH5wxUTm6AJM6ub8UbDbrIiFCoGvFW/wPKyBgdVFnkrEf5GbPg4QuGD0eEOegC
EDJ34j2meK2fPpOhvKh8I7mk/YXVl0uNB3CTul9GLzAC/NQG3GERX1g3JZsDo+Ib
5sNly1D6mRr2WOxaTOGGLK+JI5PXeQ5jT8x40Q6TwEfZNDFA1A6diStFLOAusNA0
txdSpArNNXJGjxSITQi7Gw4Ifp0g8MW0WnYjL/f4eYVqbGstVo6JYTjI+iwt1aPe
pJpQlNYlXmELft+vVFIq++I6/mIbdxuRjzOKI5e5FJ5/GQpU9nnxlCaW00/c3p0A
8ioeIhy0pI3JekPsDrw5pF5xUZZxXUbHiIxgzrts54g17isyQFwoh0mTnvmANlcz
LTVV9U0xjeQEc3btQMG3c6JWGQ2gpyFDA89Out1769HJvBpuWBzbytUtFVnTKizp
FFV+3c8RjyIih39KvNVE89zay2Y+EFSeiEl3oYhFX9digbSP+ErIQcu0YYaV4k+Q
FjIMZB1j/tBHshL5TwWbU20naZXbrmgReJkvdJwCb292ehp/kFDfV35VFi9qTJD7
D5TH075SMqXfsPrBMuZha868gzaO4dzfmiqAkZEcJ4QLNQ78Mg==
=YDlr
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
