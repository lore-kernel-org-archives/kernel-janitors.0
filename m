From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Nov 2019 16:29:45 +0000
Subject: [PATCH][next] drm/amd/display: remove redundant variable status
Message-Id: <20191108162945.180624-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530161219.2507-1-colin.king@canonical.com>
In-Reply-To: <20190530161219.2507-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable status is redundant, it is being initialized with a value
that is over-written later and this is being returned immediately
after the assignment.  Clean up the code by removing status and
just returning the value returned from the call to function
dc->hwss.dmdata_status_done.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 371d49e9b745..88a84bfaea6f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -565,7 +565,6 @@ bool dc_stream_get_scanoutpos(const struct dc_stream_state *stream,
 
 bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream)
 {
-	bool status = true;
 	struct pipe_ctx *pipe = NULL;
 	int i;
 
@@ -581,8 +580,7 @@ bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream)
 	if (i = MAX_PIPES)
 		return true;
 
-	status = dc->hwss.dmdata_status_done(pipe);
-	return status;
+	return dc->hwss.dmdata_status_done(pipe);
 }
 
 bool dc_stream_set_dynamic_metadata(struct dc *dc,
-- 
2.20.1
