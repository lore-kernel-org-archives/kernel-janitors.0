From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Sep 2017 16:05:16 +0000
Subject: [PATCH][drm-next] drm/tve200: make two functions static
Message-Id: <20170922160516.16283-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions tve200_display_disable and tve200_display_funcs are
local to the source and do not need to be in global scope, so make
them static.

Cleans up sparse warnings:
symbol 'tve200_display_disable' was not declared. Should it be static?
symbol 'tve200_display_funcs' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/tve200/tve200_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 18457de47bbc..904e38b93530 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -221,7 +221,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	drm_crtc_vblank_on(crtc);
 }
 
-void tve200_display_disable(struct drm_simple_display_pipe *pipe)
+static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
@@ -293,7 +293,7 @@ static int tve200_display_prepare_fb(struct drm_simple_display_pipe *pipe,
 	return drm_fb_cma_prepare_fb(&pipe->plane, plane_state);
 }
 
-const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
+static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
 	.check = tve200_display_check,
 	.enable = tve200_display_enable,
 	.disable = tve200_display_disable,
-- 
2.14.1

