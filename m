From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 13:33:53 +0000
Subject: [PATCH 1/1] GPU-DRM-MSM: Deletion of unnecessary checks before two function calls
Message-Id: <54748541.4000600@users.sourceforge.net>
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
Date: Tue, 25 Nov 2014 14:30:28 +0100

The functions framebuffer_release() and vunmap() perform also input
parameter validation. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 3 +--
 drivers/gpu/drm/msm/msm_gem.c   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index ab5bfd2..fd5a6f3 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -193,8 +193,7 @@ fail_unlock:
 fail:
 
 	if (ret) {
-		if (fbi)
-			framebuffer_release(fbi);
+		framebuffer_release(fbi);
 		if (fb) {
 			drm_framebuffer_unregister_private(fb);
 			drm_framebuffer_remove(fb);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4b1b82a..157cf21 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -543,8 +543,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 			drm_free_large(msm_obj->pages);
 
 	} else {
-		if (msm_obj->vaddr)
-			vunmap(msm_obj->vaddr);
+		vunmap(msm_obj->vaddr);
 		put_pages(obj);
 	}
 
-- 
2.1.3

