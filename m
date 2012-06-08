From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 08 Jun 2012 17:38:50 +0000
Subject: [PATCH] drm: Remove duplicate assignment
Message-Id: <1339177130-677-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Lets remove the double assignment of the
function pointer disable.

Sparse gives a warning:
drivers/gpu/drm/ast/ast_mode.c:583:10: warning:
	Initializer entry defined twice
	drivers/gpu/drm/ast/ast_mode.c:585:10:
	also defined here

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 65f9d23..967c6cf 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -580,7 +580,6 @@ static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.mode_fixup = ast_crtc_mode_fixup,
 	.mode_set = ast_crtc_mode_set,
 	.mode_set_base = ast_crtc_mode_set_base,
-	.disable = ast_crtc_disable,
 	.load_lut = ast_crtc_load_lut,
 	.disable = ast_crtc_disable,
 	.prepare = ast_crtc_prepare,
-- 
1.7.10

