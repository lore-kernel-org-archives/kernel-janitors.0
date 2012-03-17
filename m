From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 17 Mar 2012 17:57:02 +0000
Subject: [PATCH] drivers/gpu/drm/savage/savage_state.c: add missing kfree
Message-Id: <1332007022-28014-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Most of the error handling code in this function frees the buffers
kcmd_addr, kvb_addr, and kbox_addr allocated at the beginning of this
function.  These two branches are changed to do the same.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/savage/savage_state.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/savage/savage_state.c
index 8a3e315..031aaaf 100644
--- a/drivers/gpu/drm/savage/savage_state.c
+++ b/drivers/gpu/drm/savage/savage_state.c
@@ -1057,7 +1057,8 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 				DRM_ERROR("indexed drawing command extends "
 					  "beyond end of command buffer\n");
 				DMA_FLUSH();
-				return -EINVAL;
+				ret = -EINVAL;
+				goto done;
 			}
 			/* fall through */
 		case SAVAGE_CMD_DMA_PRIM:
@@ -1076,7 +1077,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 				      cmdbuf->vb_stride,
 				      cmdbuf->nbox, cmdbuf->box_addr);
 				if (ret != 0)
-					return ret;
+					goto done;
 				first_draw_cmd = NULL;
 			}
 		}

