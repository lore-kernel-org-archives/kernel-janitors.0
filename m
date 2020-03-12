From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 11:32:31 +0000
Subject: [PATCH] drm/amd/display: clean up a condition in dmub_psr_copy_settings()
Message-Id: <20200312113231.GD20562@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nathan Chancellor <natechancellor@gmail.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

We can remove the NULL check for "res_ctx" and
"res_ctx->pipe_ctx[i].stream->link".  Also it's nicer to align the
conditions using spaces so I re-indented a bit.

Longer explanation: The "res_ctx" pointer points to an address in the
middle of a struct so it can't be NULL.  For
"res_ctx->pipe_ctx[i].stream->link" we know that it is equal to "link"
and "link" is non-NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 9c88a92bd96a..bc109d4fc6e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -134,11 +134,9 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	int i = 0;
 
 	for (i = 0; i < MAX_PIPES; i++) {
-		if (res_ctx &&
-			res_ctx->pipe_ctx[i].stream &&
-			res_ctx->pipe_ctx[i].stream->link &&
-			res_ctx->pipe_ctx[i].stream->link = link &&
-			res_ctx->pipe_ctx[i].stream->link->connector_signal = SIGNAL_TYPE_EDP) {
+		if (res_ctx->pipe_ctx[i].stream &&
+		    res_ctx->pipe_ctx[i].stream->link = link &&
+		    res_ctx->pipe_ctx[i].stream->link->connector_signal = SIGNAL_TYPE_EDP) {
 			pipe_ctx = &res_ctx->pipe_ctx[i];
 			break;
 		}
-- 
2.20.1
