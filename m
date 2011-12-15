From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 06:34:45 +0000
Subject: [patch -longterm] V4L/DVB: v4l2-ioctl: integer overflow in
Message-Id: <20111215063445.GA2424@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, stable@vger.kernel.org

On a 32bit system the multiplication here could overflow.  p->count is
used in some of the V4L drivers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a patch against the 2.6.32-longterm kernel.  In the stock
kernel, this code was totally rewritten and fixed in 2010 by d14e6d76ebf
"[media] v4l: Add multi-planar ioctl handling code".

Hopefully, someone can Ack this and we merge it into the stable tree.

diff --git a/drivers/media/video/v4l2-ioctl.c b/drivers/media/video/v4l2-ioctl.c
index 265bfb5..7196303 100644
--- a/drivers/media/video/v4l2-ioctl.c
+++ b/drivers/media/video/v4l2-ioctl.c
@@ -414,6 +414,9 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
 		p->error_idx = p->count;
 		user_ptr = (void __user *)p->controls;
 		if (p->count) {
+			err = -EINVAL;
+			if (p->count > ULONG_MAX / sizeof(struct v4l2_ext_control))
+				goto out_ext_ctrl;
 			ctrls_size = sizeof(struct v4l2_ext_control) * p->count;
 			/* Note: v4l2_ext_controls fits in sbuf[] so mbuf is still NULL. */
 			mbuf = kmalloc(ctrls_size, GFP_KERNEL);
@@ -1912,6 +1915,9 @@ long video_ioctl2(struct file *file,
 		p->error_idx = p->count;
 		user_ptr = (void __user *)p->controls;
 		if (p->count) {
+			err = -EINVAL;
+			if (p->count > ULONG_MAX / sizeof(struct v4l2_ext_control))
+				goto out_ext_ctrl;
 			ctrls_size = sizeof(struct v4l2_ext_control) * p->count;
 			/* Note: v4l2_ext_controls fits in sbuf[] so mbuf is still NULL. */
 			mbuf = kmalloc(ctrls_size, GFP_KERNEL);
