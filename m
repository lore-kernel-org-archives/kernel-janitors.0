From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 20:44:32 +0000
Subject: [PATCH] drm/virtgpu: Delete unnecessary checks before drm_gem_object_unreference_unlocked()
Message-Id: <5e3dafff-72bb-e616-e84a-368f78fa66b1@users.sourceforge.net>
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
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 22:38:42 +0200

The drm_gem_object_unreference_unlocked() function tests whether
its argument is NULL and then returns immediately.
Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ac758cd..fdfc711 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -53,8 +53,7 @@ static void virtio_gpu_user_framebuffer_destroy(struct drm_framebuffer *fb)
 	struct virtio_gpu_framebuffer *virtio_gpu_fb
 		= to_virtio_gpu_framebuffer(fb);
 
-	if (virtio_gpu_fb->obj)
-		drm_gem_object_unreference_unlocked(virtio_gpu_fb->obj);
+	drm_gem_object_unreference_unlocked(virtio_gpu_fb->obj);
 	drm_framebuffer_cleanup(fb);
 	kfree(virtio_gpu_fb);
 }
@@ -326,8 +325,7 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	ret = virtio_gpu_framebuffer_init(dev, virtio_gpu_fb, mode_cmd, obj);
 	if (ret) {
 		kfree(virtio_gpu_fb);
-		if (obj)
-			drm_gem_object_unreference_unlocked(obj);
+		drm_gem_object_unreference_unlocked(obj);
 		return NULL;
 	}
 
-- 
2.9.1

