From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 14:30:04 +0000
Subject: [patch] vmwgfx: return -EFAULT if copy_to_user fails
Message-Id: <20100710143003.GZ19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org

copy_to_user() returns the number of bytes remaining to be copied, but
we want to return a negative error code.  This gets copied to user
space.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f1d6261..437ac78 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -972,6 +972,7 @@ int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 	ret = copy_from_user(rects, user_rects, rects_size);
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("Failed to get rects.\n");
+		ret = -EFAULT;
 		goto out_free;
 	}
 
