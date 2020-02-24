From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 15:15:30 +0000
Subject: [PATCH][next] drm/tidss: fix spelling mistake "bufer" -> "buffer"
Message-Id: <20200224151530.360369-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index eeb160dc047b..d49f2d6d57df 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1699,7 +1699,7 @@ static int dispc_vid_calc_scaling(struct dispc_device *dispc,
 
 		if (sp->xinc > f->xinc_max) {
 			dev_dbg(dispc->dev,
-				"%s: Too wide input bufer %u > %u\n", __func__,
+				"%s: Too wide input buffer %u > %u\n", __func__,
 				state->src_w >> 16, in_width_max * f->xinc_max);
 			return -EINVAL;
 		}
-- 
2.25.0
