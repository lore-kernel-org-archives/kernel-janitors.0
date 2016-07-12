From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 12 Jul 2016 20:22:13 +0000
Subject: [PATCH] GPU-DRM-Radeon: Delete an unnecessary check before drm_gem_object_unreference_unlocked()
Message-Id: <a844238b-7f5d-e528-5010-b55551e30723@users.sourceforge.net>
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
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 12 Jul 2016 22:00:55 +0200

The drm_gem_object_unreference_unlocked() function tests whether
its argument is NULL and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 5f1cd69..1efab5f 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1324,9 +1324,7 @@ static void radeon_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct radeon_framebuffer *radeon_fb = to_radeon_framebuffer(fb);
 
-	if (radeon_fb->obj) {
-		drm_gem_object_unreference_unlocked(radeon_fb->obj);
-	}
+	drm_gem_object_unreference_unlocked(radeon_fb->obj);
 	drm_framebuffer_cleanup(fb);
 	kfree(radeon_fb);
 }
-- 
2.9.0

