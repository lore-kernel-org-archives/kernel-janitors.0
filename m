From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 15 Nov 2015 20:44:01 +0000
Subject: [PATCH] drm/vmwgfx: constify fence_ops structure
Message-Id: <1447620241-12984-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

The fence_ops structures are never modified, so declare this one as const,
as is already done for the others.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 8e689b4..4d09da1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -226,7 +226,7 @@ out:
 	return ret;
 }
 
-static struct fence_ops vmw_fence_ops = {
+static const struct fence_ops vmw_fence_ops = {
 	.get_driver_name = vmw_fence_get_driver_name,
 	.get_timeline_name = vmw_fence_get_timeline_name,
 	.enable_signaling = vmw_fence_enable_signaling,

