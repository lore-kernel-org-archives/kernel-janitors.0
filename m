From: John Daiker <daikerjohn@gmail.com>
Date: Fri, 29 Dec 2006 08:50:02 +0000
Subject: [KJ] [PATCH] USB Gadget file_storage.c: remove unnecessary casts
Message-Id: <4594D6BA.2050708@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: John Daiker <daikerjohn@gmail.com>

Went looking through some usb stuff and found some unnecessary casts in file_storage.c  This is part of the KernelJanitors TODO list.

Signed-off-by: John Daiker <daikerjohn@gmail.com>

--- linux-2.6.orig/drivers/usb/gadget/file_storage.c	2006-12-28 23:16:31.000000000 -0800
+++ linux-2.6/drivers/usb/gadget/file_storage.c	2006-12-29 00:07:35.000000000 -0800
@@ -1148,7 +1148,7 @@
 
 static void ep0_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct fsg_dev		*fsg = (struct fsg_dev *) ep->driver_data;
+	struct fsg_dev		*fsg = ep->driver_data;
 
 	if (req->actual > 0)
 		dump_msg(fsg, fsg->ep0req_name, req->buf, req->actual);
@@ -1170,8 +1170,8 @@
 
 static void bulk_in_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct fsg_dev		*fsg = (struct fsg_dev *) ep->driver_data;
-	struct fsg_buffhd	*bh = (struct fsg_buffhd *) req->context;
+	struct fsg_dev		*fsg = ep->driver_data;
+	struct fsg_buffhd	*bh = req->context;
 
 	if (req->status || req->actual != req->length)
 		DBG(fsg, "%s --> %d, %u/%u\n", __FUNCTION__,
@@ -1190,8 +1190,8 @@
 
 static void bulk_out_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct fsg_dev		*fsg = (struct fsg_dev *) ep->driver_data;
-	struct fsg_buffhd	*bh = (struct fsg_buffhd *) req->context;
+	struct fsg_dev		*fsg = ep->driver_data;
+	struct fsg_buffhd	*bh = req->context;
 
 	dump_msg(fsg, "bulk-out", req->buf, req->actual);
 	if (req->status || req->actual != bh->bulk_out_intended_length)
@@ -1214,8 +1214,8 @@
 #ifdef CONFIG_USB_FILE_STORAGE_TEST
 static void intr_in_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct fsg_dev		*fsg = (struct fsg_dev *) ep->driver_data;
-	struct fsg_buffhd	*bh = (struct fsg_buffhd *) req->context;
+	struct fsg_dev		*fsg = ep->driver_data;
+	struct fsg_buffhd	*bh = req->context;
 
 	if (req->status || req->actual != req->length)
 		DBG(fsg, "%s --> %d, %u/%u\n", __FUNCTION__,
@@ -2577,7 +2577,7 @@
 	}
 
 	if (transport_is_bbb()) {
-		struct bulk_cs_wrap	*csw = (struct bulk_cs_wrap *) bh->buf;
+		struct bulk_cs_wrap	*csw = bh->buf;
 
 		/* Store and send the Bulk-only CSW */
 		csw->Signature = __constant_cpu_to_le32(USB_BULK_CS_SIG);
@@ -2596,8 +2596,7 @@
 		return 0;
 
 	} else {			// USB_PR_CBI
-		struct interrupt_data	*buf = (struct interrupt_data *)
-						bh->buf;
+		struct interrupt_data	*buf = bh->buf;
 
 		/* Store and send the Interrupt data.  UFI sends the ASC
 		 * and ASCQ bytes.  Everything else sends a Type (which
@@ -2982,7 +2981,7 @@
 static int received_cbw(struct fsg_dev *fsg, struct fsg_buffhd *bh)
 {
 	struct usb_request	*req = bh->outreq;
-	struct bulk_cb_wrap	*cbw = (struct bulk_cb_wrap *) req->buf;
+	struct bulk_cb_wrap	*cbw = req->buf;
 
 	/* Was this a real packet? */
 	if (req->status)
@@ -3428,7 +3427,7 @@
 
 static int fsg_main_thread(void *fsg_)
 {
-	struct fsg_dev		*fsg = (struct fsg_dev *) fsg_;
+	struct fsg_dev		*fsg = fsg_;
 
 	/* Allow the thread to be killed by a signal, but set the signal mask
 	 * to block everything but INT, TERM, KILL, and USR1. */
@@ -3600,7 +3599,7 @@
 static ssize_t show_file(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct lun	*curlun = dev_to_lun(dev);
-	struct fsg_dev	*fsg = (struct fsg_dev *) dev_get_drvdata(dev);
+	struct fsg_dev	*fsg = dev_get_drvdata(dev);
 	char		*p;
 	ssize_t		rc;
 
@@ -3629,7 +3628,7 @@
 {
 	ssize_t		rc = count;
 	struct lun	*curlun = dev_to_lun(dev);
-	struct fsg_dev	*fsg = (struct fsg_dev *) dev_get_drvdata(dev);
+	struct fsg_dev	*fsg = dev_get_drvdata(dev);
 	int		i;
 
 	if (sscanf(buf, "%d", &i) != 1)
@@ -3652,7 +3651,7 @@
 static ssize_t store_file(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct lun	*curlun = dev_to_lun(dev);
-	struct fsg_dev	*fsg = (struct fsg_dev *) dev_get_drvdata(dev);
+	struct fsg_dev	*fsg = dev_get_drvdata(dev);
 	int		rc = 0;
 
 	if (curlun->prevent_medium_removal && backing_file_is_open(curlun)) {
@@ -3700,7 +3699,7 @@
 
 static void lun_release(struct device *dev)
 {
-	struct fsg_dev	*fsg = (struct fsg_dev *) dev_get_drvdata(dev);
+	struct fsg_dev	*fsg = dev_get_drvdata(dev);
 
 	kref_put(&fsg->ref, fsg_release);
 }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
