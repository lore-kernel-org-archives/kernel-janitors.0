From: Michael Veeck <michael.veeck@gmx.net>
Date: Wed, 10 Aug 2005 21:32:36 +0000
Subject: [KJ] [PATCH] remove unneeded DRM_ARRAY_SIZE macro and references
Message-Id: <42FA7274.2090000@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

description:
drivers/char/drm/drmP.h defines a macro DRM_ARRAY_SIZE(x) for 
determining the size of an array. kernel.h already provides one so this 
one can be removed and its uses in the other files changed to use the 
kernel one.

patch is against latest git-tree from Linus since I wanted to get to 
know (co)git(o)

Signed-off-by: Michael Veeck <michael@veeck.de>

diff --git a/drivers/char/drm/drmP.h b/drivers/char/drm/drmP.h
--- a/drivers/char/drm/drmP.h
+++ b/drivers/char/drm/drmP.h
@@ -257,7 +257,6 @@ static inline struct page * vmalloc_to_p
  /** \name Internal types and structures */
  /*@{*/

-#define DRM_ARRAY_SIZE(x) (sizeof(x)/sizeof(x[0]))
  #define DRM_MIN(a,b) ((a)<(b)?(a):(b))
  #define DRM_MAX(a,b) ((a)>(b)?(a):(b))

diff --git a/drivers/char/drm/drm_drv.c b/drivers/char/drm/drm_drv.c
--- a/drivers/char/drm/drm_drv.c
+++ b/drivers/char/drm/drm_drv.c
@@ -15,7 +15,7 @@
   * #define DRIVER_DESC		"Matrox G200/G400"
   * #define DRIVER_DATE		"20001127"
   *
- * #define DRIVER_IOCTL_COUNT	DRM_ARRAY_SIZE( mga_ioctls )
+ * #define DRIVER_IOCTL_COUNT	ARRAY_SIZE( mga_ioctls )
   *
   * #define drm_x		mga_##x
   * \endcode
@@ -118,7 +118,7 @@ static drm_ioctl_desc_t		  drm_ioctls[]
  	[DRM_IOCTL_NR(DRM_IOCTL_WAIT_VBLANK)]   = { drm_wait_vblank, 0, 0 },
  };

-#define DRIVER_IOCTL_COUNT	DRM_ARRAY_SIZE( drm_ioctls )
+#define DRIVER_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )

  /**
   * Take down the DRM device.
diff --git a/drivers/char/drm/drm_fops.c b/drivers/char/drm/drm_fops.c
--- a/drivers/char/drm/drm_fops.c
+++ b/drivers/char/drm/drm_fops.c
@@ -63,7 +63,7 @@ static int drm_setup( drm_device_t *dev
  			return i;
  	}

-	for ( i = 0 ; i < DRM_ARRAY_SIZE(dev->counts) ; i++ )
+	for ( i = 0 ; i < ARRAY_SIZE(dev->counts) ; i++ )
  		atomic_set( &dev->counts[i], 0 );

  	for ( i = 0 ; i < DRM_HASH_SIZE ; i++ ) {
diff --git a/drivers/char/drm/drm_ioctl.c b/drivers/char/drm/drm_ioctl.c
diff --git a/drivers/char/drm/i810_dma.c b/drivers/char/drm/i810_dma.c
--- a/drivers/char/drm/i810_dma.c
+++ b/drivers/char/drm/i810_dma.c
@@ -1382,4 +1382,4 @@ drm_ioctl_desc_t i810_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_I810_FLIP)]    = { i810_flip_bufs,   1, 0 }
  };

-int i810_max_ioctl = DRM_ARRAY_SIZE(i810_ioctls);
+int i810_max_ioctl = ARRAY_SIZE(i810_ioctls);
diff --git a/drivers/char/drm/i830_dma.c b/drivers/char/drm/i830_dma.c
--- a/drivers/char/drm/i830_dma.c
+++ b/drivers/char/drm/i830_dma.c
@@ -1585,4 +1585,4 @@ drm_ioctl_desc_t i830_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_I830_SETPARAM)] = { i830_setparam,    1, 0 }
  };

-int i830_max_ioctl = DRM_ARRAY_SIZE(i830_ioctls);
+int i830_max_ioctl = ARRAY_SIZE(i830_ioctls);
diff --git a/drivers/char/drm/mga_state.c b/drivers/char/drm/mga_state.c
--- a/drivers/char/drm/mga_state.c
+++ b/drivers/char/drm/mga_state.c
@@ -1120,4 +1120,4 @@ drm_ioctl_desc_t mga_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_MGA_GETPARAM)]= { mga_getparam,    1, 0 },
  };

-int mga_max_ioctl = DRM_ARRAY_SIZE(mga_ioctls);
+int mga_max_ioctl = ARRAY_SIZE(mga_ioctls);
diff --git a/drivers/char/drm/r128_state.c b/drivers/char/drm/r128_state.c
--- a/drivers/char/drm/r128_state.c
+++ b/drivers/char/drm/r128_state.c
@@ -1733,4 +1733,4 @@ drm_ioctl_desc_t r128_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_R128_GETPARAM)]   = { r128_getparam, 1, 0 },
  };

-int r128_max_ioctl = DRM_ARRAY_SIZE(r128_ioctls);
+int r128_max_ioctl = ARRAY_SIZE(r128_ioctls);
diff --git a/drivers/char/drm/radeon_state.c 
b/drivers/char/drm/radeon_state.c
--- a/drivers/char/drm/radeon_state.c
+++ b/drivers/char/drm/radeon_state.c
@@ -3099,4 +3099,4 @@ drm_ioctl_desc_t radeon_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_RADEON_SURF_FREE)]  = { radeon_surface_free, 1, 0 }
  };

-int radeon_max_ioctl = DRM_ARRAY_SIZE(radeon_ioctls);
+int radeon_max_ioctl = ARRAY_SIZE(radeon_ioctls);
diff --git a/drivers/char/drm/sis_mm.c b/drivers/char/drm/sis_mm.c
--- a/drivers/char/drm/sis_mm.c
+++ b/drivers/char/drm/sis_mm.c
@@ -413,5 +413,5 @@ drm_ioctl_desc_t sis_ioctls[] = {
  	[DRM_IOCTL_NR(DRM_SIS_FB_INIT)]   = { sis_fb_init,         1, 1 }
  };

-int sis_max_ioctl = DRM_ARRAY_SIZE(sis_ioctls);
+int sis_max_ioctl = ARRAY_SIZE(sis_ioctls);

diff --git a/drivers/char/drm/via_drv.c b/drivers/char/drm/via_drv.c
--- a/drivers/char/drm/via_drv.c
+++ b/drivers/char/drm/via_drv.c
@@ -91,7 +91,7 @@ static struct drm_driver driver = {
  	.postinit = postinit,
  	.version = version,
  	.ioctls = ioctls,
-	.num_ioctls = DRM_ARRAY_SIZE(ioctls),
+	.num_ioctls = ARRAY_SIZE(ioctls),
  	.fops = {
  		.owner = THIS_MODULE,
  		.open = drm_open,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
