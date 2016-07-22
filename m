From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 22 Jul 2016 17:44:38 +0000
Subject: [PATCH] drm/etnaviv: Improve readability in __etnaviv_gem_new
Message-Id: <1469209478-25713-1-git-send-email-seanpaul@chromium.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <57924CC2.5030309@bfs.de>
In-Reply-To: <57924CC2.5030309@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net, wharms@bfs.de
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, linux@armlinux.org.uk, Sean Paul <seanpaul@chromium.org>

Move things around a little in __etnaviv_gem_new() to make it
more readable.

Reported-by: Markus Elfring <elfring@users.sourceforge.net>
Reported-by: walter harms <wharms@bfs.de>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index df9bcba..7d13628 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -640,6 +640,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
 		u32 size, u32 flags)
 {
 	struct drm_gem_object *obj = NULL;
+	struct address_space *mapping;
 	int ret;
 
 	size = PAGE_ALIGN(size);
@@ -650,23 +651,19 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
 		goto fail;
 
 	ret = drm_gem_object_init(dev, obj, size);
-	if (ret = 0) {
-		struct address_space *mapping;
-
-		/*
-		 * Our buffers are kept pinned, so allocating them
-		 * from the MOVABLE zone is a really bad idea, and
-		 * conflicts with CMA.  See coments above new_inode()
-		 * why this is required _and_ expected if you're
-		 * going to pin these pages.
-		 */
-		mapping = file_inode(obj->filp)->i_mapping;
-		mapping_set_gfp_mask(mapping, GFP_HIGHUSER);
-	}
-
 	if (ret)
 		goto fail;
 
+	/*
+	 * Our buffers are kept pinned, so allocating them
+	 * from the MOVABLE zone is a really bad idea, and
+	 * conflicts with CMA.  See coments above new_inode()
+	 * why this is required _and_ expected if you're
+	 * going to pin these pages.
+	 */
+	mapping = file_inode(obj->filp)->i_mapping;
+	mapping_set_gfp_mask(mapping, GFP_HIGHUSER);
+
 	return obj;
 
 fail:
-- 
2.8.0.rc3.226.g39d4020

