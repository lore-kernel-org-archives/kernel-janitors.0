From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 15:53:49 +0000
Subject: [PATCH 1/5] GPU-DRM: Use kmalloc_array() in drm_legacy_addbufs_pci()
Message-Id: <b71c8fee-8e84-9f1b-8569-f1ae8b879cc5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
In-Reply-To: <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 17:07:06 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_bufs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 3219151..ed33f43 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -923,8 +923,9 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 	/* Keep the original pagelist until we know all the allocations
 	 * have succeeded
 	 */
-	temp_pagelist = kmalloc((dma->page_count + (count << page_order)) *
-			       sizeof(*dma->pagelist), GFP_KERNEL);
+	temp_pagelist = kmalloc_array(dma->page_count + (count << page_order),
+				      sizeof(*dma->pagelist),
+				      GFP_KERNEL);
 	if (!temp_pagelist) {
 		kfree(entry->buflist);
 		kfree(entry->seglist);
-- 
2.10.0

