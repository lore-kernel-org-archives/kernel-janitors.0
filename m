From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 07:00:38 +0000
Subject: [PATCH] drm: Fix an error pointer dereference()
Message-Id: <20181217065733.GA12159@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org

The drm_mode_create_tile_group() is only called from
drm_parse_tiled_block() and the caller expects it to return a NULL on
error.  In other words, this function should match
drm_mode_get_tile_group().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent a version of this patch last year which updated
drm_parse_tiled_block() to check for error pointers.  Daniel Vetter
said that there was another caller in the msm code, but I don't think
there is now.


 drivers/gpu/drm/drm_connector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da8ae80c2750..3971174f6aed 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2077,7 +2077,7 @@ EXPORT_SYMBOL(drm_mode_get_tile_group);
  * identifier for the tile group.
  *
  * RETURNS:
- * new tile group or error.
+ * new tile group or NULL.
  */
 struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 						  char topology[8])
@@ -2087,7 +2087,7 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 
 	tg = kzalloc(sizeof(*tg), GFP_KERNEL);
 	if (!tg)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	kref_init(&tg->refcount);
 	memcpy(tg->group_data, topology, 8);
@@ -2099,7 +2099,7 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 		tg->id = ret;
 	} else {
 		kfree(tg);
-		tg = ERR_PTR(ret);
+		tg = NULL;
 	}
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-- 
2.17.1
