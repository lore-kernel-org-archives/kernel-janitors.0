From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 09:23:21 +0000
Subject: [PATCH] drm: prevent a harmless integer overflow in drm_legacy_sg_alloc()
Message-Id: <20200228092321.axulddmkxrujkmas@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

There is an integer overflow when we round up to PAGE_SIZE, but it's
harmless because we never re-use "request->size" for anything meaningful.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This code predates git.

 drivers/gpu/drm/drm_scatter.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index d5c386154246..ca520028b2cb 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -99,6 +99,9 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_SG))
 		return -EOPNOTSUPP;
 
+	if (request->size > SIZE_MAX - PAGE_SIZE)
+		return -EINVAL;
+
 	if (dev->sg)
 		return -EINVAL;
 
-- 
2.11.0
