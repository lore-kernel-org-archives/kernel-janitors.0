From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Jul 2018 10:42:54 +0000
Subject: [PATCH] drm/amd/display: add missing void parameter to dc_create_transfer_func
Message-Id: <20180731104254.14683-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Add a missing void parameter to function dc_create_transfer_func, fixes
sparse warning:

warning: non-ANSI function declaration of function 'dc_create_transfer_func'

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
index 815dfb50089b..8fb3aefd195c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
@@ -192,7 +192,7 @@ void dc_transfer_func_release(struct dc_transfer_func *tf)
 	kref_put(&tf->refcount, dc_transfer_func_free);
 }
 
-struct dc_transfer_func *dc_create_transfer_func()
+struct dc_transfer_func *dc_create_transfer_func(void)
 {
 	struct dc_transfer_func *tf = kvzalloc(sizeof(*tf), GFP_KERNEL);
 
-- 
2.17.1

