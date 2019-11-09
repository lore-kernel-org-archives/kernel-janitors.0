From: Colin King <colin.king@canonical.com>
Date: Sat, 09 Nov 2019 19:49:23 +0000
Subject: [PATCH][next] drm/amd/display: fix spelling mistake "exeuction" -> "execution"
Message-Id: <20191109194923.231655-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in a DC_ERROR message and a comment.
Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c    | 2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 61cefe0a3790..b65b66025267 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -92,7 +92,7 @@ void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv)
 
 	status = dmub_srv_cmd_execute(dmub);
 	if (status != DMUB_STATUS_OK)
-		DC_ERROR("Error starting DMUB exeuction: status=%d\n", status);
+		DC_ERROR("Error starting DMUB execution: status=%d\n", status);
 }
 
 void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv)
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
index aa8f0396616d..45e427d1952e 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
@@ -416,7 +416,7 @@ enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
  * dmub_srv_cmd_execute() - Executes a queued sequence to the dmub
  * @dmub: the dmub service
  *
- * Begins exeuction of queued commands on the dmub.
+ * Begins execution of queued commands on the dmub.
  *
  * Return:
  *   DMUB_STATUS_OK - success
-- 
2.20.1
