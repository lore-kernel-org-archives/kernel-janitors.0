From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:14:18 +0000
Subject: [PATCH v2 04/15] NULL noise: drivers/gpu/drm/radeon/radeon_*.c
Message-Id: <20090305191413.30062.67683.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>

Fix this sparse warning:
  drivers/gpu/drm/radeon/r600_cp.c:1811:52: warning: Using plain integer as NULL pointer
  drivers/gpu/drm/radeon/radeon_cp.c:1363:52: warning: Using plain integer as NULL pointer
  drivers/gpu/drm/radeon/radeon_state.c:1983:61: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 drivers/gpu/drm/radeon/r600_cp.c      |    2 +-
 drivers/gpu/drm/radeon/radeon_cp.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_state.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cp.c b/drivers/gpu/drm/radeon/r600_cp.c
index 37249b2..2d9147d 100644
--- a/drivers/gpu/drm/radeon/r600_cp.c
+++ b/drivers/gpu/drm/radeon/r600_cp.c
@@ -1808,7 +1808,7 @@ int r600_do_cleanup_cp(struct drm_device *dev)
 
 		if (dev_priv->gart_info.gart_table_location = DRM_ATI_GART_FB) {
 			drm_core_ioremapfree(&dev_priv->gart_info.mapping, dev);
-			dev_priv->gart_info.addr = 0;
+			dev_priv->gart_info.addr = NULL;
 		}
 	}
 	/* only clear to the start of flags */
diff --git a/drivers/gpu/drm/radeon/radeon_cp.c b/drivers/gpu/drm/radeon/radeon_cp.c
index 15cfe56..0c49230 100644
--- a/drivers/gpu/drm/radeon/radeon_cp.c
+++ b/drivers/gpu/drm/radeon/radeon_cp.c
@@ -1541,7 +1541,7 @@ static int radeon_do_cleanup_cp(struct drm_device * dev)
 		if (dev_priv->gart_info.gart_table_location = DRM_ATI_GART_FB)
 		{
 			drm_core_ioremapfree(&dev_priv->gart_info.mapping, dev);
-			dev_priv->gart_info.addr = 0;
+			dev_priv->gart_info.addr = NULL;
 		}
 	}
 	/* only clear to the start of flags */
diff --git a/drivers/gpu/drm/radeon/radeon_state.c b/drivers/gpu/drm/radeon/radeon_state.c
index ca00cef..fa728ec 100644
--- a/drivers/gpu/drm/radeon/radeon_state.c
+++ b/drivers/gpu/drm/radeon/radeon_state.c
@@ -1986,7 +1986,7 @@ static int alloc_surface(drm_radeon_surface_alloc_t *new,
 
 	/* find a virtual surface */
 	for (i = 0; i < 2 * RADEON_MAX_SURFACES; i++)
-		if (dev_priv->virt_surfaces[i].file_priv = 0)
+		if (dev_priv->virt_surfaces[i].file_priv = NULL)
 			break;
 	if (i = 2 * RADEON_MAX_SURFACES) {
 		return -1;

