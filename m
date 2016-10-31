From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 31 Oct 2016 06:35:50 +0000
Subject: [PATCH] drm/nouveau/tegra: Fix error handling
Message-Id: <20161031063550.2567-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

'iommu_domain_alloc()' returns NULL in case of error, not an error pointer.
So test it accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 9b638bd905ff..f2bc0b7d9b93 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -102,7 +102,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 
 	if (iommu_present(&platform_bus_type)) {
 		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (IS_ERR(tdev->iommu.domain))
+		if (!tdev->iommu.domain)
 			goto error;
 
 		/*
-- 
2.9.3

