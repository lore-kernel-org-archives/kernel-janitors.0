From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Nov 2017 18:49:38 +0000
Subject: [PATCH] usbtmc: Use common error handling code in three functions
Message-Id: <90d821cf-6376-30e1-8621-0232a5d2f4bc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Nov 2017 19:36:56 +0100

* Adjust jump targets so that two error messages are stored only once
  at the end of these function implementations.

* Replace 11 calls of the function "dev_err" and 11 assignments to
  the variable "rv" by goto statements.

* Replace string literals by references to two global constant variables
  in eight functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/class/usbtmc.c | 157 +++++++++++++++++++++------------------------
 1 file changed, 74 insertions(+), 83 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 6adceacaa919..d8ed132965d8 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -133,6 +133,9 @@ static const struct usbtmc_ID_rigol_quirk usbtmc_id_quirk[] = {
 	{ 0, 0 }
 };
 
+static char const bulk_msg[] = "usb_bulk_msg returned %d\n";
+static char const control_msg[] = "usb_control_msg returned %d\n";
+
 /* Forward declarations */
 static struct usb_driver usbtmc_driver;
 
@@ -196,23 +199,20 @@ static int usbtmc_ioctl_abort_bulk_in(struct usbtmc_device_data *data)
 			     data->bTag_last_read, data->bulk_in,
 			     buffer, 2, USBTMC_TIMEOUT);
 
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "INITIATE_ABORT_BULK_IN returned %x\n", buffer[0]);
 
 	if (buffer[0] = USBTMC_STATUS_FAILED) {
 		rv = 0;
-		goto exit;
+		goto free_buffer;
 	}
 
 	if (buffer[0] != USBTMC_STATUS_SUCCESS) {
 		dev_err(dev, "INITIATE_ABORT_BULK_IN returned %x\n",
 			buffer[0]);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	max_size = 0;
@@ -224,8 +224,7 @@ static int usbtmc_ioctl_abort_bulk_in(struct usbtmc_device_data *data)
 
 	if (max_size = 0) {
 		dev_err(dev, "Couldn't get wMaxPacketSize\n");
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	dev_dbg(&data->intf->dev, "wMaxPacketSize is %d\n", max_size);
@@ -243,18 +242,15 @@ static int usbtmc_ioctl_abort_bulk_in(struct usbtmc_device_data *data)
 
 		n++;
 
-		if (rv < 0) {
-			dev_err(dev, "usb_bulk_msg returned %d\n", rv);
-			goto exit;
-		}
+		if (rv < 0)
+			goto report_bulk_failure;
 	} while ((actual = max_size) &&
 		 (n < USBTMC_MAX_READS_TO_CLEAR_BULK_IN));
 
 	if (actual = max_size) {
 		dev_err(dev, "Couldn't clear device buffer within %d cycles\n",
 			USBTMC_MAX_READS_TO_CLEAR_BULK_IN);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	n = 0;
@@ -266,23 +262,19 @@ static int usbtmc_ioctl_abort_bulk_in(struct usbtmc_device_data *data)
 			     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_ENDPOINT,
 			     0, data->bulk_in, buffer, 0x08,
 			     USBTMC_TIMEOUT);
-
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "INITIATE_ABORT_BULK_IN returned %x\n", buffer[0]);
 
 	if (buffer[0] = USBTMC_STATUS_SUCCESS) {
 		rv = 0;
-		goto exit;
+		goto free_buffer;
 	}
 
 	if (buffer[0] != USBTMC_STATUS_PENDING) {
 		dev_err(dev, "INITIATE_ABORT_BULK_IN returned %x\n", buffer[0]);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	if (buffer[1] = 1)
@@ -297,26 +289,34 @@ static int usbtmc_ioctl_abort_bulk_in(struct usbtmc_device_data *data)
 
 			n++;
 
-			if (rv < 0) {
-				dev_err(dev, "usb_bulk_msg returned %d\n", rv);
-				goto exit;
-			}
+			if (rv < 0)
+				goto report_bulk_failure;
 		} while ((actual = max_size) &&
 			 (n < USBTMC_MAX_READS_TO_CLEAR_BULK_IN));
 
 	if (actual = max_size) {
 		dev_err(dev, "Couldn't clear device buffer within %d cycles\n",
 			USBTMC_MAX_READS_TO_CLEAR_BULK_IN);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	goto usbtmc_abort_bulk_in_status;
 
-exit:
+free_buffer:
 	kfree(buffer);
 	return rv;
 
+e_perm:
+	rv = -EPERM;
+	goto free_buffer;
+
+report_bulk_failure:
+	dev_err(dev, bulk_msg, rv);
+	goto free_buffer;
+
+report_control_failure:
+	dev_err(dev, control_msg, rv);
+	goto free_buffer;
 }
 
 static int usbtmc_ioctl_abort_bulk_out(struct usbtmc_device_data *data)
@@ -338,19 +338,15 @@ static int usbtmc_ioctl_abort_bulk_out(struct usbtmc_device_data *data)
 			     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_ENDPOINT,
 			     data->bTag_last_write, data->bulk_out,
 			     buffer, 2, USBTMC_TIMEOUT);
-
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "INITIATE_ABORT_BULK_OUT returned %x\n", buffer[0]);
 
 	if (buffer[0] != USBTMC_STATUS_SUCCESS) {
 		dev_err(dev, "INITIATE_ABORT_BULK_OUT returned %x\n",
 			buffer[0]);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	n = 0;
@@ -363,10 +359,8 @@ static int usbtmc_ioctl_abort_bulk_out(struct usbtmc_device_data *data)
 			     0, data->bulk_out, buffer, 0x08,
 			     USBTMC_TIMEOUT);
 	n++;
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "CHECK_ABORT_BULK_OUT returned %x\n", buffer[0]);
 
@@ -377,22 +371,26 @@ static int usbtmc_ioctl_abort_bulk_out(struct usbtmc_device_data *data)
 	    (n < USBTMC_MAX_READS_TO_CLEAR_BULK_IN))
 		goto usbtmc_abort_bulk_out_check_status;
 
-	rv = -EPERM;
-	goto exit;
+	goto e_perm;
 
 usbtmc_abort_bulk_out_clear_halt:
 	rv = usb_clear_halt(data->usb_dev,
 			    usb_sndbulkpipe(data->usb_dev, data->bulk_out));
+	if (rv < 0)
+		goto report_control_failure;
 
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
 	rv = 0;
-
-exit:
+free_buffer:
 	kfree(buffer);
 	return rv;
+
+e_perm:
+	rv = -EPERM;
+	goto free_buffer;
+
+report_control_failure:
+	dev_err(dev, control_msg, rv);
+	goto free_buffer;
 }
 
 static int usbtmc488_ioctl_read_stb(struct usbtmc_device_data *data,
@@ -643,7 +641,7 @@ static ssize_t usbtmc_read(struct file *filp, char __user *buf,
 
 			retval = send_request_dev_dep_msg_in(data, this_part);
 			if (retval < 0) {
-			dev_err(dev, "usb_bulk_msg returned %d\n", retval);
+				dev_err(dev, bulk_msg, retval);
 				if (data->auto_abort)
 					usbtmc_ioctl_abort_bulk_out(data);
 				goto exit;
@@ -890,17 +888,14 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 			     USBTMC_REQUEST_INITIATE_CLEAR,
 			     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			     0, 0, buffer, 1, USBTMC_TIMEOUT);
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "INITIATE_CLEAR returned %x\n", buffer[0]);
 
 	if (buffer[0] != USBTMC_STATUS_SUCCESS) {
 		dev_err(dev, "INITIATE_CLEAR returned %x\n", buffer[0]);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	max_size = 0;
@@ -913,8 +908,7 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 
 	if (max_size = 0) {
 		dev_err(dev, "Couldn't get wMaxPacketSize\n");
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	dev_dbg(dev, "wMaxPacketSize is %d\n", max_size);
@@ -930,10 +924,8 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 			     USBTMC_REQUEST_CHECK_CLEAR_STATUS,
 			     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			     0, 0, buffer, 2, USBTMC_TIMEOUT);
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
+	if (rv < 0)
+		goto report_control_failure;
 
 	dev_dbg(dev, "CHECK_CLEAR_STATUS returned %x\n", buffer[0]);
 
@@ -942,8 +934,7 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 
 	if (buffer[0] != USBTMC_STATUS_PENDING) {
 		dev_err(dev, "CHECK_CLEAR_STATUS returned %x\n", buffer[0]);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	if (buffer[1] = 1)
@@ -957,19 +948,15 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 					  &actual, USBTMC_TIMEOUT);
 			n++;
 
-			if (rv < 0) {
-				dev_err(dev, "usb_control_msg returned %d\n",
-					rv);
-				goto exit;
-			}
+			if (rv < 0)
+				goto report_control_failure;
 		} while ((actual = max_size) &&
 			  (n < USBTMC_MAX_READS_TO_CLEAR_BULK_IN));
 
 	if (actual = max_size) {
 		dev_err(dev, "Couldn't clear device buffer within %d cycles\n",
 			USBTMC_MAX_READS_TO_CLEAR_BULK_IN);
-		rv = -EPERM;
-		goto exit;
+		goto e_perm;
 	}
 
 	goto usbtmc_clear_check_status;
@@ -978,15 +965,21 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 
 	rv = usb_clear_halt(data->usb_dev,
 			    usb_sndbulkpipe(data->usb_dev, data->bulk_out));
-	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
-		goto exit;
-	}
-	rv = 0;
+	if (rv < 0)
+		goto report_control_failure;
 
-exit:
+	rv = 0;
+free_buffer:
 	kfree(buffer);
 	return rv;
+
+e_perm:
+	rv = -EPERM;
+	goto free_buffer;
+
+report_control_failure:
+	dev_err(dev, control_msg, rv);
+	goto free_buffer;
 }
 
 static int usbtmc_ioctl_clear_out_halt(struct usbtmc_device_data *data)
@@ -997,8 +990,7 @@ static int usbtmc_ioctl_clear_out_halt(struct usbtmc_device_data *data)
 			    usb_sndbulkpipe(data->usb_dev, data->bulk_out));
 
 	if (rv < 0) {
-		dev_err(&data->usb_dev->dev, "usb_control_msg returned %d\n",
-			rv);
+		dev_err(&data->usb_dev->dev, control_msg, rv);
 		return rv;
 	}
 	return 0;
@@ -1012,8 +1004,7 @@ static int usbtmc_ioctl_clear_in_halt(struct usbtmc_device_data *data)
 			    usb_rcvbulkpipe(data->usb_dev, data->bulk_in));
 
 	if (rv < 0) {
-		dev_err(&data->usb_dev->dev, "usb_control_msg returned %d\n",
-			rv);
+		dev_err(&data->usb_dev->dev, control_msg, rv);
 		return rv;
 	}
 	return 0;
@@ -1034,7 +1025,7 @@ static int get_capabilities(struct usbtmc_device_data *data)
 			     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			     0, 0, buffer, 0x18, USBTMC_TIMEOUT);
 	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
+		dev_err(dev, control_msg, rv);
 		goto err_out;
 	}
 
@@ -1174,7 +1165,7 @@ static int usbtmc_ioctl_indicator_pulse(struct usbtmc_device_data *data)
 			     0, 0, buffer, 0x01, USBTMC_TIMEOUT);
 
 	if (rv < 0) {
-		dev_err(dev, "usb_control_msg returned %d\n", rv);
+		dev_err(dev, control_msg, rv);
 		goto exit;
 	}
 
-- 
2.15.0

