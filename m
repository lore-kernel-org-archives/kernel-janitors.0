From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 12:40:28 +0000
Subject: [PATCH] [media] Siano: Use common error handling code in smsusb_init_device()
Message-Id: <be0003e5-d8e0-bff6-2205-7e88270ba2b4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 14:30:55 +0200

Add a jump target so that a bit of exception handling can be better
reused at the end of this function.

This refactoring might fix also an error situation where the
function "kfree" was not called after a software failure
was noticed in two cases.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/siano/smsusb.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 8c1f926567ec..b8e7b05cf6d0 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -458,12 +458,10 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	rc = smscore_register_device(&params, &dev->coredev, mdev);
 	if (rc < 0) {
 		pr_err("smscore_register_device(...) failed, rc %d\n", rc);
-		smsusb_term_device(intf);
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
 		media_device_unregister(mdev);
 #endif
-		kfree(mdev);
-		return rc;
+		goto terminate_device;
 	}
 
 	smscore_set_board_id(dev->coredev, board_id);
@@ -480,8 +478,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	rc = smsusb_start_streaming(dev);
 	if (rc < 0) {
 		pr_err("smsusb_start_streaming(...) failed\n");
-		smsusb_term_device(intf);
-		return rc;
+		goto terminate_device;
 	}
 
 	dev->state = SMSUSB_ACTIVE;
@@ -489,13 +486,17 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	rc = smscore_start_device(dev->coredev);
 	if (rc < 0) {
 		pr_err("smscore_start_device(...) failed\n");
-		smsusb_term_device(intf);
-		return rc;
+		goto terminate_device;
 	}
 
 	pr_debug("device 0x%p created\n", dev);
 
 	return rc;
+
+terminate_device:
+	smsusb_term_device(intf);
+	kfree(mdev);
+	return rc;
 }
 
 static int smsusb_probe(struct usb_interface *intf,
-- 
2.14.1

