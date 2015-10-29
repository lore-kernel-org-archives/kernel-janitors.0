From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Oct 2015 13:37:54 +0000
Subject: [patch] drm: crtc: integer overflow in drm_property_create_blob()
Message-Id: <20151029133754.GA2862@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The size here comes from the user via the ioctl, it is a number between
1-u32max so the addition here could overflow on 32 bit systems.

Fixes: f453ba046074 ('DRM: add mode setting support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index e54660a..627b2d0 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -4107,7 +4107,7 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	struct drm_property_blob *blob;
 	int ret;
 
-	if (!length)
+	if (!length || length > ULONG_MAX - sizeof(struct drm_property_blob))
 		return ERR_PTR(-EINVAL);
 
 	blob = kzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
