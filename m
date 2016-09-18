From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 16:54:22 +0000
Subject: [PATCH 5/5] drm/amdgpu: Adjust checks for null pointers in nine functions
Message-Id: <1dfb0d04-4752-8a85-8835-c4eb8fc1ba7c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
In-Reply-To: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 18:32:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

* The script "checkpatch.pl" can point information out like the following.

  Comparison to NULL could be written !=E2=80=A6

  Thus fix the affected source code places.

* Do also not use curly brackets at corresponding source code places
  where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++-----------=
----
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index fed4854..b5b7cfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -251,7 +251,7 @@ static int amdgpu_vram_scratch_init(struct amdgpu_devic=
e *adev)
 {
 	int r;
=20
-	if (adev->vram_scratch.robj =3D NULL) {
+	if (!adev->vram_scratch.robj) {
 		r =3D amdgpu_bo_create(adev, AMDGPU_GPU_PAGE_SIZE,
 				     PAGE_SIZE, true, AMDGPU_GEM_DOMAIN_VRAM,
 				     AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
@@ -283,9 +283,9 @@ static void amdgpu_vram_scratch_fini(struct amdgpu_devi=
ce *adev)
 {
 	int r;
=20
-	if (adev->vram_scratch.robj =3D NULL) {
+	if (!adev->vram_scratch.robj)
 		return;
-	}
+
 	r =3D amdgpu_bo_reserve(adev->vram_scratch.robj, false);
 	if (likely(r =3D 0)) {
 		amdgpu_bo_kunmap(adev->vram_scratch.robj);
@@ -359,9 +359,9 @@ static int amdgpu_doorbell_init(struct amdgpu_device *a=
dev)
 		return -EINVAL;
=20
 	adev->doorbell.ptr =3D ioremap(adev->doorbell.base, adev->doorbell.num_do=
orbells * sizeof(u32));
-	if (adev->doorbell.ptr =3D NULL) {
+	if (!adev->doorbell.ptr)
 		return -ENOMEM;
-	}
+
 	DRM_INFO("doorbell mmio base: 0x%08X\n", (uint32_t)adev->doorbell.base);
 	DRM_INFO("doorbell mmio size: %u\n", (unsigned)adev->doorbell.size);
=20
@@ -456,7 +456,7 @@ static int amdgpu_wb_init(struct amdgpu_device *adev)
 {
 	int r;
=20
-	if (adev->wb.wb_obj =3D NULL) {
+	if (!adev->wb.wb_obj) {
 		r =3D amdgpu_bo_create(adev, AMDGPU_MAX_WB * 4, PAGE_SIZE, true,
 				     AMDGPU_GEM_DOMAIN_GTT, 0,  NULL, NULL,
 				     &adev->wb.wb_obj);
@@ -657,7 +657,7 @@ int amdgpu_dummy_page_init(struct amdgpu_device *adev)
 	if (adev->dummy_page.page)
 		return 0;
 	adev->dummy_page.page =3D alloc_page(GFP_DMA32 | GFP_KERNEL | __GFP_ZERO);
-	if (adev->dummy_page.page =3D NULL)
+	if (!adev->dummy_page.page)
 		return -ENOMEM;
 	adev->dummy_page.addr =3D pci_map_page(adev->pdev, adev->dummy_page.page,
 					0, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
@@ -679,7 +679,7 @@ int amdgpu_dummy_page_init(struct amdgpu_device *adev)
  */
 void amdgpu_dummy_page_fini(struct amdgpu_device *adev)
 {
-	if (adev->dummy_page.page =3D NULL)
+	if (!adev->dummy_page.page)
 		return;
 	pci_unmap_page(adev->pdev, adev->dummy_page.addr,
 			PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
@@ -1226,10 +1226,10 @@ static int amdgpu_early_init(struct amdgpu_device *=
adev)
 	adev->ip_block_status =3D kcalloc(adev->num_ip_blocks,
 					sizeof(*adev->ip_block_status),
 					GFP_KERNEL);
-	if (adev->ip_block_status =3D NULL)
+	if (!adev->ip_block_status)
 		return -ENOMEM;
=20
-	if (adev->ip_blocks =3D NULL) {
+	if (!adev->ip_blocks) {
 		DRM_ERROR("No IP blocks found!\n");
 		return r;
 	}
@@ -1525,9 +1525,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->rmmio_base =3D pci_resource_start(adev->pdev, 5);
 	adev->rmmio_size =3D pci_resource_len(adev->pdev, 5);
 	adev->rmmio =3D ioremap(adev->rmmio_base, adev->rmmio_size);
-	if (adev->rmmio =3D NULL) {
+	if (!adev->rmmio)
 		return -ENOMEM;
-	}
+
 	DRM_INFO("register mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
 	DRM_INFO("register mmio size: %u\n", (unsigned)adev->rmmio_size);
=20
@@ -1542,7 +1542,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			break;
 		}
 	}
-	if (adev->rio_mem =3D NULL)
+	if (!adev->rio_mem)
 		DRM_ERROR("Unable to find PCI I/O BAR\n");
=20
 	/* early init functions */
@@ -1758,9 +1758,8 @@ int amdgpu_suspend_kms(struct drm_device *dev, bool s=
uspend, bool fbcon)
 	struct drm_connector *connector;
 	int r;
=20
-	if (dev =3D NULL || dev->dev_private =3D NULL) {
+	if (!dev || !dev->dev_private)
 		return -ENODEV;
-	}
=20
 	adev =3D dev->dev_private;
=20
@@ -1791,9 +1790,9 @@ int amdgpu_suspend_kms(struct drm_device *dev, bool s=
uspend, bool fbcon)
 			}
 		}
=20
-		if (rfb =3D NULL || rfb->obj =3D NULL) {
+		if (!rfb || !rfb->obj)
 			continue;
-		}
+
 		robj =3D gem_to_amdgpu_bo(rfb->obj);
 		/* don't unpin kernel fb objects */
 		if (!amdgpu_fbdev_robj_is_fb(adev, robj)) {
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
