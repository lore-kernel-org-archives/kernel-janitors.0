From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 09:23:06 +0000
Subject: [PATCH][drm-next] drm/tinydrm: make function st7586_pipe_enable static
Message-Id: <20170816092306.10969-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function st7586_pipe_enable  is local to the source
and does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'st7586_pipe_enable' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/tinydrm/st7586.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tinydrm/st7586.c b/drivers/gpu/drm/tinydrm/st7586.c
index 1b39d3fb17f7..e4f88564b18f 100644
--- a/drivers/gpu/drm/tinydrm/st7586.c
+++ b/drivers/gpu/drm/tinydrm/st7586.c
@@ -172,7 +172,7 @@ static const struct drm_framebuffer_funcs st7586_fb_funcs = {
 	.dirty		= st7586_fb_dirty,
 };
 
-void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
+static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 			struct drm_crtc_state *crtc_state)
 {
 	struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
-- 
2.11.0

