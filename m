From: Dan Carpenter <error27@gmail.com>
Date: Fri, 26 Aug 2011 09:21:13 +0000
Subject: [patch] dwc3: add a kfree() on error to dwc3_testmode_open()
Message-Id: <20110826092113.GO5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "open list:DESIGNWARE USB3 D..." <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DESIGNWARE USB3 D..." <linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We may as well fix this potential leak so we don't have to listen to
the static checkers complain.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Btw.  This function returns -EBUSY on success.  Was that really what
you want?

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 432df53..dd861c4 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -445,8 +445,10 @@ static int dwc3_testmode_open(struct inode *inode, struct file *file)
 	if (!buf0)
 		return -ENOMEM;
 	buf1 = kmalloc(BUF_SIZE, GFP_KERNEL);
-	if (!buf1)
+	if (!buf1) {
+		kfree(buf0);
 		return -ENOMEM;
+	}
 
 	memset(buf0, 0xaa, BUF_SIZE);
 	memset(buf1, 0x33, BUF_SIZE);
