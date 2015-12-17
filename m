From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2015 12:39:08 +0000
Subject: [patch 2/3 -next] drm/vc4: allocate enough memory in vc4_save_hang_state()
Message-Id: <20151217123908.GB27382@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

"state" is smaller than "kernel_state" so we end up corrupting memory.

Fixes: 214613656b51 ('drm/vc4: Add an interface for capturing the GPU state after a hang.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 461a16c..2a680d9 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -145,7 +145,7 @@ vc4_save_hang_state(struct drm_device *dev)
 	unsigned long irqflags;
 	unsigned int i, unref_list_count;
 
-	kernel_state = kcalloc(1, sizeof(*state), GFP_KERNEL);
+	kernel_state = kcalloc(1, sizeof(*kernel_state), GFP_KERNEL);
 	if (!kernel_state)
 		return;
 
