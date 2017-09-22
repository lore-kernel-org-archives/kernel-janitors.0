From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Sep 2017 20:43:25 +0000
Subject: [PATCH v2 1/2] USB: devio: Prevent integer overflow in proc_do_submiturb()
Message-Id: <20170922204324.i2i2g6zzt5s4kyen@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There used to be an integer overflow check in proc_do_submiturb() but
we removed it.  It turns out that it's still required.  The
uurb->buffer_length variable is a signed integer and it's controlled by
the user.  It can lead to an integer overflow when we do:

	num_sgs = DIV_ROUND_UP(uurb->buffer_length, USB_SG_SIZE);

If we strip away the macro then that line looks like this:

	num_sgs = (uurb->buffer_length + USB_SG_SIZE - 1) / USB_SG_SIZE;
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It's the first addition which can overflow.

Fixes: 1129d270cbfb ("USB: Increase usbfs transfer limit")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Cast the ->buffer_length to unsigned int which is more readable than
    relying on type promotion.

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 318bb3b96687..4664e543cf2f 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -140,6 +140,9 @@ module_param(usbfs_memory_mb, uint, 0644);
 MODULE_PARM_DESC(usbfs_memory_mb,
 		"maximum MB allowed for usbfs buffers (0 = no limit)");
 
+/* Hard limit, necessary to avoid arithmetic overflow */
+#define USBFS_XFER_MAX         (UINT_MAX / 2 - 1000000)
+
 static atomic64_t usbfs_memory_usage;	/* Total memory currently allocated */
 
 /* Check whether it's okay to allocate more memory for a transfer */
@@ -1460,6 +1463,8 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 				USBDEVFS_URB_ZERO_PACKET |
 				USBDEVFS_URB_NO_INTERRUPT))
 		return -EINVAL;
+	if ((unsigned int)uurb->buffer_length >= USBFS_XFER_MAX)
+		return -EINVAL;
 	if (uurb->buffer_length > 0 && !uurb->buffer)
 		return -EINVAL;
 	if (!(uurb->type = USBDEVFS_URB_TYPE_CONTROL &&
