From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 06:33:31 +0000
Subject: [patch] USB: wwan: remove an unneeded check
Message-Id: <20120420063331.GB22649@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We already verified that "status" was zero on this else branch.  Since
zero is not equal to -ESHUTDOWN, this condition is always true.  I
removed it and pull everything in an indent level.

This doesn't change how the code works, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It could also be that it's supposed to be checking something else.  I
read through the history but status has always been zero here.

diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index c88657d..a38b980 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -307,20 +307,17 @@ static void usb_wwan_indat_callback(struct urb *urb)
 		}
 
 		/* Resubmit urb so we continue receiving */
-		if (status != -ESHUTDOWN) {
-			err = usb_submit_urb(urb, GFP_ATOMIC);
-			if (err) {
-				if (err != -EPERM) {
-					printk(KERN_ERR "%s: resubmit read urb failed. "
-						"(%d)", __func__, err);
-					/* busy also in error unless we are killed */
-					usb_mark_last_busy(port->serial->dev);
-				}
-			} else {
+		err = usb_submit_urb(urb, GFP_ATOMIC);
+		if (err) {
+			if (err != -EPERM) {
+				printk(KERN_ERR "%s: resubmit read urb failed. "
+					"(%d)", __func__, err);
+				/* busy also in error unless we are killed */
 				usb_mark_last_busy(port->serial->dev);
 			}
+		} else {
+			usb_mark_last_busy(port->serial->dev);
 		}
-
 	}
 }
 
