From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 08 Dec 2018 08:36:25 +0000
Subject: [PATCH -next] drm/ast: Remove set but not used variable 'bo'
Message-Id: <1544258185-50430-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Sam Bobroff <sbobroff@linux.ibm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/ast/ast_fb.c: In function 'astfb_create':
drivers/gpu/drm/ast/ast_fb.c:194:17: warning:
 variable 'bo' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit 312fec1405dd ("drm: Initial KMS
driver for AST (ASpeed Technologies) 2000 series (v2)")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/ast/ast_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.c
index de26df0..c2e4136 100644
--- a/drivers/gpu/drm/ast/ast_fb.c
+++ b/drivers/gpu/drm/ast/ast_fb.c
@@ -191,7 +191,6 @@ static int astfb_create(struct drm_fb_helper *helper,
 	int size, ret;
 	void *sysram;
 	struct drm_gem_object *gobj = NULL;
-	struct ast_bo *bo = NULL;
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = mode_cmd.width * ((sizes->surface_bpp + 7)/8);
@@ -206,7 +205,6 @@ static int astfb_create(struct drm_fb_helper *helper,
 		DRM_ERROR("failed to create fbcon backing object %d\n", ret);
 		return ret;
 	}
-	bo = gem_to_ast_bo(gobj);
 
 	sysram = vmalloc(size);
 	if (!sysram)
