From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 May 2018 08:12:54 +0000
Subject: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180509081254.qxcetabxj74hltoq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509072249.GA12754@mwanda>
In-Reply-To: <20180509072249.GA12754@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Padovan <gustavo@padovan.org>, David Herrmann <dh.herrmann@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There is a comment here which says that DIV_ROUND_UP() can overflow and
that's where the problem comes from.  Say you pick:

	args->bpp = UINT_MAX - 7;
	args->width = 4;
	args->height = 1;

The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
because of how we picked args->width that means cpp < UINT_MAX / 4.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: correct a typo in the commit message

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
