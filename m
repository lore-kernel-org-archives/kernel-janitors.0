From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 10:57:00 +0000
Subject: [PATCH] drm/amd/display: remove an unnecessary NULL check
Message-Id: <20200714105700.GC294318@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>
Cc: kernel-janitors@vger.kernel.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The "stream" pointer can't be NULL and it's dereferenced on the line
before so the check doesn't make sense.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4f97329d9daf..7e58f242dab9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2324,7 +2324,7 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
 		if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
-			if (stream && should_use_dmub_lock(stream->link)) {
+			if (should_use_dmub_lock(stream->link)) {
 				union dmub_hw_lock_flags hw_locks = { 0 };
 				struct dmub_hw_lock_inst_flags inst_flags = { 0 };
 
-- 
2.27.0
