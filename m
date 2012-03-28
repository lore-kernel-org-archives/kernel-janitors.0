From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2012 06:59:42 +0000
Subject: [patch] drm/i915/bios: cleanup return type of intel_parse_bios()
Message-Id: <20120328065942.GC9113@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Packard <keithp@keithp.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

These are unintuitive.  These are type bool and return -1 casted to true
on failure.  Let's just make it return an int.  The callers don't care,
but let's change this as a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
index 70f1bf0..4c86a83 100644
--- a/drivers/gpu/drm/gma500/intel_bios.h
+++ b/drivers/gpu/drm/gma500/intel_bios.h
@@ -303,7 +303,7 @@ struct bdb_sdvo_lvds_options {
 } __attribute__((packed));
 
 
-extern bool psb_intel_init_bios(struct drm_device *dev);
+extern int psb_intel_init_bios(struct drm_device *dev);
 extern void psb_intel_destroy_bios(struct drm_device *dev);
 
 /*
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index d4d0c5b..b59422e 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -231,7 +231,7 @@ static void parse_general_features(struct drm_psb_private *dev_priv,
  *
  * Returns 0 on success, nonzero on failure.
  */
-bool psb_intel_init_bios(struct drm_device *dev)
+int psb_intel_init_bios(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct pci_dev *pdev = dev->pdev;
diff --git a/drivers/gpu/drm/i915/intel_bios.h b/drivers/gpu/drm/i915/intel_bios.h
index dbda6e3..31c2107 100644
--- a/drivers/gpu/drm/i915/intel_bios.h
+++ b/drivers/gpu/drm/i915/intel_bios.h
@@ -476,7 +476,7 @@ struct bdb_edp {
 } __attribute__ ((packed));
 
 void intel_setup_bios(struct drm_device *dev);
-bool intel_parse_bios(struct drm_device *dev);
+int intel_parse_bios(struct drm_device *dev);
 
 /*
  * Driver<->VBIOS interaction occurs through scratch bits in
diff --git a/drivers/gpu/drm/i915/intel_bios.c b/drivers/gpu/drm/i915/intel_bios.c
index 8168d8f..9c2b855 100644
--- a/drivers/gpu/drm/i915/intel_bios.c
+++ b/drivers/gpu/drm/i915/intel_bios.c
@@ -630,7 +630,7 @@ init_vbt_defaults(struct drm_i915_private *dev_priv)
  *
  * Returns 0 on success, nonzero on failure.
  */
-bool
+int
 intel_parse_bios(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = dev->dev_private;
