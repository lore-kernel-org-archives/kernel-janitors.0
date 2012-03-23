From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 08:34:28 +0000
Subject: [patch] usb: gadgetfs: remove an unused label
Message-Id: <20120323083426.GA18239@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This label isn't used any more after 104bb37d3e "gadgetfs:
list_for_each_safe() misuse".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/inode.c b/drivers/usb/gadget/inode.c
index 8793f32..e58b164 100644
--- a/drivers/usb/gadget/inode.c
+++ b/drivers/usb/gadget/inode.c
@@ -1574,7 +1574,6 @@ static void destroy_ep_files (struct dev_data *dev)
 	DBG (dev, "%s %d\n", __func__, dev->state);
 
 	/* dev->state must prevent interference */
-restart:
 	spin_lock_irq (&dev->lock);
 	while (!list_empty(&dev->epfiles)) {
 		struct ep_data	*ep;
