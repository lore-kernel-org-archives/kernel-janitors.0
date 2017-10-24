From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 08:50:50 +0000
Subject: [PATCH 2/3] drm/exynos/gem: Use common error handling code in exynos_drm_gem_init()
Message-Id: <887019f4-4325-5b19-018a-32169e09462a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
In-Reply-To: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 09:50:54 +0200

Adjust jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 077de014d610..1b3c9324cdd5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -208,20 +208,22 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
 	ret = drm_gem_object_init(dev, obj, size);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialize gem object\n");
-		kfree(exynos_gem);
-		return ERR_PTR(ret);
+		goto free_gem;
 	}
 
 	ret = drm_gem_create_mmap_offset(obj);
-	if (ret < 0) {
-		drm_gem_object_release(obj);
-		kfree(exynos_gem);
-		return ERR_PTR(ret);
-	}
+	if (ret < 0)
+		goto release_object;
 
 	DRM_DEBUG_KMS("created file object = %pK\n", obj->filp);
 
 	return exynos_gem;
+
+release_object:
+	drm_gem_object_release(obj);
+free_gem:
+	kfree(exynos_gem);
+	return ERR_PTR(ret);
 }
 
 struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
-- 
2.14.2

