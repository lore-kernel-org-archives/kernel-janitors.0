From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 02 Aug 2018 08:57:24 +0000
Subject: [PATCH -next] drm/vkms: Fix the error handling in vkms_init()
Message-Id: <1533200699-124300-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In the drm_vblank_init() error handling case, platform device
unregister is missing. This patch fix it.

Fixes: 3a0709928b17 ("drm/vkms: Add vblank events simulated by hrtimers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6e728b8..5ad09d4 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -110,7 +110,7 @@ static int __init vkms_init(void)
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_fini;
+		goto out_unregister;
 	}
 
 	ret = vkms_modeset_init(vkms_device);

