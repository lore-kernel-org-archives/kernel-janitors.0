From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Apr 2015 09:25:07 +0000
Subject: [patch] drm/nouveau/platform: checking for IS_ERR() instead of NULL
Message-Id: <20150421092507.GB12098@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

iommu_domain_alloc() returns NULL on error, it doesn't return error
pointers.

Fixes: 58fd9375c2c5 ('drm/nouveau/platform: probe IOMMU if present')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 775277f..4fbd35d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -102,7 +102,7 @@ static void nouveau_platform_probe_iommu(struct device *dev,
 
 	if (iommu_present(&platform_bus_type)) {
 		gpu->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (IS_ERR(gpu->iommu.domain))
+		if (!gpu->iommu.domain)
 			goto error;
 
 		/*
