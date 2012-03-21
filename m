From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2012 06:35:23 +0000
Subject: [patch] [media] uvcvideo: remove unneeded access_ok() check
Message-Id: <20120321063523.GA20062@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_in_user() already checks for write permission, so we don't need to
do it here.  This was added in 1a5e4c867c "[media] uvcvideo: Implement
compat_ioctl32 for custom ioctls".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/uvc/uvc_v4l2.c b/drivers/media/video/uvc/uvc_v4l2.c
index ff2cddd..111bfff 100644
--- a/drivers/media/video/uvc/uvc_v4l2.c
+++ b/drivers/media/video/uvc/uvc_v4l2.c
@@ -1105,8 +1105,6 @@ static int uvc_v4l2_put_xu_mapping(const struct uvc_xu_control_mapping *kp,
 	if (get_user(p, &up->menu_info))
 		return -EFAULT;
 	umenus = compat_ptr(p);
-	if (!access_ok(VERIFY_WRITE, umenus, kp->menu_count * sizeof(*umenus)))
-		return -EFAULT;
 
 	if (copy_in_user(umenus, kmenus, kp->menu_count * sizeof(*umenus)))
 		return -EFAULT;
