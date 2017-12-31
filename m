From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 31 Dec 2017 21:11:33 +0000
Subject: [PATCH] smsc95xx: Delete an error message for a failed memory allocation in smsc95xx_suspend()
Message-Id: <21618f18-65a0-3b07-dd37-7c1a29320820@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com, Steve Glendinning <steve.glendinning@shawell.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 31 Dec 2017 22:06:49 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/smsc95xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 309b88acd3d0..5e6ea46358c8 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1671,7 +1671,6 @@ static int smsc95xx_suspend(struct usb_interface *intf, pm_message_t message)
 		int i, filter = 0;
 
 		if (!filter_mask) {
-			netdev_warn(dev->net, "Unable to allocate filter_mask\n");
 			ret = -ENOMEM;
 			goto done;
 		}
-- 
2.15.1

