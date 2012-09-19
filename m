From: Ben Widawsky <ben@bwidawsk.net>
Date: Wed, 19 Sep 2012 17:50:19 +0000
Subject: [PATCH] drm/i915: Fix !CONFIG_PM sysfs for real this time
Message-Id: <1348077019-5893-1-git-send-email-ben@bwidawsk.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120918234054.GA7140@localhost>
In-Reply-To: <20120918234054.GA7140@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: intel-gfx@lists.freedesktop.org
Cc: Ben Widawsky <ben@bwidawsk.net>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Somehow this hunk got dropped from my last patch. We do not have the
rc6_attrs when there is no CONFIG_PM so this causes a compilation error.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
---
 drivers/gpu/drm/i915/i915_sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 4717a42..5f33a6b 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -413,5 +413,7 @@ void i915_teardown_sysfs(struct drm_device *dev)
 {
 	sysfs_remove_files(&dev->primary->kdev.kobj, gen6_attrs);
 	device_remove_bin_file(&dev->primary->kdev,  &dpf_attrs);
+#ifdef CONFIG_PM
 	sysfs_unmerge_group(&dev->primary->kdev.kobj, &rc6_attr_group);
+#endif
 }
-- 
1.7.12

