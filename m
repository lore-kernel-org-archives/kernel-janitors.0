From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Nov 2016 10:28:35 +0000
Subject: [patch] [media] uvcvideo: freeing an error pointer
Message-Id: <20161125102835.GA5856@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Markus Elfring <elfring@users.sourceforge.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

A recent cleanup introduced a potential dereference of -EFAULT when we
call kfree(map->menu_info).

Fixes: 4cc5bed1caeb ("[media] uvcvideo: Use memdup_user() rather than duplicating its implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index a7e12fd..3e7e283 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -66,14 +66,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		if (xmap->menu_count = 0 ||
 		    xmap->menu_count > UVC_MAX_CONTROL_MENU_ENTRIES) {
 			ret = -EINVAL;
-			goto done;
+			goto free_map;
 		}
 
 		size = xmap->menu_count * sizeof(*map->menu_info);
 		map->menu_info = memdup_user(xmap->menu_info, size);
 		if (IS_ERR(map->menu_info)) {
 			ret = PTR_ERR(map->menu_info);
-			goto done;
+			goto free_map;
 		}
 
 		map->menu_count = xmap->menu_count;
@@ -83,13 +83,13 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		uvc_trace(UVC_TRACE_CONTROL, "Unsupported V4L2 control type "
 			  "%u.\n", xmap->v4l2_type);
 		ret = -ENOTTY;
-		goto done;
+		goto free_map;
 	}
 
 	ret = uvc_ctrl_add_mapping(chain, map);
 
-done:
 	kfree(map->menu_info);
+free_map:
 	kfree(map);
 
 	return ret;
