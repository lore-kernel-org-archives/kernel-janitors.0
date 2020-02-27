From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Feb 2020 06:50:57 +0000
Subject: [PATCH -next] drm/tidss: Drop pointless static qualifier in dispc_find_csc()
Message-Id: <20200227065057.92766-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

There is no need to have the 'const struct dispc_csc_coef *coef'
variable static since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index eeb160dc047b..e6cb176484a9 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1510,7 +1510,7 @@ struct dispc_csc_coef *dispc_find_csc(enum drm_color_encoding encoding,
 static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
 				const struct drm_plane_state *state)
 {
-	static const struct dispc_csc_coef *coef;
+	const struct dispc_csc_coef *coef;
 
 	coef = dispc_find_csc(state->color_encoding, state->color_range);
 	if (!coef) {
