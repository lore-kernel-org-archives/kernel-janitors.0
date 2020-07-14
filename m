From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 11:53:15 +0000
Subject: [PATCH] USB: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200714115249.GA8563@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jI8keyz6grp/JLjh"
List-Id: <kernel-janitors.vger.kernel.org>
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--jI8keyz6grp/JLjh
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
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_)

@@ expression E1, E2, E3; @@
- pci_zalloc_consistent(E1, E2, E3)
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_)

@@ expression E1, E2, E3, E4; @@
- pci_free_consistent(E1, E2, E3, E4)
+ dma_free_coherent(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_single(E1, E2, E3, E4)
+ dma_map_single(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_single(E1, E2, E3, E4)
+ dma_unmap_single(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4, E5; @@
- pci_map_page(E1, E2, E3, E4, E5)
+ dma_map_page(&E1->dev, E2, E3, E4, E5)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_page(E1, E2, E3, E4)
+ dma_unmap_page(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_sg(E1, E2, E3, E4)
+ dma_map_sg(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_sg(E1, E2, E3, E4)
+ dma_unmap_sg(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_cpu(E1, E2, E3, E4)
+ dma_sync_single_for_cpu(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_device(E1, E2, E3, E4)
+ dma_sync_single_for_device(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_cpu(E1, E2, E3, E4)
+ dma_sync_sg_for_cpu(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_device(E1, E2, E3, E4)
+ dma_sync_sg_for_device(&E1->dev, E2, E3, E4)

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
 drivers/usb/host/ehci-pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index af3c1b9b38b2..71ec3025686f 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -124,8 +124,7 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 		case 0x005b:	/* CK804 */
 		case 0x00d8:	/* CK8 */
 		case 0x00e8:	/* CK8S */
-			if (pci_set_consistent_dma_mask(pdev,
-						DMA_BIT_MASK(31)) < 0)
+			if (dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(31)) < 0)
 				ehci_warn(ehci, "can't enable NVidia "
 					"workaround for >2GB RAM\n");
 			break;
--=20
2.17.1


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8NnIYACgkQ+gRsbIfe
746pMRAAgh0C4G7yswFeFhknFnQoPRapRiqqXFb0kUimI5bl/yqvpdeJjzU37woq
AXbP5yLLJCYkWsw2aJzuVrsB3Dj4MJ77+nWSx7iLwUp+0ys/9mf/bDoPD7EB/RNG
EQymoql8dc1aSO3kIJwHzKe3CZ99gW8y0GONMoKuXtmJljbCrNVPOK9yV2YAzDTJ
HRJ5n0xyKu9q8cZ0+uK2Hj48sDVragz+qmTZPdZCaGRr9dDwKO8hq5kn5yprbRsH
ctj2UsJcgY+zWEZHbUQhBd91QrFNezMN62STle0HYOXar79dMxuNv5sTaMPgVd09
30MrjTBm1dgkBKQlaUrAx5BmS6mVlilnYQEByBHlJaeHQe4aGr92z438dPZqDSNS
SiukbO+R6r5fQY87U0/Qeu6J8rVbNBjQJPzl1BgHV4VWrbgeA9v2r010qTtMNYPY
emqCyrDJ0lQQaDA3qD8NUCRX/+W+50tDljbvRoxxnjoVpJmo0EZiN84sQ+R119ms
UZY8fMXcLDbrKf5wTpg3Cf/SnVE8IAr3vXHFquzf5CFoCK/sU9muOiVbpPtxYu6S
OSDjtLEWvNN7TdB7CL8fq9t1mCoj/YZFjty1N2+poxlRKy6WPUdy0lRqzUBGH3ee
liYhecVR+SyexL69Vf04oE0DoMPG6M4Y8XIrU3YeDgKpR5COn5Y=
=DIFZ
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
