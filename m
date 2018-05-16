From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 14:00:26 +0000
Subject: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180516140026.GA19340@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <152585393757.3513.738158010667924495@mail.alporthouse.com>
In-Reply-To: <152585393757.3513.738158010667924495@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Padovan <gustavo@padovan.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There is a comment here which says that DIV_ROUND_UP() and that's where
the problem comes from.  Say you pick:

	args->bpp = UINT_MAX - 7;
	args->width = 4;
	args->height = 1;

The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
because of how we picked args->width that means cpp < UINT_MAX / 4.

I've fixed it by preventing the integer overflow in DIV_ROUND_UP().  I
removed the check for !cpp because it's not possible after this change.
I also changed all the 0xffffffffU references to U32_MAX.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  additional cleanups

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 39ac15ce4702..9e2ae02f31e0 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -65,12 +65,13 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* overflow checks for 32bit size calculations */
-	/* NOTE: DIV_ROUND_UP() can overflow */
+	if (args->bpp > U32_MAX - 8)
+		return -EINVAL;
 	cpp = DIV_ROUND_UP(args->bpp, 8);
-	if (!cpp || cpp > 0xffffffffU / args->width)
+	if (cpp > U32_MAX / args->width)
 		return -EINVAL;
 	stride = cpp * args->width;
-	if (args->height > 0xffffffffU / stride)
+	if (args->height > U32_MAX / stride)
 		return -EINVAL;
 
 	/* test for wrap-around */
