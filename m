From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 11 Jul 2020 12:58:33 +0000
Subject: [PATCH] staging: qlge: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200711124633.GA16459@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
List-Id: <kernel-janitors.vger.kernel.org>
To: manishrc@marvell.com, GR-Linux-NIC-Dev@marvell.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--EeQfGwPcQSOJBaQU
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
        in the post https://marc.info/?l=3Dkernel-janitors&m=3D158745678307=
186&w=3D4
        on kernel-janitors Mailing List.

 drivers/staging/qlge/qlge_mpi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mp=
i.c
index fa178fc642a6..16a9bf818346 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -788,8 +788,9 @@ int ql_dump_risc_ram_area(struct ql_adapter *qdev, void=
 *buf,
 	char *my_buf;
 	dma_addr_t buf_dma;
=20
-	my_buf =3D pci_alloc_consistent(qdev->pdev, word_count * sizeof(u32),
-				      &buf_dma);
+	my_buf =3D dma_alloc_coherent(&qdev->pdev->dev,
+				    word_count * sizeof(u32), &buf_dma,
+				    GFP_ATOMIC);
 	if (!my_buf)
 		return -EIO;
=20
@@ -797,8 +798,8 @@ int ql_dump_risc_ram_area(struct ql_adapter *qdev, void=
 *buf,
 	if (!status)
 		memcpy(buf, my_buf, word_count * sizeof(u32));
=20
-	pci_free_consistent(qdev->pdev, word_count * sizeof(u32), my_buf,
-			    buf_dma);
+	dma_free_coherent(&qdev->pdev->dev, word_count * sizeof(u32), my_buf,
+			  buf_dma);
 	return status;
 }
=20
--=20
2.17.1


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8JtKkACgkQ+gRsbIfe
747D0g//R1ChLyHMnDJc6GeilVs7gCG2zUGsdaMK4qr11DUt+48TbVyHwFp64/3p
QKmTK3rsaIOTFIonk8mhSll/foS6mpVBv4NXFWpCOSeyqPSvyYiCWyH8ZoAr7l06
k6mL6QYZwVczVRXt/+hStzVLef9ToEEjzmdLJbP9JWuew9xSqfVbyNDV4TvgERmi
3JuzM6gFCBR/nLdisBkEVKU4hrjGwHc2DRO96bSFPJtwwLnTXwZc+QDv10H9r1JY
tVzaGa8czpsYlJv67vBRZ3Isym4iGb4ri94kICBTSfvZGdyE/HaWPqpEZzobOALK
kBwFP65T0r3j+i+QEOeK3r3DwI96BX8qjzMzWu4C9D/vzIwlD4weyvmg2MM/mD44
YlEucF2PhOrqWYlkYE1/JApT/7h3AaOe2SQ9cYmvTeDHWeNUrfcfr9yc13LaVJwW
NVpKez7TQxzQ5YupsSctM8fiZIrS5uxIzXA9JKLM7HW6f4OJ8sN9wux1O8cCnrv5
RIJw4bME/C6ihNJMNZQU/v8VGS9L9v+Ryw2AU7gs4mSA5M0JZUT1SduejM/SFsp8
oCH1WATqdz/EG7mBC6N+m9sI8zdUeKUaRZsIvIXjYsrvoeU0g6d0OY4gAQZwx37v
Ohot02UCvSuBoqXngEb/IGyh0GnuPCug68YBOPTYZNyuFhgy80Q=
=/Cjw
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
