From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Mar 2018 14:43:01 +0000
Subject: [PATCH] Input: usbtouchscreen - double lock typo in usbtouch_close(()
Message-Id: <20180319144301.GA13863@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a typo so we deadlock here instead of unlocking.

Fixes: 5648f00809c3 ("Input: usbtouchscreen - fix deadlock in autosuspend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 4ae1cbf9e858..c6cf90868503 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1479,7 +1479,7 @@ static void usbtouch_close(struct input_dev *input)
 	if (!usbtouch->type->irq_always)
 		usb_kill_urb(usbtouch->irq);
 	usbtouch->is_open = false;
-	mutex_lock(&usbtouch->pm_mutex);
+	mutex_unlock(&usbtouch->pm_mutex);
 
 	r = usb_autopm_get_interface(usbtouch->interface);
 	usbtouch->interface->needs_remote_wakeup = 0;
