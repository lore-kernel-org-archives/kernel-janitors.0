From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Apr 2020 14:51:19 +0000
Subject: [PATCH] usb: raw-gadget: Fix copy_to/from_user() checks
Message-Id: <20200406145119.GG68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Andrey Konovalov <andreyknvl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_to/from_user() functions return the number of bytes remaining
but we want to return negative error codes.  I changed a couple checks
in raw_ioctl_ep_read() and raw_ioctl_ep0_read() to show that we still
we returning zero on error.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 76406343fbe5..e490ffa1f58b 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -392,9 +392,8 @@ static int raw_ioctl_init(struct raw_dev *dev, unsigned long value)
 	char *udc_device_name;
 	unsigned long flags;
 
-	ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
-	if (ret)
-		return ret;
+	if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
+		return -EFAULT;
 
 	switch (arg.speed) {
 	case USB_SPEED_UNKNOWN:
@@ -501,15 +500,13 @@ static int raw_ioctl_run(struct raw_dev *dev, unsigned long value)
 
 static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 {
-	int ret = 0;
 	struct usb_raw_event arg;
 	unsigned long flags;
 	struct usb_raw_event *event;
 	uint32_t length;
 
-	ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
-	if (ret)
-		return ret;
+	if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
+		return -EFAULT;
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (dev->state != STATE_DEV_RUNNING) {
@@ -530,20 +527,19 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 		return -EINTR;
 	}
 	length = min(arg.length, event->length);
-	ret = copy_to_user((void __user *)value, event,
-				sizeof(*event) + length);
-	return ret;
+	if (copy_to_user((void __user *)value, event, sizeof(*event) + length))
+		return -EFAULT;
+
+	return 0;
 }
 
 static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
 				bool get_from_user)
 {
-	int ret;
 	void *data;
 
-	ret = copy_from_user(io, ptr, sizeof(*io));
-	if (ret)
-		return ERR_PTR(ret);
+	if (copy_from_user(io, ptr, sizeof(*io)))
+		return ERR_PTR(-EFAULT);
 	if (io->ep >= USB_RAW_MAX_ENDPOINTS)
 		return ERR_PTR(-EINVAL);
 	if (!usb_raw_io_flags_valid(io->flags))
@@ -658,12 +654,13 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep0_io(dev, &io, data, false);
-	if (ret < 0) {
-		kfree(data);
-		return ret;
-	}
+	if (ret)
+		goto free;
+
 	length = min(io.length, (unsigned int)ret);
-	ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
+	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
+		ret = -EFAULT;
+free:
 	kfree(data);
 	return ret;
 }
@@ -952,12 +949,13 @@ static int raw_ioctl_ep_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep_io(dev, &io, data, false);
-	if (ret < 0) {
-		kfree(data);
-		return ret;
-	}
+	if (ret)
+		goto free;
+
 	length = min(io.length, (unsigned int)ret);
-	ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
+	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
+		ret = -EFAULT;
+free:
 	kfree(data);
 	return ret;
 }
