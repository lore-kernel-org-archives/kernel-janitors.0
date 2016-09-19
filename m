From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 15:54:48 +0000
Subject: [PATCH 2/5] GPU-DRM: Replace two kzalloc() calls by kcalloc() in drm_legacy_addbufs_pci()
Message-Id: <51f88f44-130d-48ac-f531-32ca9ae3919f@users.sourceforge.net>
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
Date: Mon, 19 Sep 2016 17:17:34 +0200

The script "checkpatch.pl" can point information out like the following.

WARNING: Prefer kcalloc over kzalloc with multiply

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_bufs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index ed33f43..8a31dac 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -905,14 +905,14 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	entry->buflist = kzalloc(count * sizeof(*entry->buflist), GFP_KERNEL);
+	entry->buflist = kcalloc(count, sizeof(*entry->buflist), GFP_KERNEL);
 	if (!entry->buflist) {
 		mutex_unlock(&dev->struct_mutex);
 		atomic_dec(&dev->buf_alloc);
 		return -ENOMEM;
 	}
 
-	entry->seglist = kzalloc(count * sizeof(*entry->seglist), GFP_KERNEL);
+	entry->seglist = kcalloc(count, sizeof(*entry->seglist), GFP_KERNEL);
 	if (!entry->seglist) {
 		kfree(entry->buflist);
 		mutex_unlock(&dev->struct_mutex);
-- 
2.10.0

