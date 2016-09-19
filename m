From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 15:55:41 +0000
Subject: [PATCH 3/5] GPU-DRM: Replace a kzalloc() call by kcalloc() in drm_legacy_addbufs_agp()
Message-Id: <606c22f3-5da5-2e84-783d-bfe5289b4a01@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
In-Reply-To: <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 17:24:20 +0200

The script "checkpatch.pl" can point information out like the following.

WARNING: Prefer kcalloc over kzalloc with multiply

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_bufs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 8a31dac..36dd685 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -755,7 +755,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	entry->buflist = kzalloc(count * sizeof(*entry->buflist), GFP_KERNEL);
+	entry->buflist = kcalloc(count, sizeof(*entry->buflist), GFP_KERNEL);
 	if (!entry->buflist) {
 		mutex_unlock(&dev->struct_mutex);
 		atomic_dec(&dev->buf_alloc);
-- 
2.10.0

