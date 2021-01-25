From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:48:30 +0000
Subject: [PATCH] drm/i915/gvt: fix uninitialized return in intel_gvt_update_reg_whitelist()
Message-Id: <YA6F3oF8mRaNQWjb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

Smatch found an uninitialized variable bug in this code:

    drivers/gpu/drm/i915/gvt/cmd_parser.c:3191 intel_gvt_update_reg_whitelist()
    error: uninitialized symbol 'ret'.

The first thing that Smatch complains about is that "ret" isn't set if
we don't enter the "for_each_engine(engine, &dev_priv->gt, id) {" loop.
Presumably we always have at least one engine so that's a false
positive.

But it's definitely a bug to not set "ret" if i915_gem_object_pin_map()
fails.

Let's fix the bug and silence the false positive.

Fixes: 493f30cd086e ("drm/i915/gvt: parse init context to update cmd accessible reg whitelist")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 7fb91de06557..d54ea0e4681d 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -3103,7 +3103,7 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	struct i915_request *requests[I915_NUM_ENGINES] = {};
 	bool is_ctx_pinned[I915_NUM_ENGINES] = {};
-	int ret;
+	int ret = 0;
 
 	if (gvt->is_reg_whitelist_updated)
 		return;
@@ -3157,6 +3157,7 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 		if (IS_ERR(vaddr)) {
 			gvt_err("failed to pin init ctx obj, ring=%d, err=%lx\n",
 				id, PTR_ERR(vaddr));
+			ret = PTR_ERR(vaddr);
 			goto out;
 		}
 
-- 
2.29.2
