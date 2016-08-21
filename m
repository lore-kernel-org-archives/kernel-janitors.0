From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 14:04:48 +0000
Subject: [PATCH 6/7] USB-iowarrior: Delete unnecessary braces
Message-Id: <d19fb3b4-e73f-a225-ce8e-a8b6ebba0b4d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
In-Reply-To: <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Boyer <jwboyer@fedoraproject.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 15:25:30 +0200

Do not use curly brackets at a few source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/iowarrior.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index ffbbb74..132c8cf 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -227,10 +227,10 @@ static void iowarrior_write_callback(struct urb *urb)
 	/* sync/async unlink faults aren't errors */
 	if (status &&
 	    !(status = -ENOENT ||
-	      status = -ECONNRESET || status = -ESHUTDOWN)) {
+	      status = -ECONNRESET || status = -ESHUTDOWN))
 		dev_dbg(&dev->interface->dev,
 			"nonzero write bulk status received: %d\n", status);
-	}
+
 	/* free up our allocated buffer */
 	usb_free_coherent(urb->dev, urb->transfer_buffer_length,
 			  urb->transfer_buffer, urb->transfer_dma);
@@ -304,25 +304,21 @@ static ssize_t iowarrior_read(struct file *file, char __user *buffer,
 								      read_index
 								      (dev)) ! 								  -1));
-				if (r) {
+				if (r)
 					//we were interrupted by a signal
 					return -ERESTART;
-				}
-				if (!dev->present) {
+				if (!dev->present)
 					//The device was unplugged
 					return -ENODEV;
-				}
-				if (read_idx = -1) {
+				if (read_idx = -1)
 					// Can this happen ???
 					return 0;
-				}
 			}
 		}
 
 		offset = read_idx * (dev->report_size + 1);
-		if (copy_to_user(buffer, dev->read_queue + offset, count)) {
+		if (copy_to_user(buffer, dev->read_queue + offset, count))
 			return -EFAULT;
-		}
 	} while (atomic_read(&dev->overflow_flag));
 
 	read_idx = ++read_idx = MAX_INTERRUPT_BUFFER ? 0 : read_idx;
@@ -475,9 +471,8 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 	int io_res;		/* checks for bytes read/written and copy_to/from_user results */
 
 	dev = file->private_data;
-	if (dev = NULL) {
+	if (!dev)
 		return -ENODEV;
-	}
 
 	buffer = kzalloc(dev->report_size, GFP_KERNEL);
 	if (!buffer)
@@ -647,9 +642,8 @@ static int iowarrior_release(struct inode *inode, struct file *file)
 	int retval;
 
 	dev = file->private_data;
-	if (dev = NULL) {
+	if (!dev)
 		return -ENODEV;
-	}
 
 	dev_dbg(&dev->interface->dev, "minor %d\n", dev->minor);
 
-- 
2.9.3

