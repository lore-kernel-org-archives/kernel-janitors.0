From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Aug 2005 13:24:26 +0000
Subject: [KJ] [PATCH] ldusb: fmt warnings fixes for 64-bit platforms
Message-Id: <20050814132426.GB15052@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25077972164615359=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25077972164615359==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix

drivers/usb/misc/ldusb.c: In function `ld_usb_read':
drivers/usb/misc/ldusb.c:467: warning: int format, different type arg (arg 4)
drivers/usb/misc/ldusb.c: In function `ld_usb_write':
drivers/usb/misc/ldusb.c:531: warning: int format, different type arg (arg 4)
drivers/usb/misc/ldusb.c:532: warning: int format, different type arg (arg 5)
drivers/usb/misc/ldusb.c:532: warning: int format, different type arg (arg 6)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/usb/misc/ldusb.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

--- linux-fmt.orig/drivers/usb/misc/ldusb.c
+++ linux-fmt/drivers/usb/misc/ldusb.c
@@ -464,7 +464,7 @@ static ssize_t ld_usb_read(struct file *
 	actual_buffer = (size_t*)(dev->ring_buffer + dev->ring_tail*(sizeof(size_t)+dev->interrupt_in_endpoint_size));
 	bytes_to_read = min(count, *actual_buffer);
 	if (bytes_to_read < *actual_buffer)
-		dev_warn(&dev->intf->dev, "Read buffer overflow, %d bytes dropped\n",
+		dev_warn(&dev->intf->dev, "Read buffer overflow, %zd bytes dropped\n",
 			 *actual_buffer-bytes_to_read);
 
 	/* copy one interrupt_in_buffer from ring_buffer into userspace */
@@ -528,8 +528,8 @@ static ssize_t ld_usb_write(struct file 
 	/* write the data into interrupt_out_buffer from userspace */
 	bytes_to_write = min(count, write_buffer_size*dev->interrupt_out_endpoint_size);
 	if (bytes_to_write < count)
-		dev_warn(&dev->intf->dev, "Write buffer overflow, %d bytes dropped\n",count-bytes_to_write);
-	dbg_info(&dev->intf->dev, "%s: count = %d, bytes_to_write = %d\n", __FUNCTION__, count, bytes_to_write);
+		dev_warn(&dev->intf->dev, "Write buffer overflow, %zd bytes dropped\n",count-bytes_to_write);
+	dbg_info(&dev->intf->dev, "%s: count = %zd, bytes_to_write = %zd\n", __FUNCTION__, count, bytes_to_write);
 
 	if (copy_from_user(dev->interrupt_out_buffer, buffer, bytes_to_write)) {
 		retval = -EFAULT;


--===============25077972164615359==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25077972164615359==--
