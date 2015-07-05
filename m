From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 18:22:35 +0000
Subject: [PATCH] GPU-DRM-nouveau: Delete unnecessary checks before two function calls
Message-Id: <559975EB.500@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net> <5447BF71.7040200@users.sourceforge.net>
In-Reply-To: <5447BF71.7040200@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Jul 2015 20:15:12 +0200

The functions nvkm_namedb_put() and pci_dev_put() test whether their
argument is NULL and then return immediately.
Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 3 +--
 drivers/gpu/drm/nouveau/nvkm/core/handle.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 36b40c9..8ca3d0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -515,8 +515,7 @@ nouveau_drm_unload(struct drm_device *dev)
 	nouveau_vga_fini(drm);
 
 	nvif_device_fini(&drm->device);
-	if (drm->hdmi_device)
-		pci_dev_put(drm->hdmi_device);
+	pci_dev_put(drm->hdmi_device);
 	nouveau_cli_destroy(&drm->client);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/handle.c b/drivers/gpu/drm/nouveau/nvkm/core/handle.c
index dc7ff10..165f3ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/handle.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/handle.c
@@ -216,6 +216,5 @@ nvkm_handle_get_cinst(struct nvkm_object *engctx, u32 cinst)
 void
 nvkm_handle_put(struct nvkm_handle *handle)
 {
-	if (handle)
-		nvkm_namedb_put(handle);
+	nvkm_namedb_put(handle);
 }
-- 
2.4.5

