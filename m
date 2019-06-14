From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Jun 2019 14:39:11 +0000
Subject: [PATCH][next] drm/mgag200: add in missing { } around if block
Message-Id: <20190614143911.21806-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if block that is missing the { } curly brackets. Add
these in.

Addresses-Coverity: ("Structurally dead code")
Fixes: 94dc57b10399 ("drm/mgag200: Rewrite cursor handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index f0c61a92351c..117eaedec7aa 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -99,10 +99,11 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 
 	/* Pin and map up-coming buffer to write colour indices */
 	ret = drm_gem_vram_pin(pixels_next, 0);
-	if (ret)
+	if (ret) {
 		dev_err(&dev->pdev->dev,
 			"failed to pin cursor buffer: %d\n", ret);
 		goto err_drm_gem_vram_kunmap_src;
+	}
 	dst = drm_gem_vram_kmap(pixels_next, true, NULL);
 	if (IS_ERR(dst)) {
 		ret = PTR_ERR(dst);
-- 
2.20.1
