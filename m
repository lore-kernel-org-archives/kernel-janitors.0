From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Jul 2012 11:46:51 +0000
Subject: [patch] USB: kaweth.c: use GFP_ATOMIC under spin_lock
Message-Id: <20120727114651.GA15492@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that we call this with a spin lock held.  The call tree
is:
	kaweth_start_xmit() holds kaweth->device_lock.
	-> kaweth_async_set_rx_mode()
	   -> kaweth_control()
	      -> kaweth_internal_control_msg()

The kaweth_internal_control_msg() function is only called from
kaweth_control() which used GFP_ATOMIC for its allocations.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to Linus's tree.

diff --git a/drivers/net/usb/kaweth.c b/drivers/net/usb/kaweth.c
index d8ad552..c3d0349 100644
--- a/drivers/net/usb/kaweth.c
+++ b/drivers/net/usb/kaweth.c
@@ -1314,7 +1314,7 @@ static int kaweth_internal_control_msg(struct usb_device *usb_dev,
         int retv;
         int length = 0; /* shut up GCC */
 
-        urb = usb_alloc_urb(0, GFP_NOIO);
+	urb = usb_alloc_urb(0, GFP_ATOMIC);
         if (!urb)
                 return -ENOMEM;
 
