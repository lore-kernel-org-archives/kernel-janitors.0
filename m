From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 08:33:50 +0000
Subject: [PATCH] drm/edid: checking for NULL instead of IS_ERR
Message-Id: <20170412083350.GD3250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

drm_mode_create_tile_group() uses error pointers, it doesn't return
NULL.  I re-arranged it a tiny bit to be more clear.

Fixes: 40d9b043a89e ("drm/connector: store tile information from displayid (v3)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fad3d44e4642..c6bc21673885 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4522,9 +4522,9 @@ static int drm_parse_tiled_block(struct drm_connector *connector,
 	tg = drm_mode_get_tile_group(connector->dev, tile->topology_id);
 	if (!tg) {
 		tg = drm_mode_create_tile_group(connector->dev, tile->topology_id);
+		if (IS_ERR(tg))
+			return PTR_ERR(tg);
 	}
-	if (!tg)
-		return -ENOMEM;
 
 	if (connector->tile_group != tg) {
 		/* if we haven't got a pointer,
