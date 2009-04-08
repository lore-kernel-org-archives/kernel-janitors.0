From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 13:59:10 +0000
Subject: Re: [PATCH 50/56] drivers/staging: Remove void casts
Message-Id: <49DCADAE.7050302@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080509q5c8a62e8t7a41302a0b2ac383@mail.gmail.com>
In-Reply-To: <36ca99e90904080509q5c8a62e8t7a41302a0b2ac383@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Fixed patch

Thanks,

Jack

--

drivers/staging: Remove void casts

From: Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---

 drivers/staging/altpciechdma/altpciechdma.c |    4 ++--
 drivers/staging/epl/EplApiLinuxKernel.c     |    8 ++------
 drivers/staging/et131x/et1310_rx.c          |    4 ++--
 drivers/staging/rtl8187se/r8180_core.c      |   13 ++++++-------
 drivers/staging/slicoss/slicoss.c           |    3 +--
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/altpciechdma/altpciechdma.c
b/drivers/staging/altpciechdma/altpciechdma.c
index 5869e14..f613a1d 100644
--- a/drivers/staging/altpciechdma/altpciechdma.c
+++ b/drivers/staging/altpciechdma/altpciechdma.c
@@ -535,7 +535,7 @@ static int __devinit dma_test(struct ape_dev *ape,
struct pci_dev *dev)
=20
     /* allocate and map coherently-cached memory for a DMA-able buffer */
     /* @see Documentation/PCI/PCI-DMA-mapping.txt, near line 318 */
-    buffer_virt =3D (u8 *)pci_alloc_consistent(dev, PAGE_SIZE * 4,
&buffer_bus);
+    buffer_virt =3D pci_alloc_consistent(dev, PAGE_SIZE * 4, &buffer_bus);
     if (!buffer_virt) {
         printk(KERN_DEBUG "Could not allocate coherent DMA buffer.\n");
         goto fail;
@@ -793,7 +793,7 @@ static int __devinit probe(struct pci_dev *dev,
const struct pci_device_id *id)
=20
     /* allocate and map coherently-cached memory for a descriptor table */
     /* @see LDD3 page 446 */
-    ape->table_virt =3D (struct ape_chdma_table *)pci_alloc_consistent(dev,
+    ape->table_virt =3D pci_alloc_consistent(dev,
         APE_CHDMA_TABLE_SIZE, &ape->table_bus);
     /* could not allocate table? */
     if (!ape->table_virt) {
diff --git a/drivers/staging/epl/EplApiLinuxKernel.c
b/drivers/staging/epl/EplApiLinuxKernel.c
index cb3e275..4c5dfcd 100644
--- a/drivers/staging/epl/EplApiLinuxKernel.c
+++ b/drivers/staging/epl/EplApiLinuxKernel.c
@@ -655,9 +655,7 @@ static int EplLinIoctl(struct inode
*pDeviceFile_p,    // information about the dev
                 goto Exit;
             }
=20
-            pBufHeader -                (tEplLinSdoBufHeader *)
-                vmalloc(sizeof(tEplLinSdoBufHeader) +
+            pBufHeader =3D vmalloc(sizeof(tEplLinSdoBufHeader) +
                     SdoObject.m_uiSize);
             if (pBufHeader =3D NULL) {    // no memory available
                 iRet =3D -ENOMEM;
@@ -751,9 +749,7 @@ static int EplLinIoctl(struct inode
*pDeviceFile_p,    // information about the dev
                 goto Exit;
             }
=20
-            pBufHeader -                (tEplLinSdoBufHeader *)
-                vmalloc(sizeof(tEplLinSdoBufHeader) +
+            pBufHeader =3D vmalloc(sizeof(tEplLinSdoBufHeader) +
                     SdoObject.m_uiSize);
             if (pBufHeader =3D NULL) {    // no memory available
                 iRet =3D -ENOMEM;
diff --git a/drivers/staging/et131x/et1310_rx.c
b/drivers/staging/et131x/et1310_rx.c
index 8dc559a..a3810f5 100644
--- a/drivers/staging/et131x/et1310_rx.c
+++ b/drivers/staging/et131x/et1310_rx.c
@@ -610,8 +610,8 @@ int et131x_init_recv(struct et131x_adapter *adapter)
=20
     /* Setup each RFD */
     for (RfdCount =3D 0; RfdCount < rx_ring->NumRfd; RfdCount++) {
-        pMpRfd =3D (MP_RFD *) kmem_cache_alloc(rx_ring->RecvLookaside,
-                             GFP_ATOMIC | GFP_DMA);
+        pMpRfd =3D kmem_cache_alloc(rx_ring->RecvLookaside,
+                     GFP_ATOMIC | GFP_DMA);
=20
         if (!pMpRfd) {
             DBG_ERROR(et131x_dbginfo,
diff --git a/drivers/staging/rtl8187se/r8180_core.c
b/drivers/staging/rtl8187se/r8180_core.c
index 6ecd12d..4f35f6d 100644
--- a/drivers/staging/rtl8187se/r8180_core.c
+++ b/drivers/staging/rtl8187se/r8180_core.c
@@ -1691,7 +1691,7 @@ int alloc_tx_beacon_desc_ring(struct net_device
*dev, int count)
     u32 *tmp;
     struct r8180_priv *priv =3D (struct r8180_priv *)ieee80211_priv(dev);
=20
-    priv->txbeaconring =3D (u32*)pci_alloc_consistent(priv->pdev,
+    priv->txbeaconring =3D pci_alloc_consistent(priv->pdev,
                       sizeof(u32)*8*count,
                       &priv->txbeaconringdma);
     if (!priv->txbeaconring) return -1;
@@ -1727,8 +1727,7 @@ short alloc_tx_desc_ring(struct net_device *dev,
int bufsize, int count,
         DMESGE ("TX buffer allocation too large");
         return 0;
     }
-    desc =3D (u32*)pci_alloc_consistent(pdev,
-                      sizeof(u32)*8*count+256, &dma_desc);
+    desc =3D pci_alloc_consistent(pdev, sizeof(u32)*8*count+256, &dma_desc=
);
     if(desc=3DNULL) return -1;
     if(dma_desc & 0xff){
=20
@@ -1751,7 +1750,7 @@ short alloc_tx_desc_ring(struct net_device *dev,
int bufsize, int count,
     tmp=DEsc;
     for (i=3D0;i<count;i++)
     {
-        buf =3D (void*)pci_alloc_consistent(pdev,bufsize,&dma_tmp);
+        buf =3D pci_alloc_consistent(pdev,bufsize,&dma_tmp);
         if (buf =3D NULL) return -ENOMEM;
=20
         switch(addr) {
@@ -1975,8 +1974,8 @@ short alloc_rx_desc_ring(struct net_device *dev,
u16 bufsize, int count)
         return -1;
     }
=20
-    desc (u32*)pci_alloc_consistent(pdev,sizeof(u32)*rx_desc_size*count+25=
6,
-                      &dma_desc);
+    desc =3D pci_alloc_consistent(pdev,sizeof(u32)*rx_desc_size*count+256,
+                   &dma_desc);
=20
     if(dma_desc & 0xff){
=20
@@ -2017,7 +2016,7 @@ short alloc_rx_desc_ring(struct net_device *dev,
u16 bufsize, int count)
         for(j=3D0;j<bufsize;j++) ((u8*)buf)[i] =3D 0;
 #endif
=20
-        //buf =3D (void*)pci_alloc_consistent(pdev,bufsize,&dma_tmp);
+        //buf =3D pci_alloc_consistent(pdev,bufsize,&dma_tmp);
         if(-1 =3D buffer_add(&(priv->rxbuffer), buf,dma_tmp,
                &(priv->rxbufferhead))){
                DMESGE("Unable to allocate mem RX buf");
diff --git a/drivers/staging/slicoss/slicoss.c
b/drivers/staging/slicoss/slicoss.c
index 9481563..746034c 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -333,8 +333,7 @@ static void slic_init_adapter(struct net_device *netdev,
         pslic_handle->next =3D adapter->pfree_slic_handles;
         adapter->pfree_slic_handles =3D pslic_handle;
     }
-    adapter->pshmem =3D (struct slic_shmem *)
-                    pci_alloc_consistent(adapter->pcidev,
+    adapter->pshmem =3D pci_alloc_consistent(adapter->pcidev,
                     sizeof(struct slic_shmem),
                     &adapter->
                     phys_shmem);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
