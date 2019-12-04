From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Dec 2019 01:01:54 +0000
Subject: [PATCH -next] drm/i915/perf: drop pointless static qualifier in i915_perf_add_config_ioctl()
Message-Id: <20191204010154.152396-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 65d7c2e599de..700f6a9f2ffb 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3955,7 +3955,7 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 	struct i915_perf *perf = &to_i915(dev)->perf;
 	struct drm_i915_perf_oa_config *args = data;
 	struct i915_oa_config *oa_config, *tmp;
-	static struct i915_oa_reg *regs;
+	struct i915_oa_reg *regs;
 	int err, id;
 
 	if (!perf->i915) {
-- 
2.20.1
