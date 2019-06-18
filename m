From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2019 12:56:23 +0000
Subject: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-Id: <20190618125623.GA24896@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return -EFAULT.  This function is called from
__drm_legacy_infobufs() which expects negative error codes.

Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This goes through Al's tree and not through drm.  Presumably this patch
will just get folded into the original.

 drivers/gpu/drm/drm_bufs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 68dacf8422c6..8ce9d73fab4f 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1351,7 +1351,10 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
 				 .size = from->buf_size,
 				 .low_mark = from->low_mark,
 				 .high_mark = from->high_mark};
-	return copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags));
+
+	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
+		return -EFAULT;
+	return 0;
 }
 
 int drm_legacy_infobufs(struct drm_device *dev, void *data,
-- 
2.20.1
