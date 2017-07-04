From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Jul 2017 16:48:21 +0000
Subject: [PATCH][drm-next] drm compat: ensure mode in drm_agp_info is being copied
Message-Id: <20170704164822.20177-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent compat change removed the copying of i32.mode from info.mode.
Add it back in to fix this removal as we currently are leaking information
from the stack.

Detected by CoverityScan, CID#1449374 ("Unitialized scalar variable")

Fixes: 2337f2272ee1 ("compat_drm: switch AGP compat ioctls to drm_ioctl_kernel()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_ioc32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 340eccfe35a1..94acf5109235 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -648,6 +648,7 @@ static int compat_drm_agp_info(struct file *file, unsigned int cmd,
 
 	i32.agp_version_major = info.agp_version_major;
 	i32.agp_version_minor = info.agp_version_minor;
+	i32.mode = info.mode;
 	i32.aperture_base = info.aperture_base;
 	i32.aperture_size = info.aperture_size;
 	i32.memory_allowed = info.memory_allowed;
-- 
2.11.0

