From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Sep 2017 07:16:22 +0000
Subject: [PATCH] USB: devio: Prevent integer overflow in proc_do_submiturb()
Message-Id: <20170921071622.ue2oqayfivloxk7w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There used to be an integer overflow check in proc_do_submiturb() but
it accidentally got removed.  We need to put it back.  The
uurb->buffer_length variable is a signed integer and it's controlled by
the user.  It can lead to an integer overflow when we do:

	num_sgs = DIV_ROUND_UP(uurb->buffer_length, USB_SG_SIZE);

Fixes: 1129d270cbfb ("USB: Increase usbfs transfer limit")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 318bb3b96687..f3c9cff2101c 100644
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
+	if (uurb->buffer_length >= USBFS_XFER_MAX)
+		return -EINVAL;
 	if (uurb->buffer_length > 0 && !uurb->buffer)
 		return -EINVAL;
 	if (!(uurb->type = USBDEVFS_URB_TYPE_CONTROL &&
