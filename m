From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 12 Nov 2012 11:07:24 +0000
Subject: [patch] vmwgfx: return an -EFAULT if copy_to_user() fails
Message-Id: <20121112110724.GA1678@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Thomas Meyer <thomas@m3y3r.de>

copy_to_user() returns the number of bytes remaining to be copied, but
we want to return a negative error code here.  I fixed a couple of these
last year, but I missed this one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I think there were only three copy_to/from_user() functions in this
file and they're all fixed now.

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index b07ca2e..7290811 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -110,6 +110,8 @@ int vmw_get_cap_3d_ioctl(struct drm_device *dev, void *data,
 	memcpy_fromio(bounce, &fifo_mem[SVGA_FIFO_3D_CAPS], size);
 
 	ret = copy_to_user(buffer, bounce, size);
+	if (ret)
+		ret = -EFAULT;
 	vfree(bounce);
 
 	if (unlikely(ret != 0))
