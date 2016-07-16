From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 06:40:29 +0000
Subject: [PATCH] drm/cirrus: Delete an unnecessary check before drm_gem_object_unreference_unlocked()
Message-Id: <bebf88d8-cc28-657a-e96c-58447d8cf376@users.sourceforge.net>
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
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 08:28:13 +0200

The drm_gem_object_unreference_unlocked() function tests whether
its argument is NULL and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/cirrus/cirrus_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus_main.c b/drivers/gpu/drm/cirrus/cirrus_main.c
index 32d32c5..80446e2 100644
--- a/drivers/gpu/drm/cirrus/cirrus_main.c
+++ b/drivers/gpu/drm/cirrus/cirrus_main.c
@@ -17,8 +17,8 @@
 static void cirrus_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct cirrus_framebuffer *cirrus_fb = to_cirrus_framebuffer(fb);
-	if (cirrus_fb->obj)
-		drm_gem_object_unreference_unlocked(cirrus_fb->obj);
+
+	drm_gem_object_unreference_unlocked(cirrus_fb->obj);
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
 }
-- 
2.9.1

