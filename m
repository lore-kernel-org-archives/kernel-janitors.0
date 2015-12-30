From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 21:20:30 +0000
Subject: [PATCH] drm/dp/mst: constify drm_dp_mst_topology_cbs structures
Message-Id: <1451510430-11149-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel.vetter@intel.com>

The drm_dp_mst_topology_cbs structures are never modified, so declare them
as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/i915/intel_dp_mst.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c |    2 +-
 include/drm/drm_dp_mst_helper.h        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 74b5888..b37b859 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -421,7 +421,7 @@ struct drm_dp_payload {
 struct drm_dp_mst_topology_mgr {
 
 	struct device *dev;
-	struct drm_dp_mst_topology_cbs *cbs;
+	const struct drm_dp_mst_topology_cbs *cbs;
 	int max_dpcd_transaction_bytes;
 	struct drm_dp_aux *aux; /* auxch for this topology mgr to use */
 	int max_payloads;
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 94323f5..8a02225 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -329,7 +329,7 @@ static void radeon_dp_mst_hotplug(struct drm_dp_mst_topology_mgr *mgr)
 	drm_kms_helper_hotplug_event(dev);
 }
 
-struct drm_dp_mst_topology_cbs mst_cbs = {
+const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = radeon_dp_add_mst_connector,
 	.register_connector = radeon_dp_register_mst_connector,
 	.destroy_connector = radeon_dp_destroy_mst_connector,
diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index e2f515d..fa0dabf 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -534,7 +534,7 @@ static void intel_dp_mst_hotplug(struct drm_dp_mst_topology_mgr *mgr)
 	drm_kms_helper_hotplug_event(dev);
 }
 
-static struct drm_dp_mst_topology_cbs mst_cbs = {
+static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = intel_dp_add_mst_connector,
 	.register_connector = intel_dp_register_mst_connector,
 	.destroy_connector = intel_dp_destroy_mst_connector,

