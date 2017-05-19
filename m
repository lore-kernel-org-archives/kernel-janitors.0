From: Colin King <colin.king@canonical.com>
Date: Fri, 19 May 2017 11:10:18 +0000
Subject: [PATCH] drm/pl111: make structure mode_config_funcs static
Message-Id: <20170519111018.19641-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

structure mode_config_funcs can be made static as it does not need to be
in global scope.  Fixes sparse warning:

warning: symbol 'mode_config_funcs' was not declared. Should it be static?

Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 936403f65508..7012411071ba 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -72,7 +72,7 @@
 
 #define DRIVER_DESC      "DRM module for PL111"
 
-struct drm_mode_config_funcs mode_config_funcs = {
+static struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_fb_cma_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
-- 
2.11.0

