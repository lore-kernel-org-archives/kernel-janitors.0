From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Nov 2018 12:10:36 +0000
Subject: [PATCH -next] drm/cirrus: Remove set but not used variable 'bo'
Message-Id: <1542283836-152176-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Daniel Stone <daniels@collabora.com>, Thomas Zimmermann <tzimmermann@suse.de>, Adam Jackson <ajax@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/cirrus/cirrus_fbdev.c: In function 'cirrusfb_create':
drivers/gpu/drm/cirrus/cirrus_fbdev.c:172:20: warning:
 variable 'bo' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
f9aa76a85248 ("drm/kms: driver for virtual cirrus under qemu")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/cirrus/cirrus_fbdev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus_fbdev.c b/drivers/gpu/drm/cirrus/cirrus_fbdev.c
index 68ab182..4dd499c 100644
--- a/drivers/gpu/drm/cirrus/cirrus_fbdev.c
+++ b/drivers/gpu/drm/cirrus/cirrus_fbdev.c
@@ -169,7 +169,6 @@ static int cirrusfb_create(struct drm_fb_helper *helper,
 	struct drm_mode_fb_cmd2 mode_cmd;
 	void *sysram;
 	struct drm_gem_object *gobj = NULL;
-	struct cirrus_bo *bo = NULL;
 	int size, ret;
 
 	mode_cmd.width = sizes->surface_width;
@@ -185,8 +184,6 @@ static int cirrusfb_create(struct drm_fb_helper *helper,
 		return ret;
 	}
 
-	bo = gem_to_cirrus_bo(gobj);
-
 	sysram = vmalloc(size);
 	if (!sysram)
 		return -ENOMEM;
