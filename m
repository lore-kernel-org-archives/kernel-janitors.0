From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Aug 2017 11:19:06 +0000
Subject: [PATCH] drm: Shift wrap bug in create_in_format_blob()
Message-Id: <20170809111906.4rv3hzritctfktv3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Ben Widawsky <ben@bwidawsk.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

"plane->format_count" can go up to 64.  (It's capped in
drm_universal_plane_init().)  So we should be using ULL type instead of
int here to prevent shift wrapping.

Fixes: db1689aa61bd ("drm: Create a format/modifier blob")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 5c14beee52ff..85ab1eec73e5 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -126,7 +126,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 							       plane->format_types[j],
 							       plane->modifiers[i])) {
 
-				mod->formats |= 1 << j;
+				mod->formats |= 1ULL << j;
 			}
 		}
 
