From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Sep 2017 17:06:01 +0000
Subject: [PATCH] [media] spca500: Use common error handling code in spca500_synch310()
Message-Id: <d496ca24-1725-768b-5e55-4e45097cb77d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Sep 2017 18:45:07 +0200

Adjust a jump target so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/gspca/spca500.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/gspca/spca500.c b/drivers/media/usb/gspca/spca500.c
index da2d9027914c..1f224f5e5b19 100644
--- a/drivers/media/usb/gspca/spca500.c
+++ b/drivers/media/usb/gspca/spca500.c
@@ -501,7 +501,6 @@ static int spca500_full_reset(struct gspca_dev *gspca_dev)
 static int spca500_synch310(struct gspca_dev *gspca_dev)
 {
-	if (usb_set_interface(gspca_dev->dev, gspca_dev->iface, 0) < 0) {
-		PERR("Set packet size: set interface error");
-		goto error;
-	}
+	if (usb_set_interface(gspca_dev->dev, gspca_dev->iface, 0) < 0)
+		goto report_failure;
+
 	spca500_ping310(gspca_dev);
@@ -514,12 +513,12 @@ static int spca500_synch310(struct gspca_dev *gspca_dev)
 	/* Windoze use pipe with altsetting 6 why 7 here */
-	if (usb_set_interface(gspca_dev->dev,
-				gspca_dev->iface,
-				gspca_dev->alt) < 0) {
-		PERR("Set packet size: set interface error");
-		goto error;
-	}
+	if (usb_set_interface(gspca_dev->dev, gspca_dev->iface, gspca_dev->alt)
+	    < 0)
+		goto report_failure;
+
 	return 0;
-error:
+
+report_failure:
+	PERR("Set packet size: set interface error");
 	return -EBUSY;
 }
 
-- 
2.14.1

