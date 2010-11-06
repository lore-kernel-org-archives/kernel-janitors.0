From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 06 Nov 2010 14:41:28 +0000
Subject: [PATCH] usb: core: fix information leak to userland
Message-Id: <1289054488-18233-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Alan Stern <stern@rowland.harvard.edu>, Andi Kleen <ak@linux.intel.com>, Chris Frey <cdfrey@foursquare.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Structure usbdevfs_connectinfo is copied to userland with padding byted
after "slow" field uninitialized.  It leads to leaking of contents of
kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/usb/core/devio.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index f1aaff6..045bb4b 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -965,10 +965,11 @@ static int proc_getdriver(struct dev_state *ps, void __user *arg)
 
 static int proc_connectinfo(struct dev_state *ps, void __user *arg)
 {
-	struct usbdevfs_connectinfo ci;
+	struct usbdevfs_connectinfo ci = {
+		.devnum = ps->dev->devnum,
+		.slow = ps->dev->speed = USB_SPEED_LOW
+	};
 
-	ci.devnum = ps->dev->devnum;
-	ci.slow = ps->dev->speed = USB_SPEED_LOW;
 	if (copy_to_user(arg, &ci, sizeof(ci)))
 		return -EFAULT;
 	return 0;
-- 
1.7.0.4

