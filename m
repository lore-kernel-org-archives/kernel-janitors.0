From: Colin King <colin.king@canonical.com>
Date: Fri, 19 May 2017 11:02:03 +0000
Subject: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <20170519110203.19417-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

structure pl111_display_funcs can be made static as it does not need to be
in global scope.  Fixes sparse warning:

"warning: symbol 'pl111_display_funcs' was not declared. Should it
be static?"

Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 39a5c33bce7d..bd8ff82c2fd9 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -280,7 +280,7 @@ static int pl111_display_prepare_fb(struct drm_simple_display_pipe *pipe,
 	return drm_fb_cma_prepare_fb(&pipe->plane, plane_state);
 }
 
-const struct drm_simple_display_pipe_funcs pl111_display_funcs = {
+static const struct drm_simple_display_pipe_funcs pl111_display_funcs = {
 	.check = pl111_display_check,
 	.enable = pl111_display_enable,
 	.disable = pl111_display_disable,
-- 
2.11.0

