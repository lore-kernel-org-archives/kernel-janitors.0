From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 29 Nov 2016 06:49:19 +0000
Subject: [PATCH] drm/vmwgfx: Fix handling of errors returned by 'vmw_cotable_alloc()'
Message-Id: <20161129064919.11416-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'vmw_cotable_alloc()' returns an error pointer on error, not NULL.
Propagate the error code, instead of returning -ENOMEM unconditionally

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
index 443d1ed00de7..d1aee9860033 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
@@ -209,8 +209,8 @@ static int vmw_gb_context_init(struct vmw_private *dev_priv,
 		for (i = 0; i < SVGA_COTABLE_DX10_MAX; ++i) {
 			uctx->cotables[i] = vmw_cotable_alloc(dev_priv,
 							      &uctx->res, i);
-			if (unlikely(uctx->cotables[i] = NULL)) {
-				ret = -ENOMEM;
+			if (unlikely(IS_ERR(uctx->cotables[i]))) {
+				ret = PTR_ERR(uctx->cotables[i]);
 				goto out_cotables;
 			}
 		}
-- 
2.9.3

