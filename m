From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 08 Dec 2019 10:53:28 +0000
Subject: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Message-Id: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 508108ea2747 ("drm/vmwgfx: Don't refcount command-buffer managed
resource lookups during command buffer validation") slips in use of
deprecated PTR_RET. Use PTR_ERR_OR_ZERO instead.

As the PTR_ERR_OR_ZERO is a bit longer than PTR_RET, we introduce
local variable ret for proper indentation and line-length limits.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (9455d25f4e3b) and next-20191207
compile-tested on x86_64_defconfig + DRM_VMWGFX=y

 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 934ad7c0c342..73489a45decb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -2377,9 +2377,12 @@ static int vmw_cmd_dx_clear_rendertarget_view(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearRenderTargetView)  		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_rt,
-					   cmd->body.renderTargetViewId));
+	ret = vmw_view_id_val_add(sw_context, vmw_view_rt,
+				  cmd->body.renderTargetViewId);
+
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 /**
@@ -2396,9 +2399,12 @@ static int vmw_cmd_dx_clear_depthstencil_view(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearDepthStencilView)  		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
+
+	ret = vmw_view_id_val_add(sw_context, vmw_view_ds,
+				  cmd->body.depthStencilViewId);
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_ds,
-					   cmd->body.depthStencilViewId));
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
@@ -2741,9 +2747,12 @@ static int vmw_cmd_dx_genmips(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXGenMips)  		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
+
+	ret = vmw_view_id_val_add(sw_context, vmw_view_sr,
+				  cmd->body.shaderResourceViewId);
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_sr,
-					   cmd->body.shaderResourceViewId));
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 /**
-- 
2.17.1
