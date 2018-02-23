From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 23 Feb 2018 00:00:33 +0000
Subject: [PATCH 4/7] drm/virtio: Remove return from void function
Message-Id: <fd8dc6599c81c7aec6753c8552c1cabb7baa7577.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patch fixes the checkpatch.pl warning:

virtgpu_ttm.c:181: WARNING: void function return statements are not
generally useful
...

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ttm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
index 36655b709eb2..cd4a17a1409a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
@@ -177,7 +177,6 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 				struct ttm_mem_reg *mem)
 {
 	mem->mm_node = (void *)NULL;
-	return;
 }
 
 static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
@@ -244,7 +243,6 @@ static void virtio_gpu_evict_flags(struct ttm_buffer_object *bo,
 	placement->busy_placement = &placements;
 	placement->num_placement = 1;
 	placement->num_busy_placement = 1;
-	return;
 }
 
 static int virtio_gpu_verify_access(struct ttm_buffer_object *bo,
-- 
2.16.2

