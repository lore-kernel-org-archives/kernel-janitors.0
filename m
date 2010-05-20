From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:33:46 +0000
Subject: [PATCH 03/11] drm/i915: Storage class should be before const qualifier
Message-Id: <1274344426-8860-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: Tobias Klauser <tklauser@distanz.ch>, kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/gpu/drm/i915/i915_drv.c |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 5c51e45..68874d2 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -60,95 +60,95 @@ extern int intel_agp_enabled;
 	.subdevice = PCI_ANY_ID,		\
 	.driver_data = (unsigned long) info }
 
-const static struct intel_device_info intel_i830_info = {
+static const struct intel_device_info intel_i830_info = {
 	.is_i8xx = 1, .is_mobile = 1, .cursor_needs_physical = 1,
 };
 
-const static struct intel_device_info intel_845g_info = {
+static const struct intel_device_info intel_845g_info = {
 	.is_i8xx = 1,
 };
 
-const static struct intel_device_info intel_i85x_info = {
+static const struct intel_device_info intel_i85x_info = {
 	.is_i8xx = 1, .is_i85x = 1, .is_mobile = 1,
 	.cursor_needs_physical = 1,
 };
 
-const static struct intel_device_info intel_i865g_info = {
+static const struct intel_device_info intel_i865g_info = {
 	.is_i8xx = 1,
 };
 
-const static struct intel_device_info intel_i915g_info = {
+static const struct intel_device_info intel_i915g_info = {
 	.is_i915g = 1, .is_i9xx = 1, .cursor_needs_physical = 1,
 };
-const static struct intel_device_info intel_i915gm_info = {
+static const struct intel_device_info intel_i915gm_info = {
 	.is_i9xx = 1,  .is_mobile = 1,
 	.cursor_needs_physical = 1,
 };
-const static struct intel_device_info intel_i945g_info = {
+static const struct intel_device_info intel_i945g_info = {
 	.is_i9xx = 1, .has_hotplug = 1, .cursor_needs_physical = 1,
 };
-const static struct intel_device_info intel_i945gm_info = {
+static const struct intel_device_info intel_i945gm_info = {
 	.is_i945gm = 1, .is_i9xx = 1, .is_mobile = 1,
 	.has_hotplug = 1, .cursor_needs_physical = 1,
 };
 
-const static struct intel_device_info intel_i965g_info = {
+static const struct intel_device_info intel_i965g_info = {
 	.is_i965g = 1, .is_i9xx = 1, .has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_i965gm_info = {
+static const struct intel_device_info intel_i965gm_info = {
 	.is_i965g = 1, .is_mobile = 1, .is_i965gm = 1, .is_i9xx = 1,
 	.is_mobile = 1, .has_fbc = 1, .has_rc6 = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_g33_info = {
+static const struct intel_device_info intel_g33_info = {
 	.is_g33 = 1, .is_i9xx = 1, .need_gfx_hws = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_g45_info = {
+static const struct intel_device_info intel_g45_info = {
 	.is_i965g = 1, .is_g4x = 1, .is_i9xx = 1, .need_gfx_hws = 1,
 	.has_pipe_cxsr = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_gm45_info = {
+static const struct intel_device_info intel_gm45_info = {
 	.is_i965g = 1, .is_mobile = 1, .is_g4x = 1, .is_i9xx = 1,
 	.is_mobile = 1, .need_gfx_hws = 1, .has_fbc = 1, .has_rc6 = 1,
 	.has_pipe_cxsr = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_pineview_info = {
+static const struct intel_device_info intel_pineview_info = {
 	.is_g33 = 1, .is_pineview = 1, .is_mobile = 1, .is_i9xx = 1,
 	.need_gfx_hws = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_ironlake_d_info = {
+static const struct intel_device_info intel_ironlake_d_info = {
 	.is_ironlake = 1, .is_i965g = 1, .is_i9xx = 1, .need_gfx_hws = 1,
 	.has_pipe_cxsr = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_ironlake_m_info = {
+static const struct intel_device_info intel_ironlake_m_info = {
 	.is_ironlake = 1, .is_mobile = 1, .is_i965g = 1, .is_i9xx = 1,
 	.need_gfx_hws = 1, .has_rc6 = 1,
 	.has_hotplug = 1,
 };
 
-const static struct intel_device_info intel_sandybridge_d_info = {
+static const struct intel_device_info intel_sandybridge_d_info = {
 	.is_i965g = 1, .is_i9xx = 1, .need_gfx_hws = 1,
 	.has_hotplug = 1, .is_gen6 = 1,
 };
 
-const static struct intel_device_info intel_sandybridge_m_info = {
+static const struct intel_device_info intel_sandybridge_m_info = {
 	.is_i965g = 1, .is_mobile = 1, .is_i9xx = 1, .need_gfx_hws = 1,
 	.has_hotplug = 1, .is_gen6 = 1,
 };
 
-const static struct pci_device_id pciidlist[] = {
+static const struct pci_device_id pciidlist[] = {
 	INTEL_VGA_DEVICE(0x3577, &intel_i830_info),
 	INTEL_VGA_DEVICE(0x2562, &intel_845g_info),
 	INTEL_VGA_DEVICE(0x3582, &intel_i85x_info),
-- 
1.6.3.3

