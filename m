From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 18 Jan 2009 15:28:56 +0000
Subject: [PATCH 3/3] drivers/gpu/drm: comment out dead code
Message-Id: <20090118152856.4179.91855.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The functions:

  drm_crtc_from_fb
  drm_mode_validate_clocks

are not used, so comment them out.

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/drm_crtc.c  |    2 ++
 drivers/gpu/drm/drm_modes.c |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index d378306..c44bbde 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -254,6 +254,7 @@ void *drm_mode_object_find(struct drm_device *dev, uint32_t id, uint32_t type)
 }
 EXPORT_SYMBOL(drm_mode_object_find);
 
+#ifdef UNUSED
 /**
  * drm_crtc_from_fb - find the CRTC structure associated with an fb
  * @dev: DRM device
@@ -278,6 +279,7 @@ static struct drm_crtc *drm_crtc_from_fb(struct drm_device *dev,
 	}
 	return NULL;
 }
+#endif /* UNUSED */
 
 /**
  * drm_framebuffer_init - initialize a framebuffer
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c0cfe39..8ebcf51 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -341,6 +341,7 @@ void drm_mode_validate_size(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_mode_validate_size);
 
+#ifdef UNUSED
 /**
  * drm_mode_validate_clocks - validate modes against clock limits
  * @dev: DRM device
@@ -376,6 +377,7 @@ static void drm_mode_validate_clocks(struct drm_device *dev,
 			mode->status = MODE_CLOCK_RANGE;
 	}
 }
+#endif /* UNUSED */
 
 /**
  * drm_mode_prune_invalid - remove invalid modes from mode list

