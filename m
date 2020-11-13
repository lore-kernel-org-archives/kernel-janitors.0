From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Nov 2020 10:15:02 +0000
Subject: [PATCH] drm/udl: Fix missing error code in udl_handle_damage()
Message-Id: <20201113101502.GD168908@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>

If udl_get_urb() fails then this should return a negative error code
but currently it returns success.

Fixes: 798ce3fe1c3a ("drm/udl: Begin/end access to imported buffers in damage-handler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 42eeba1dfdbf..9d34ec9d03f6 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -305,8 +305,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	urb = udl_get_urb(dev);
-	if (!urb)
+	if (!urb) {
+		ret = -ENOMEM;
 		goto out_drm_gem_shmem_vunmap;
+	}
 	cmd = urb->transfer_buffer;
 
 	for (i = clip.y1; i < clip.y2; i++) {
-- 
2.28.0
