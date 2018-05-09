From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 May 2018 07:22:49 +0000
Subject: [PATCH] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180509072249.GA12754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Padovan <gustavo@padovan.org>, David Herrmann <dh.herrmann@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There is a comment here which says that DIV_ROUND_UP() and that's where
the problem comes from.  Say you pick:

	args->bpp = UINT_MAX - 7;
	args->width = 4;
	args->height = 1;

The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
because of how we picked args->width that means cpp < UINT_MAX / 4.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, DIV_ROUND_UP() integer overflows have been a recurring source of
bugs so I have an unreleased static checker warning specific for that.
This line triggers three warnings for me on my unreleased code:

drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: negative user subtract: 0-u32max - 1
drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: potential integer overflow from user '(args->bpp) + (8)'
drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: potential integer overflow in 'DIV_ROUND_UP'

It's a pretty common idiom in the kernel to overflow and then test for
it later so I'm not able to release this code because of the number of
false positives that this idiom causes...

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 39ac15ce4702..45b0b5bbb5f8 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -65,7 +65,8 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* overflow checks for 32bit size calculations */
-	/* NOTE: DIV_ROUND_UP() can overflow */
+	if (args->bpp > UINT_MAX - 8)
+		return -EINVAL;
 	cpp = DIV_ROUND_UP(args->bpp, 8);
 	if (!cpp || cpp > 0xffffffffU / args->width)
 		return -EINVAL;
