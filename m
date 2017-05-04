From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 16:52:52 +0000
Subject: [PATCH 2/9] drm/i915: Combine five seq_printf() calls in i915_display_info()
Message-Id: <fe70f127-197d-7b2b-bde6-f99ebf5f81de@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 13:17:10 +0200

Some text was put into a sequence by separate function calls.
Print the same data by two single function calls instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index f2bda699749a..4adf96be9146 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -3191,8 +3191,7 @@ static int i915_display_info(struct seq_file *m, void *unused)
 	struct drm_connector_list_iter conn_iter;
 
 	intel_runtime_pm_get(dev_priv);
-	seq_printf(m, "CRTC info\n");
-	seq_printf(m, "---------\n");
+	seq_puts(m, "CRTC info\n---------\n");
 	for_each_intel_crtc(dev, crtc) {
 		bool active;
 		struct intel_crtc_state *pipe_config;
@@ -3226,9 +3225,7 @@ static int i915_display_info(struct seq_file *m, void *unused)
 		drm_modeset_unlock(&crtc->base.mutex);
 	}
 
-	seq_printf(m, "\n");
-	seq_printf(m, "Connector info\n");
-	seq_printf(m, "--------------\n");
+	seq_puts(m, "\nConnector info\n--------------\n");
 	mutex_lock(&dev->mode_config.mutex);
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter)
-- 
2.12.2

