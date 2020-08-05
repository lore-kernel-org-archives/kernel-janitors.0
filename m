From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 11:31:55 +0000
Subject: [PATCH] drm/vmwgfx: fix spelling mistake "Cound" -> "Could"
Message-Id: <20200805113155.18006-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Roland Scheidegger <sroland@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_ERROR message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 4284c4bd444d..e67e2e8f6e6f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3037,7 +3037,7 @@ static int vmw_cmd_dx_bind_streamoutput(struct vmw_private *dev_priv,
 	res = vmw_dx_streamoutput_lookup(vmw_context_res_man(ctx_node->ctx),
 					 cmd->body.soid);
 	if (IS_ERR(res)) {
-		DRM_ERROR("Cound not find streamoutput to bind.\n");
+		DRM_ERROR("Could not find streamoutput to bind.\n");
 		return PTR_ERR(res);
 	}
 
-- 
2.27.0
