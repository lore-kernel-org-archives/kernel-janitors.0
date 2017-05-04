From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 16:54:16 +0000
Subject: [PATCH 3/9] drm/i915: Replace 14 seq_printf() calls by seq_puts()
Message-Id: <56ab5065-5a24-47cf-023f-b10c6daf4799@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 13:20:47 +0200

Some strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 4adf96be9146..296108464f2b 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -149,7 +149,7 @@ describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	}
 	seq_printf(m, " (pinned x %d)", pin_count);
 	if (obj->pin_display)
-		seq_printf(m, " (display)");
+		seq_puts(m, " (display)");
 	list_for_each_entry(vma, &obj->vma_list, obj_link) {
 		if (!drm_mm_node_allocated(&vma->node))
 			continue;
@@ -581,8 +581,10 @@ static int i915_gem_pageflip_info(struct seq_file *m, void *data)
 					   intel_engine_last_submit(engine),
 					   intel_engine_get_seqno(engine),
 					   i915_gem_request_completed(work->flip_queued_req));
-			} else
-				seq_printf(m, "Flip not associated with any ring\n");
+			} else {
+				seq_puts(m,
+					 "Flip not associated with any ring\n");
+			}
 			seq_printf(m, "Flip queued on frame %d, (was ready on frame %d), now %d\n",
 				   work->flip_queued_vblank,
 				   work->flip_ready_vblank,
@@ -2048,7 +2050,7 @@ static int i915_dump_lrc(struct seq_file *m, void *unused)
 	int ret;
 
 	if (!i915.enable_execlists) {
-		seq_printf(m, "Logical Ring Contexts are disabled\n");
+		seq_puts(m, "Logical Ring Contexts are disabled\n");
 		return 0;
 	}
 
@@ -2402,7 +2404,7 @@ static int i915_guc_load_status_info(struct seq_file *m, void *data)
 	if (!HAS_GUC_UCODE(dev_priv))
 		return 0;
 
-	seq_printf(m, "GuC firmware status:\n");
+	seq_puts(m, "GuC firmware status:\n");
 	seq_printf(m, "\tpath: %s\n",
 		guc_fw->path);
 	seq_printf(m, "\tfetch: %s\n",
@@ -2510,7 +2512,7 @@ static int i915_guc_info(struct seq_file *m, void *data)
 		return 0;
 	}
 
-	seq_printf(m, "Doorbell map:\n");
+	seq_puts(m, "Doorbell map:\n");
 	seq_printf(m, "\t%*pb\n", GUC_NUM_DOORBELLS, guc->doorbell_bitmap);
 	seq_printf(m, "Doorbell next cacheline: 0x%x\n\n", guc->db_cacheline);
 
@@ -2521,7 +2523,7 @@ static int i915_guc_info(struct seq_file *m, void *data)
 	seq_printf(m, "GuC last action error code: %d\n", guc->action_err);
 
 	total = 0;
-	seq_printf(m, "\nGuC submissions:\n");
+	seq_puts(m, "\nGuC submissions:\n");
 	for_each_engine(engine, dev_priv, id) {
 		u64 submissions = guc->submissions[id];
 		total += submissions;
@@ -2795,7 +2797,7 @@ static int i915_runtime_pm_status(struct seq_file *m, void *unused)
 	seq_printf(m, "Usage count: %d\n",
 		   atomic_read(&dev_priv->drm.dev->power.usage_count));
 #else
-	seq_printf(m, "Device Power Management (CONFIG_PM) disabled\n");
+	seq_puts(m, "Device Power Management (CONFIG_PM) disabled\n");
 #endif
 	seq_printf(m, "PCI device power state: %s [%d]\n",
 		   pci_power_name(pdev->current_state),
@@ -2914,7 +2916,7 @@ static void intel_encoder_info(struct seq_file *m,
 			   drm_get_connector_status_name(connector->status));
 		if (connector->status = connector_status_connected) {
 			struct drm_display_mode *mode = &crtc->mode;
-			seq_printf(m, ", mode:\n");
+			seq_puts(m, ", mode:\n");
 			intel_seq_print_mode(m, 2, mode);
 		} else {
 			seq_putc(m, '\n');
@@ -2945,7 +2947,7 @@ static void intel_panel_info(struct seq_file *m, struct intel_panel *panel)
 {
 	struct drm_display_mode *mode = panel->fixed_mode;
 
-	seq_printf(m, "\tfixed mode:\n");
+	seq_puts(m, "\tfixed mode:\n");
 	intel_seq_print_mode(m, 2, mode);
 }
 
@@ -3038,7 +3040,7 @@ static void intel_connector_info(struct seq_file *m,
 		break;
 	}
 
-	seq_printf(m, "\tmodes:\n");
+	seq_puts(m, "\tmodes:\n");
 	list_for_each_entry(mode, &connector->modes, head)
 		intel_seq_print_mode(m, 2, mode);
 }
@@ -3266,9 +3268,7 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 			   engine->timeline->inflight_seqnos);
 
 		rcu_read_lock();
-
-		seq_printf(m, "\tRequests:\n");
-
+		seq_puts(m, "\tRequests:\n");
 		rq = list_first_entry(&engine->timeline->requests,
 				      struct drm_i915_gem_request, link);
 		if (&rq->link != &engine->timeline->requests)
@@ -3346,7 +3346,7 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 					   engine->execlist_port[0].count);
 				print_request(m, rq, "rq: ");
 			} else {
-				seq_printf(m, "\t\tELSP[0] idle\n");
+				seq_puts(m, "\t\tELSP[0] idle\n");
 			}
 			rq = READ_ONCE(engine->execlist_port[1].request);
 			if (rq) {
@@ -3354,7 +3354,7 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 					   engine->execlist_port[1].count);
 				print_request(m, rq, "rq: ");
 			} else {
-				seq_printf(m, "\t\tELSP[1] idle\n");
+				seq_puts(m, "\t\tELSP[1] idle\n");
 			}
 			rcu_read_unlock();
 
@@ -3465,7 +3465,7 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, "DPLL%i: %s, id: %i\n", i, pll->name, pll->id);
 		seq_printf(m, " crtc_mask: 0x%08x, active: 0x%x, on: %s\n",
 			   pll->state.crtc_mask, pll->active_mask, yesno(pll->on));
-		seq_printf(m, " tracked hardware state:\n");
+		seq_puts(m, " tracked hardware state:\n");
 		seq_printf(m, " dpll:    0x%08x\n", pll->state.hw_state.dpll);
 		seq_printf(m, " dpll_md: 0x%08x\n",
 			   pll->state.hw_state.dpll_md);
-- 
2.12.2

