From: <gregkh@suse.de>
Date: Tue, 16 Aug 2005 00:57:33 +0000
Subject: [KJ] patch usb-ldusb-64-bit-warnings.patch added to gregkh-2.6 tree
Message-Id: <1E4pll-7V0-00@press.kroah.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94062142865606302=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94062142865606302==


This is a note to let you know that I've just added the patch titled

     Subject: USB ldusb: fmt warnings fixes for 64-bit platforms

to my gregkh-2.6 tree.  Its filename is

     usb-ldusb-64-bit-warnings.patch

This tree can be found at 
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/

Patches currently in gregkh-2.6 which might be from adobriyan@gmail.com are

i2c/hwmon-split-round2-10.patch
usb/usb-ldusb-64-bit-warnings.patch


From kernel-janitors-bounces@lists.osdl.org Sun Aug 14 14:33:19 2005
Date: Sun, 14 Aug 2005 17:24:26 +0400
From: Alexey Dobriyan <adobriyan@gmail.com>
To: <kernel-janitors@lists.osdl.org>
Message-ID: <20050814132426.GB15052@mipter.zuzino.mipt.ru>
Subject: USB ldusb: fmt warnings fixes for 64-bit platforms

Fix

drivers/usb/misc/ldusb.c: In function `ld_usb_read':
drivers/usb/misc/ldusb.c:467: warning: int format, different type arg (arg 4)
drivers/usb/misc/ldusb.c: In function `ld_usb_write':
drivers/usb/misc/ldusb.c:531: warning: int format, different type arg (arg 4)
drivers/usb/misc/ldusb.c:532: warning: int format, different type arg (arg 5)
drivers/usb/misc/ldusb.c:532: warning: int format, different type arg (arg 6)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/usb/misc/ldusb.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

--- gregkh-2.6.orig/drivers/usb/misc/ldusb.c	2005-08-15 17:50:06.000000000 -0700
+++ gregkh-2.6/drivers/usb/misc/ldusb.c	2005-08-15 17:50:18.000000000 -0700
@@ -464,7 +464,7 @@
 	actual_buffer = (size_t*)(dev->ring_buffer + dev->ring_tail*(sizeof(size_t)+dev->interrupt_in_endpoint_size));
 	bytes_to_read = min(count, *actual_buffer);
 	if (bytes_to_read < *actual_buffer)
-		dev_warn(&dev->intf->dev, "Read buffer overflow, %d bytes dropped\n",
+		dev_warn(&dev->intf->dev, "Read buffer overflow, %zd bytes dropped\n",
 			 *actual_buffer-bytes_to_read);
 
 	/* copy one interrupt_in_buffer from ring_buffer into userspace */
@@ -528,8 +528,8 @@
 	/* write the data into interrupt_out_buffer from userspace */
 	bytes_to_write = min(count, write_buffer_size*dev->interrupt_out_endpoint_size);
 	if (bytes_to_write < count)
-		dev_warn(&dev->intf->dev, "Write buffer overflow, %d bytes dropped\n",count-bytes_to_write);
-	dbg_info(&dev->intf->dev, "%s: count = %d, bytes_to_write = %d\n", __FUNCTION__, count, bytes_to_write);
+		dev_warn(&dev->intf->dev, "Write buffer overflow, %zd bytes dropped\n",count-bytes_to_write);
+	dbg_info(&dev->intf->dev, "%s: count = %zd, bytes_to_write = %zd\n", __FUNCTION__, count, bytes_to_write);
 
 	if (copy_from_user(dev->interrupt_out_buffer, buffer, bytes_to_write)) {
 		retval = -EFAULT;

--===============94062142865606302==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94062142865606302==--
