From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 11 Jul 2020 13:28:24 +0000
Subject: [PATCH] staging: rtl8192e: rtl8192E_dev: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200711131623.GA20537@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="RnlQjJ0d97Da+TV1"
List-Id: <kernel-janitors.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--RnlQjJ0d97Da+TV1
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

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/stagi=
ng/rtl8192e/rtl8192e/r8192E_dev.c
index ddcd7885d190..9f869fb3eaa8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1215,9 +1215,9 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, str=
uct tx_desc *pdesc,
=20
 	memset((u8 *)pdesc, 0, 12);
=20
-	mapping =3D pci_map_single(priv->pdev, skb->data, skb->len,
-				 PCI_DMA_TODEVICE);
-	if (pci_dma_mapping_error(priv->pdev, mapping)) {
+	mapping =3D dma_map_single(&priv->pdev->dev, skb->data, skb->len,
+				 DMA_TO_DEVICE);
+	if (dma_mapping_error(&priv->pdev->dev, mapping)) {
 		netdev_err(dev, "%s(): DMA Mapping error\n", __func__);
 		return;
 	}
@@ -1282,10 +1282,10 @@ void  rtl92e_fill_tx_cmd_desc(struct net_device *de=
v, struct tx_desc_cmd *entry,
 			      struct cb_desc *cb_desc, struct sk_buff *skb)
 {
 	struct r8192_priv *priv =3D rtllib_priv(dev);
-	dma_addr_t mapping =3D pci_map_single(priv->pdev, skb->data, skb->len,
-			 PCI_DMA_TODEVICE);
+	dma_addr_t mapping =3D dma_map_single(&priv->pdev->dev, skb->data,
+					    skb->len, DMA_TO_DEVICE);
=20
-	if (pci_dma_mapping_error(priv->pdev, mapping))
+	if (dma_mapping_error(&priv->pdev->dev, mapping))
 		netdev_err(dev, "%s(): DMA Mapping error\n", __func__);
 	memset(entry, 0, 12);
 	entry->LINIP =3D cb_desc->bLastIniPkt;
--=20
2.17.1


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8Ju6cACgkQ+gRsbIfe
746PVQ/5AdOPy5H4YQEgLsRgxPsin6vIQ3UZ+Vr0vVs8wXO6/gwM3vRqzwC50E//
kHmoWWc90Fc1bnVigYowL3tjnwErmWei0OBX52r9bJV4aSAjiJNAXjVPeMps6z4G
ifOSG8gLacQBuEf+3E4gEKKwcXjaAqcOtO2mfEZLuwZEwBV3PieolxgomsfbfydH
ukV9yyNS4aVXyc0uH8VGQ0EG79xYeXBrmyYzrLVI5o+kzkduKwfDITLf7FNZd/5U
78yRnSvLuqb8c+g2b3TBVkc6wWPEArgAr8BQpIP6UdJ7KRt9pMk1ls8guoaNqc5i
1iu/md3xVvR9en4BuMTCfUQJwgVxgu7q95YhSYV/Wm/mY6ZaC2paay4sARJ9IdhH
cyWpopEMltqiRnhB4AaPYtkScvNRih4iEUdrPUWeL64bVLUaFQ16DVp6sxxwvRjX
vAaN6wKz6RRkxpJwWtA6lmRFcUvC2Xp3xxQdpgqpMTFzBhNlxoA7AkID0hiUpX5r
HCcLuKiQyzDi+tdVkHkcSLRyMI+jbylX1bWVb0MQ7mKvVNRgbGdhhoz8BV0GsUC0
frU3VT9e/qBxggOPHoGQwAjnI0+4DaB/xzfXF3b9ZbRJDT4VJ3/ZybmpYjpOMRCX
9XzrZLozt2KXFj2koVerZ/QsulfNWUuwfIwWQGHAI8u627LL4pM=
=jxWP
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
