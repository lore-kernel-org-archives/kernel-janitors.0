From: Dan Carpenter <dan.carpsnter@oracle.com>
Date: Thu, 20 Oct 2016 11:44:00 +0000
Subject: [patch] drm/i915/gvt: i915_gem_object_create() returns error pointers
Message-Id: <20161020114400.GA15071@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Zhenyu Wang <zhenyuw@linux.intel.com>, Yulei Zhang <yulei.zhang@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The i915_gem_object_create() returns error pointers on error, it never
returns NULLs.

Fixes: ("drm/i915/gvt: vGPU command scanner")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The error handling in perform_bb_shadow() is a bit leaky as well.

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 5808ee7c1935..6abb2a679a3f 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1640,8 +1640,8 @@ static int perform_bb_shadow(struct parser_exec_state *s)
 
 	entry_obj->obj = i915_gem_object_create(&(s->vgpu->gvt->dev_priv->drm),
 		round_up(bb_size, PAGE_SIZE));
-	if (entry_obj->obj = NULL)
-		return -ENOMEM;
+	if (IS_ERR(entry_obj->obj))
+		return PTR_ERR(entry_obj->obj);
 	entry_obj->len = bb_size;
 	INIT_LIST_HEAD(&entry_obj->list);
 
@@ -2712,8 +2712,8 @@ static int shadow_indirect_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 
 	wa_ctx->indirect_ctx.obj = i915_gem_object_create(dev,
 			round_up(ctx_size + CACHELINE_BYTES, PAGE_SIZE));
-	if (wa_ctx->indirect_ctx.obj = NULL)
-		return -ENOMEM;
+	if (IS_ERR(wa_ctx->indirect_ctx.obj))
+		return PTR_ERR(wa_ctx->indirect_ctx.obj);
 
 	ret = i915_gem_object_get_pages(wa_ctx->indirect_ctx.obj);
 	if (ret)
