From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Jul 2016 18:01:27 +0000
Subject: [PATCH 2/3] drm/msm: Delete unnecessary checks before drm_gem_object_unreference_unlocked()
Message-Id: <9120ad90-45d1-1c01-fc84-65c431b5ca4f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <351a1279-b0ca-5f5e-d175-28c9de8406f6@users.sourceforge.net>
In-Reply-To: <351a1279-b0ca-5f5e-d175-28c9de8406f6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Jul 2016 19:15:35 +0200

The drm_gem_object_unreference_unlocked() function tests whether
its argument is NULL and then returns immediately.
Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c | 3 +--
 drivers/gpu/drm/msm/msm_fb.c            | 4 ++--
 drivers/gpu/drm/msm/msm_gem.c           | 4 +---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index ba8df15..7b39e89 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -168,8 +168,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_put_iova(mdp4_kms->blank_cursor_bo, mdp4_kms->id);
-	if (mdp4_kms->blank_cursor_bo)
-		drm_gem_object_unreference_unlocked(mdp4_kms->blank_cursor_bo);
+	drm_gem_object_unreference_unlocked(mdp4_kms->blank_cursor_bo);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 7919c24..95cf8fe 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -49,8 +49,8 @@ static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	for (i = 0; i < n; i++) {
 		struct drm_gem_object *bo = msm_fb->planes[i];
-		if (bo)
-			drm_gem_object_unreference_unlocked(bo);
+
+		drm_gem_object_unreference_unlocked(bo);
 	}
 
 	kfree(msm_fb);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 886cfe0..9a713fb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -875,8 +875,6 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return obj;
 
 fail:
-	if (obj)
-		drm_gem_object_unreference_unlocked(obj);
-
+	drm_gem_object_unreference_unlocked(obj);
 	return ERR_PTR(ret);
 }
-- 
2.9.0

