From: Dan Carpenter <error27@gmail.com>
Date: Wed, 29 Jun 2011 10:10:25 +0000
Subject: [patch] usb: remove unneeded NULL check in usb_disconnect()
Message-Id: <20110629101025.GF14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "udev" and then immediately check whether it's NULL
which makes the static checkers complain.  "udev" isn't NULL here so
the check can be removed.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Alan Stern says it can never be NULL and I double checked as well.
usb_disconnect() is only called from hub.c and hcd.c.

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a428aa0..99fff6b 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1636,11 +1636,6 @@ void usb_disconnect(struct usb_device **pdev)
 	int			i;
 	struct usb_hcd		*hcd = bus_to_hcd(udev->bus);
 
-	if (!udev) {
-		pr_debug ("%s nodev\n", __func__);
-		return;
-	}
-
 	/* mark the device as inactive, so any further urb submissions for
 	 * this device (and any of its children) will fail immediately.
 	 * this quiesces everything except pending urbs.
