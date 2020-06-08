From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 14:16:57 +0000
Subject: [PATCH] drm/amd/display: Fix indenting in dcn30_set_output_transfer_func()
Message-Id: <20200608141657.GB1912173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

These lines are a part of the if statement and they are supposed to
be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index ab20320ebc994..37c310dbb3665 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
 					stream->out_transfer_func,
 					&mpc->blender_params, false))
 				params = &mpc->blender_params;
-		 /* there are no ROM LUTs in OUTGAM */
-		if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
-			BREAK_TO_DEBUGGER();
+			 /* there are no ROM LUTs in OUTGAM */
+			if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
+				BREAK_TO_DEBUGGER();
 		}
 	}
 
-- 
2.26.2
