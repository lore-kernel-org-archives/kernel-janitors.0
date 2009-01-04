From: Julia Lawall <julia@diku.dk>
Date: Sun, 04 Jan 2009 10:47:04 +0000
Subject: [PATCH] usb/core: Use usb_mark_last_busy
Message-Id: <Pine.LNX.4.64.0901041146290.28116@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

This patch introduces uses of the function usb_mark_last_busy, define in
include/linux/usb.h.  This function only has an effect if CONFIG_USB_SUSPEND
is set.  This is guaranteed to be the case in the first four modifications
below, but it might not be the case at the point of the last modification.
Thus in the last modification, the semantics might be changed.  But the
affected field last_busy appears only to be read if CONFIG_USB_SUSPEND is
set.  If this is the case, then not setting it when CONFIG_USB_SUSPEND
doesn't have any observable effect.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@header@
@@
#include <linux/usb.h>

@same depends on header@
position p;
@@
usb_mark_last_busy@p(...) { ... }

@depends on header@
position _p!=same.p;
identifier _f;
struct usb_device *udev;
@@

_f@_p(...) { <+...
- udev->last_busy = jiffies;
+ usb_mark_last_busy(udev);
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/core/driver.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1317,14 +1317,14 @@ static int usb_autopm_do_device(struct u
 	udev->pm_usage_cnt += inc_usage_cnt;
 	WARN_ON(udev->pm_usage_cnt < 0);
 	if (inc_usage_cnt)
-		udev->last_busy = jiffies;
+		usb_mark_last_busy(udev);
 	if (inc_usage_cnt >= 0 && udev->pm_usage_cnt > 0) {
 		if (udev->state = USB_STATE_SUSPENDED)
 			status = usb_resume_both(udev);
 		if (status != 0)
 			udev->pm_usage_cnt -= inc_usage_cnt;
 		else if (inc_usage_cnt)
-			udev->last_busy = jiffies;
+			usb_mark_last_busy(udev);
 	} else if (inc_usage_cnt <= 0 && udev->pm_usage_cnt <= 0) {
 		status = usb_suspend_both(udev, PMSG_SUSPEND);
 	}
@@ -1434,14 +1434,14 @@ static int usb_autopm_do_interface(struc
 	else {
 		udev->auto_pm = 1;
 		intf->pm_usage_cnt += inc_usage_cnt;
-		udev->last_busy = jiffies;
+		usb_mark_last_busy(udev);
 		if (inc_usage_cnt >= 0 && intf->pm_usage_cnt > 0) {
 			if (udev->state = USB_STATE_SUSPENDED)
 				status = usb_resume_both(udev);
 			if (status != 0)
 				intf->pm_usage_cnt -= inc_usage_cnt;
 			else
-				udev->last_busy = jiffies;
+				usb_mark_last_busy(udev);
 		} else if (inc_usage_cnt <= 0 && intf->pm_usage_cnt <= 0) {
 			status = usb_suspend_both(udev, PMSG_SUSPEND);
 		}
@@ -1610,7 +1610,7 @@ int usb_external_resume_device(struct us
 	usb_pm_lock(udev);
 	udev->auto_pm = 0;
 	status = usb_resume_both(udev);
-	udev->last_busy = jiffies;
+	usb_mark_last_busy(udev);
 	usb_pm_unlock(udev);
 	if (status = 0)
 		do_unbind_rebind(udev, DO_REBIND);
