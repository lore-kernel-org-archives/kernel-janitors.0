From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 16:45:23 +0000
Subject: [PATCH] [media] gspca: Use common error handling code in gspca_init_transfer()
Message-Id: <a5c4b993-1c06-3ccf-89b7-4ea74d23f580@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 18:40:05 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/gspca/gspca.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 0f141762abf1..22cdefe38e07 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -904,10 +904,8 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
 			ret = create_urbs(gspca_dev,
 				alt_xfer(&intf->altsetting[alt], xfer,
 					 gspca_dev->xfer_ep));
-			if (ret < 0) {
-				destroy_urbs(gspca_dev);
-				goto out;
-			}
+			if (ret < 0)
+				goto destroy_urbs;
 		}
 
 		/* clear the bulk endpoint */
@@ -917,10 +915,9 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
 
 		/* start the cam */
 		ret = gspca_dev->sd_desc->start(gspca_dev);
-		if (ret < 0) {
-			destroy_urbs(gspca_dev);
-			goto out;
-		}
+		if (ret < 0)
+			goto destroy_urbs;
+
 		gspca_dev->streaming = 1;
 		v4l2_ctrl_handler_setup(gspca_dev->vdev.ctrl_handler);
 
@@ -970,6 +967,10 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
 out:
 	gspca_input_create_urb(gspca_dev);
 	return ret;
+
+destroy_urbs:
+	destroy_urbs(gspca_dev);
+	goto out;
 }
 
 static void gspca_set_default_mode(struct gspca_dev *gspca_dev)
-- 
2.14.1

