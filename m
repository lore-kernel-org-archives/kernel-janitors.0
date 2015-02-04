From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Feb 2015 21:25:48 +0000
Subject: [PATCH] GPU-DRM-OMAP: Delete unnecessary checks before two function calls
Message-Id: <54D28E5C.9040304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Feb 2015 22:22:36 +0100

The functions framebuffer_release() and vunmap() perform also input
parameter validation. Thus the test around their calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 3 +--
 drivers/gpu/drm/omapdrm/omap_gem.c   | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index d292d24..fcc02b0 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -270,8 +270,7 @@ fail_unlock:
 fail:
 
 	if (ret) {
-		if (fbi)
-			framebuffer_release(fbi);
+		framebuffer_release(fbi);
 		if (fb) {
 			drm_framebuffer_unregister_private(fb);
 			drm_framebuffer_remove(fb);
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index aeb91ed..18a4137 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1292,12 +1292,11 @@ void omap_gem_free_object(struct drm_gem_object *obj)
 		if (omap_obj->pages)
 			omap_gem_detach_pages(obj);
 
-		if (!is_shmem(obj)) {
+		if (!is_shmem(obj))
 			dma_free_writecombine(dev->dev, obj->size,
 					omap_obj->vaddr, omap_obj->paddr);
-		} else if (omap_obj->vaddr) {
+		else
 			vunmap(omap_obj->vaddr);
-		}
 	}
 
 	/* don't free externally allocated syncobj */
-- 
2.2.2

