From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 16:51:06 +0000
Subject: [PATCH 1/9] drm/i915: Replace ten seq_puts() calls by seq_putc()
Message-Id: <0d89f50f-8c32-1572-fad2-3c99e21bf0cd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 11:04:45 +0200

Some single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index d689e511744e..f2bda699749a 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -190,7 +190,7 @@ describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 			seq_printf(m, " , fence: %d%s",
 				   vma->fence->id,
 				   i915_gem_active_isset(&vma->last_fence) ? "*" : "");
-		seq_puts(m, ")");
+		seq_putc(m, ')');
 	}
 	if (obj->stolen)
 		seq_printf(m, " (stolen: %08llx)", obj->stolen->start);
@@ -2689,7 +2689,7 @@ static int i915_edp_psr_status(struct seq_file *m, void *data)
 			    (stat[pipe] = VLV_EDP_PSR_ACTIVE_SF_UPDATE))
 				seq_printf(m, " pipe %c", pipe_name(pipe));
 		}
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 
 	/*
 	 * VLV/CHV PSR has no kind of performance counter
@@ -3176,7 +3176,7 @@ static void intel_scaler_info(struct seq_file *m, struct intel_crtc *intel_crtc)
 			seq_printf(m, ", scalers[%d]: use=%s, mode=%x",
 				   i, yesno(sc->in_use), sc->mode);
 		}
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	} else {
 		seq_puts(m, "\tNo scalers available on this platform\n");
 	}
@@ -3384,8 +3384,7 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 				   w->tsk->comm, w->tsk->pid, w->seqno);
 		}
 		spin_unlock_irq(&b->rb_lock);
-
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 
 	intel_runtime_pm_put(dev_priv);
@@ -3629,7 +3628,7 @@ static void drrs_status_per_crtc(struct seq_file *m,
 		/* DRRS not supported. Print the VBT parameter*/
 		seq_puts(m, "\tDRRS Supported : No");
 	}
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }
 
 static int i915_drrs_status(struct seq_file *m, void *unused)
@@ -3764,12 +3763,11 @@ static int i915_displayport_test_active_show(struct seq_file *m, void *data)
 		if (connector->status = connector_status_connected &&
 		    connector->encoder != NULL) {
 			intel_dp = enc_to_intel_dp(connector->encoder);
-			if (intel_dp->compliance.test_active)
-				seq_puts(m, "1");
-			else
-				seq_puts(m, "0");
-		} else
-			seq_puts(m, "0");
+			seq_putc(m,
+				 intel_dp->compliance.test_active ? '1' : '0');
+		} else {
+			seq_putc(m, '0');
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
@@ -3823,8 +3821,9 @@ static int i915_displayport_test_data_show(struct seq_file *m, void *data)
 				seq_printf(m, "bpc: %u\n",
 					   intel_dp->compliance.test_data.bpc);
 			}
-		} else
-			seq_puts(m, "0");
+		} else {
+			seq_putc(m, '0');
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
@@ -3864,8 +3863,9 @@ static int i915_displayport_test_type_show(struct seq_file *m, void *data)
 		    connector->encoder != NULL) {
 			intel_dp = enc_to_intel_dp(connector->encoder);
 			seq_printf(m, "%02lx", intel_dp->compliance.test_type);
-		} else
-			seq_puts(m, "0");
+		} else {
+			seq_putc(m, '0');
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.12.2

