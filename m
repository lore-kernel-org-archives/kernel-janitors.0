From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 May 2012 17:54:34 +0000
Subject: [patch] USB: Checking the wrong variable in usb_disable_lpm()
Message-Id: <20120522175434.GA29755@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We check "u1_params" instead of checking "u2_params".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff, not tested.

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 04fb834..25a7422 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3379,7 +3379,7 @@ int usb_disable_lpm(struct usb_device *udev)
 		return 0;
 
 	udev->lpm_disable_count++;
-	if ((udev->u1_params.timeout = 0 && udev->u1_params.timeout = 0))
+	if ((udev->u1_params.timeout = 0 && udev->u2_params.timeout = 0))
 		return 0;
 
 	/* If LPM is enabled, attempt to disable it. */
