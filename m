From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 06:20:59 +0000
Subject: [patch 2/2 -next] usb: gadget: f_hid: fix error handling in ghid_setup()
Message-Id: <20141113062059.GC1280@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were a two issues here.

1) We returned PTR_ERR(NULL) which means success if class_create()
   failed.
2) If alloc_chrdev_region() failed then we should clean up before
   returning.

Also kernel style is to have "error handling" as opposed to "success
handling".  In the original code checking for "if (!status) " is
confusing and this bad style is what lead to bug #2.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 220035f..cecdc75 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -972,17 +972,22 @@ int ghid_setup(struct usb_gadget *g, int count)
 
 	hidg_class = class_create(THIS_MODULE, "hidg");
 	if (IS_ERR(hidg_class)) {
+		status = PTR_ERR(hidg_class);
 		hidg_class = NULL;
-		return PTR_ERR(hidg_class);
+		return status;
 	}
 
 	status = alloc_chrdev_region(&dev, 0, count, "hidg");
-	if (!status) {
-		major = MAJOR(dev);
-		minors = count;
+	if (status) {
+		class_destroy(hidg_class);
+		hidg_class = NULL;
+		return status;
 	}
 
-	return status;
+	major = MAJOR(dev);
+	minors = count;
+
+	return 0;
 }
 
 void ghid_cleanup(void)
