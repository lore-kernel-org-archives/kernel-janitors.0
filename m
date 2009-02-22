From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:01:42 +0000
Subject: [PATCH 03/16] drm: radeon: fix sparse warnings: Using plain integer
Message-Id: <20090222000122.17557.75097.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/gpu/drm/radeon/radeon_cp.c:1363:52: warning: Using plain integer as NULL pointer
  drivers/gpu/drm/radeon/radeon_state.c:1983:61: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/radeon/radeon_cp.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_state.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cp.c b/drivers/gpu/drm/radeon/radeon_cp.c
index 119e642..f5f4e96 100644
--- a/drivers/gpu/drm/radeon/radeon_cp.c
+++ b/drivers/gpu/drm/radeon/radeon_cp.c
@@ -1360,7 +1360,7 @@ static int radeon_do_cleanup_cp(struct drm_device * dev)
 		if (dev_priv->gart_info.gart_table_location = DRM_ATI_GART_FB)
 		{
 			drm_core_ioremapfree(&dev_priv->gart_info.mapping, dev);
-			dev_priv->gart_info.addr = 0;
+			dev_priv->gart_info.addr = NULL;
 		}
 	}
 	/* only clear to the start of flags */
diff --git a/drivers/gpu/drm/radeon/radeon_state.c b/drivers/gpu/drm/radeon/radeon_state.c
index 043293a..61e75bc 100644
--- a/drivers/gpu/drm/radeon/radeon_state.c
+++ b/drivers/gpu/drm/radeon/radeon_state.c
@@ -1980,7 +1980,7 @@ static int alloc_surface(drm_radeon_surface_alloc_t *new,
 
 	/* find a virtual surface */
 	for (i = 0; i < 2 * RADEON_MAX_SURFACES; i++)
-		if (dev_priv->virt_surfaces[i].file_priv = 0)
+		if (dev_priv->virt_surfaces[i].file_priv = NULL)
 			break;
 	if (i = 2 * RADEON_MAX_SURFACES) {
 		return -1;

