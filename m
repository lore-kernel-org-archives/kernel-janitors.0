From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 17:11:51 +0000
Subject: [PATCH] drm/vmwgfx: remove redundant assignment to variable ret
Message-Id: <20191025171151.3493-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that
is never read and is being re-assigned on the next statement.
The assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index e5a283263211..b6a8ce23d3a8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -959,8 +959,6 @@ int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
 		return -ENOSYS;
 	}
 
-	ret = -ENOMEM;
-
 	ret = drm_vblank_init(dev, VMWGFX_NUM_DISPLAY_UNITS);
 	if (unlikely(ret != 0))
 		return ret;
-- 
2.20.1
