From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Jan 2013 07:03:43 +0000
Subject: [patch] [media] tm6000: check an allocation for failure
Message-Id: <20130130070343.GA12396@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This allocation had no error checking.  It didn't need to be under
the mutex so I moved it out form there. That makes the error handling
easier and is a potential speed up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/tm6000/tm6000-core.c b/drivers/media/usb/tm6000/tm6000-core.c
index 22cc011..7c32353 100644
--- a/drivers/media/usb/tm6000/tm6000-core.c
+++ b/drivers/media/usb/tm6000/tm6000-core.c
@@ -40,10 +40,13 @@ int tm6000_read_write_usb(struct tm6000_core *dev, u8 req_type, u8 req,
 	u8	     *data = NULL;
 	int delay = 5000;
 
-	mutex_lock(&dev->usb_lock);
-
-	if (len)
+	if (len) {
 		data = kzalloc(len, GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+	}
+
+	mutex_lock(&dev->usb_lock);
 
 	if (req_type & USB_DIR_IN)
 		pipe = usb_rcvctrlpipe(dev->udev, 0);
