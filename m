From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 15:58:20 +0000
Subject: [PATCH 5/5] GPU-DRM: Rename a jump label in drm_legacy_mapbufs()
Message-Id: <0dd208fb-f46a-e043-d45d-1c4cf52bb0bb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
In-Reply-To: <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 17:37:27 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_bufs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index adb1dd7..0d5ee1e 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1476,7 +1476,7 @@ int drm_legacy_mapbufs(struct drm_device *dev, void *data,
 
 			if (!map) {
 				retcode = -EINVAL;
-				goto done;
+				goto status_indication;
 			}
 			virtual = vm_mmap(file_priv->filp, 0, map->size,
 					  PROT_READ | PROT_WRITE,
@@ -1490,7 +1490,7 @@ int drm_legacy_mapbufs(struct drm_device *dev, void *data,
 		if (virtual > -1024UL) {
 			/* Real error */
 			retcode = (signed long)virtual;
-			goto done;
+			goto status_indication;
 		}
 		request->virtual = (void __user *)virtual;
 
@@ -1499,28 +1499,28 @@ int drm_legacy_mapbufs(struct drm_device *dev, void *data,
 					 &dma->buflist[i]->idx,
 					 sizeof(request->list[0].idx))) {
 				retcode = -EFAULT;
-				goto done;
+				goto status_indication;
 			}
 			if (copy_to_user(&request->list[i].total,
 					 &dma->buflist[i]->total,
 					 sizeof(request->list[0].total))) {
 				retcode = -EFAULT;
-				goto done;
+				goto status_indication;
 			}
 			if (copy_to_user(&request->list[i].used,
 					 &zero, sizeof(zero))) {
 				retcode = -EFAULT;
-				goto done;
+				goto status_indication;
 			}
 			address = virtual + dma->buflist[i]->offset;	/* *** */
 			if (copy_to_user(&request->list[i].address,
 					 &address, sizeof(address))) {
 				retcode = -EFAULT;
-				goto done;
+				goto status_indication;
 			}
 		}
 	}
-      done:
+ status_indication:
 	request->count = dma->buf_count;
 	DRM_DEBUG("%d buffers, retcode = %d\n", request->count, retcode);
 
-- 
2.10.0

