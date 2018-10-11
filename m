From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 07:59:41 +0000
Subject: [PATCH] staging: vboxvideo: unlock on error in vbox_cursor_atomic_update()
Message-Id: <20181011075941.GA11658@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to unlock before returning on this error path.

Fixes: 35f3288c453e ("staging: vboxvideo: Atomic phase 1: convert cursor to universal plane")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vboxvideo/vbox_mode.c b/drivers/staging/vboxvideo/vbox_mode.c
index 042e4f384df9..78a9c9b13ff6 100644
--- a/drivers/staging/vboxvideo/vbox_mode.c
+++ b/drivers/staging/vboxvideo/vbox_mode.c
@@ -424,6 +424,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	/* pinning is done in prepare/cleanup framebuffer */
 	src = vbox_bo_kmap(bo);
 	if (IS_ERR(src)) {
+		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not kmap cursor bo, skipping update\n");
 		return;
 	}
