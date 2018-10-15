From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Mon, 15 Oct 2018 17:05:29 +0000
Subject: [PATCH v2] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

For historical reason, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace make detailed verification of the problem and take
some action. In particular, the validation of “if (!dev->irq_enabled)”
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL which does not represent
the real issue; this patch changes this behavior by return EOPNOTSUPP.
Additionally, some operations are unsupported by this function, and
returns EINVAL; this patch also changes the return value to EOPNOTSUPP
in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
libdrm, which is used by many compositors; because of this, it is
important to check if this change breaks any compositor. In this sense,
the following projects were examined:

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

Change since V1:
 Daniel Vetter and Chris Wilson
 - Replace ENOTTY by EOPNOTSUPP
 - Return EINVAL if the parameters are wrong

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 98e091175921..80f5a3bb427e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	unsigned int flags, pipe, high_pipe;
 
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
-- 
2.19.1
