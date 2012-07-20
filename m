From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 07:10:19 +0000
Subject: [patch] USB: legousbtower.c: remove a bogus NULL check
Message-Id: <20120720071018.GE11710@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"udev" can't be NULL here.  The debugging printk() makes static checkers
complain when we dereference it later in the function inside the call to
usb_rcvctrlpipe().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index a2702cb..8089479 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -868,9 +868,6 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
 
 	dbg(2, "%s: enter", __func__);
 
-	if (udev = NULL)
-		dev_info(&interface->dev, "udev is NULL.\n");
-
 	/* allocate memory for our device state and initialize it */
 
 	dev = kmalloc (sizeof(struct lego_usb_tower), GFP_KERNEL);
