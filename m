From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 10:23:21 +0000
Subject: [patch] drm/drm_crtc: return -EFAULT on copy_to_user errors
Message-Id: <20100604102321.GZ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

copy_from_user() returns the number of bytes left to be copied but we
want to return a negative error code here.  This is in the ioctl handler
so the error code get returned to userspace.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 994d23b..57cea01 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1840,8 +1840,10 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 
 		ret = copy_from_user(clips, clips_ptr,
 				     num_clips * sizeof(*clips));
-		if (ret)
+		if (ret) {
+			ret = -EFAULT;
 			goto out_err2;
+		}
 	}
 
 	if (fb->funcs->dirty) {
