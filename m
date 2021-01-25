From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:45:08 +0000
Subject: [PATCH] drm/amd/display: Fix a potential NULL dereference
Message-Id: <YA6FFK+F1XbGbYVJ@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, George Shen <george.shen@amd.com>
Cc: kernel-janitors@vger.kernel.org, Anson Jacob <anson.jacob@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>, Jaehyun Chung <jaehyun.chung@amd.com>, Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Melissa Wen <melissa.srw@gmail.com>, David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The debug printk dereferences "link->link_enc" before we have ensured
that it is non-NULL.  Fix this potential NULL derefence by moving the
printk after the check.

Fixes: 1975b95ad4e7 ("drm/amd/display: Log link/connector info provided in BIOS object table")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index c16af3983fdb..4d31b2fae1f9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1525,13 +1525,13 @@ static bool dc_link_construct(struct dc_link *link,
 	link->link_enc  		link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
 
-	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
-
 	if (!link->link_enc) {
 		DC_ERROR("Failed to create link encoder!\n");
 		goto link_enc_create_fail;
 	}
 
+	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
+
 	link->link_enc_hw_inst = link->link_enc->transmitter;
 
 	for (i = 0; i < 4; i++) {
-- 
2.29.2
