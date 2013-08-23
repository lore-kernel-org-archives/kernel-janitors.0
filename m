From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 08:14:49 +0000
Subject: [patch] gadgetfs: use after free in dev_release()
Message-Id: <20130823081449.GA31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The call to put_dev() releases "dev".  Hopefully, we don't need to set
the state to STATE_DEV_DISABLED anyway so I have removed those lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I haven't tested this, but I'm pretty sure it's
correct.

diff --git a/drivers/usb/gadget/inode.c b/drivers/usb/gadget/inode.c
index f255ad7..b94c049 100644
--- a/drivers/usb/gadget/inode.c
+++ b/drivers/usb/gadget/inode.c
@@ -1269,10 +1269,6 @@ dev_release (struct inode *inode, struct file *fd)
 	dev->buf = NULL;
 	put_dev (dev);
 
-	/* other endpoints were all decoupled from this device */
-	spin_lock_irq(&dev->lock);
-	dev->state = STATE_DEV_DISABLED;
-	spin_unlock_irq(&dev->lock);
 	return 0;
 }
 
