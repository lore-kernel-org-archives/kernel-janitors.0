From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 02 Aug 2019 01:29:20 +0000
Subject: [PATCH -next] drm/vgem: Fix wrong pointer passed to PTR_ERR()
Message-Id: <20190802012920.60344-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, Eric Biggers <ebiggers@google.com>, Sam Ravnborg <sam@ravnborg.org>, Sean Paul <seanpaul@chromium.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: 7e9e5ead55be ("drm/vgem: fix cache synchronization on arm/arm64")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index b98689fb0d5d..ef52546f48c4 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -304,10 +304,10 @@ static struct page **pin_and_sync(struct drm_vgem_gem_object *bo)
 	if (IS_ERR(sgt)) {
 		dev_err(dev->dev,
 			"failed to allocate sgt: %ld\n",
-			PTR_ERR(bo->table));
+			PTR_ERR(sgt));
 		drm_gem_put_pages(&bo->base, pages, false, false);
 		mutex_unlock(&bo->pages_lock);
-		return ERR_CAST(bo->table);
+		return ERR_CAST(sgt);
 	}
 
 	/*
