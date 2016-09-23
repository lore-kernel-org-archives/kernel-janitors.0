From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 16:36:48 +0000
Subject: [PATCH 1/3] drm/vmwgfx: Use kmalloc_array() in vmw_surface_define_ioctl()
Message-Id: <e2dd813a-b70f-5d29-b7a2-6330f15bec50@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
In-Reply-To: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, David Airlie <airlied@linux.ie>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 21:54:33 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index c2a721a..f557549 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -763,14 +763,16 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	memcpy(srf->mip_levels, req->mip_levels, sizeof(srf->mip_levels));
 	srf->num_sizes = num_sizes;
 	user_srf->size = size;
-
-	srf->sizes = kmalloc(srf->num_sizes * sizeof(*srf->sizes), GFP_KERNEL);
+	srf->sizes = kmalloc_array(srf->num_sizes,
+				   sizeof(*srf->sizes),
+				   GFP_KERNEL);
 	if (unlikely(srf->sizes = NULL)) {
 		ret = -ENOMEM;
 		goto out_no_sizes;
 	}
-	srf->offsets = kmalloc(srf->num_sizes * sizeof(*srf->offsets),
-			       GFP_KERNEL);
+	srf->offsets = kmalloc_array(srf->num_sizes,
+				     sizeof(*srf->offsets),
+				     GFP_KERNEL);
 	if (unlikely(srf->offsets = NULL)) {
 		ret = -ENOMEM;
 		goto out_no_offsets;
-- 
2.10.0

