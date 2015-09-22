From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2015 14:32:08 +0000
Subject: [patch 4/4 v2] drm/qxl: integer overflow in qxl_alloc_surf_ioctl()
Message-Id: <20150922143208.GA2319@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <421515033.28673933.1442569564307.JavaMail.zimbra@redhat.com>
In-Reply-To: <421515033.28673933.1442569564307.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Frediano Ziglio <fziglio@redhat.com>

The size calculation can overflow.  I don't know if this leads to
memory corruption, but it causes a static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I don't know think the size is capped anywhere.  In my first version
of this patch, I introduced a divide by zero bug.

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index b2db482..49b3158 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -396,12 +396,14 @@ static int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data,
 	struct qxl_bo *qobj;
 	int handle;
 	int ret;
-	int size, actual_stride;
+	u64 size, actual_stride;
 	struct qxl_surface surf;
 
 	/* work out size allocate bo with handle */
 	actual_stride = param->stride < 0 ? -param->stride : param->stride;
 	size = actual_stride * param->height + actual_stride;
+	if (size > INT_MAX)
+		return -EINVAL;
 
 	surf.format = param->format;
 	surf.width = param->width;
