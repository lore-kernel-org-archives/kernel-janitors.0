From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 19:48:04 +0000
Subject: [PATCH 2/2] GPU-DRM-Savage: Less function calls in savage_bci_cmdbuf() after error detection
Message-Id: <c97563c0-d463-8b15-5956-26d93641a54f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
In-Reply-To: <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 21:28:58 +0200

The kfree() function was called in a few cases by the
savage_bci_cmdbuf() function during error handling
even if a passed variable contained a null pointer.

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/savage/savage_state.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/savage/savage_state.c
index 3dc0d8f..5b484aa 100644
--- a/drivers/gpu/drm/savage/savage_state.c
+++ b/drivers/gpu/drm/savage/savage_state.c
@@ -1004,7 +1004,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 		kvb_addr = memdup_user(cmdbuf->vb_addr, cmdbuf->vb_size);
 		if (IS_ERR(kvb_addr)) {
 			ret = PTR_ERR(kvb_addr);
-			goto done;
+			goto free_cmd;
 		}
 		cmdbuf->vb_addr = kvb_addr;
 	}
@@ -1013,13 +1013,13 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 					  GFP_KERNEL);
 		if (kbox_addr = NULL) {
 			ret = -ENOMEM;
-			goto done;
+			goto free_vb;
 		}
 
 		if (copy_from_user(kbox_addr, cmdbuf->box_addr,
 				       cmdbuf->nbox * sizeof(struct drm_clip_rect))) {
 			ret = -EFAULT;
-			goto done;
+			goto free_vb;
 		}
 	cmdbuf->box_addr = kbox_addr;
 	}
@@ -1052,7 +1052,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 					  "beyond end of command buffer\n");
 				DMA_FLUSH();
 				ret = -EINVAL;
-				goto done;
+				goto free_box;
 			}
 			/* fall through */
 		case SAVAGE_CMD_DMA_PRIM:
@@ -1071,7 +1071,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 				      cmdbuf->vb_stride,
 				      cmdbuf->nbox, cmdbuf->box_addr);
 				if (ret != 0)
-					goto done;
+					goto free_box;
 				first_draw_cmd = NULL;
 			}
 		}
@@ -1086,7 +1086,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 					  "beyond end of command buffer\n");
 				DMA_FLUSH();
 				ret = -EINVAL;
-				goto done;
+				goto free_box;
 			}
 			ret = savage_dispatch_state(dev_priv, &cmd_header,
 				(const uint32_t *)cmdbuf->cmd_addr);
@@ -1099,7 +1099,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 					  "beyond end of command buffer\n");
 				DMA_FLUSH();
 				ret = -EINVAL;
-				goto done;
+				goto free_box;
 			}
 			ret = savage_dispatch_clear(dev_priv, &cmd_header,
 						    cmdbuf->cmd_addr,
@@ -1117,12 +1117,12 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 				  cmd_header.cmd.cmd);
 			DMA_FLUSH();
 			ret = -EINVAL;
-			goto done;
+			goto free_box;
 		}
 
 		if (ret != 0) {
 			DMA_FLUSH();
-			goto done;
+			goto free_box;
 		}
 	}
 
@@ -1133,7 +1133,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 			cmdbuf->nbox, cmdbuf->box_addr);
 		if (ret != 0) {
 			DMA_FLUSH();
-			goto done;
+			goto free_box;
 		}
 	}
 
@@ -1147,11 +1147,11 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 		savage_freelist_put(dev, dmabuf);
 	}
 
-done:
-	/* If we didn't need to allocate them, these'll be NULL */
-	kfree(kcmd_addr);
-	kfree(kvb_addr);
+free_box:
 	kfree(kbox_addr);
-
+free_vb:
+	kfree(kvb_addr);
+free_cmd:
+	kfree(kcmd_addr);
 	return ret;
 }
-- 
2.9.3

