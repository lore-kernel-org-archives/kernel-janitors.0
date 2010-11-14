From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 14 Nov 2010 20:08:27 +0000
Subject: [PATCH] drm: radeon: fix error value sign
Message-Id: <1289765309-5983-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Darren Jenkins <darrenrjenkins@gmail.com>, Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

enable_vblank implementations should use negative result to indicate error.
radeon_enable_vblank() returns EINVAL in this case.  Change this to -EINVAL.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 drivers/gpu/drm/radeon/radeon_irq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_irq.c b/drivers/gpu/drm/radeon/radeon_irq.c
index 2f349a3..465746b 100644
--- a/drivers/gpu/drm/radeon/radeon_irq.c
+++ b/drivers/gpu/drm/radeon/radeon_irq.c
@@ -76,7 +76,7 @@ int radeon_enable_vblank(struct drm_device *dev, int crtc)
 		default:
 			DRM_ERROR("tried to enable vblank on non-existent crtc %d\n",
 				  crtc);
-			return EINVAL;
+			return -EINVAL;
 		}
 	} else {
 		switch (crtc) {
@@ -89,7 +89,7 @@ int radeon_enable_vblank(struct drm_device *dev, int crtc)
 		default:
 			DRM_ERROR("tried to enable vblank on non-existent crtc %d\n",
 				  crtc);
-			return EINVAL;
+			return -EINVAL;
 		}
 	}
 
-- 
1.7.0.4

