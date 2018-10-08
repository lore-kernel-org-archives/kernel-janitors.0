From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Mon, 08 Oct 2018 14:52:20 +0000
Subject: [PATCH] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20181008145220.p34dllgsiw6rlpod@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

For historical reason, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace make detailed verification of the problem and take
some action. In particular, the validation of “if (!dev->irq_enabled)”
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL which does not represent
the real issue; this patch changes this behavior by return ENOTTY
(Inappropriate ioctl for device). Additionally, some operations are
unsupported by this function, and returns EINVAL; this patch changes the
return value to EOPNOTSUPP (Operation not supported). Lastly, the
function drm_wait_vblank_ioctl is invoked by libdrm, which is used by
many compositors; because of this, it is important to check if this
change breaks any compositor. In this sense, the following projects were
examined:

* Drm-hwcomposer
* Kwin
* Sway
* Wlroots
* Wayland-core
* Weston
* Xorg (67 different drivers)

For each repository the verification happened in three steps:

* Update the main branch
* Look for any occurrence "drmWaitVBlank" with the command:
  git grep -n "drmWaitVBlank"
* Look in the git history of the project with the command:
  git log -SdrmWaitVBlank

Finally, none of the above projects validate the use of EINVAL which
make safe, at least for these projects, to change the return values.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 98e091175921..88ec6fb49afb 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	unsigned int flags, pipe, high_pipe;
 
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -ENOTTY;
 
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
@@ -1545,7 +1545,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 			  vblwait->request.type,
 			  (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
 			   _DRM_VBLANK_HIGH_CRTC_MASK));
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
 
 	flags = vblwait->request.type & _DRM_VBLANK_FLAGS_MASK;
-- 
2.19.0
