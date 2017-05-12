From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 May 2017 12:38:03 +0000
Subject: [PATCH v2] drm/vc4: Fix resource leak in 'vc4_get_hang_state_ioctl()' in error handling path
Message-Id: <20170512123803.1886-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric@anholt.net, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If one 'drm_gem_handle_create()' fails, we leak somes handles and some
memory.

In order to fix it:
  - move the 'free(bo_state)' at the end of the function so that it is also
    called in the eror handling path. This has the side effect to also try 
    to free it if the first 'kcalloc' fails. This is harmless.
  - add a new label, err_delete_handle, in order to delete already
    allocated handles in error handling path
  - remove the now useless 'err' label

The way the code is now written will also delete the handles if the
'copy_to_user()' call fails.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: reorder code and add a 'err_delete_handle' label in order to free
    resources in the correct order and avoid NULL pointer dereference
---
 drivers/gpu/drm/vc4/vc4_gem.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index e9c381c42139..891c7a22cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -111,8 +111,8 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 					    &handle);
 
 		if (ret) {
-			state->bo_count = i - 1;
-			goto err;
+			state->bo_count = i;
+			goto err_delete_handle;
 		}
 		bo_state[i].handle = handle;
 		bo_state[i].paddr = vc4_bo->base.paddr;
@@ -124,13 +124,16 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			 state->bo_count * sizeof(*bo_state)))
 		ret = -EFAULT;
 
-	kfree(bo_state);
+err_delete_handle:
+	if (ret) {
+		for (i = 0; i < state->bo_count; i++)
+			drm_gem_handle_delete(file_priv, bo_state[i].handle);
+	}
 
 err_free:
-
 	vc4_free_hang_state(dev, kernel_state);
+	kfree(bo_state);
 
-err:
 	return ret;
 }
 
-- 
2.11.0

