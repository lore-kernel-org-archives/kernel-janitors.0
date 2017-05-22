From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 05:09:02 +0000
Subject: [PATCH 1/2] usbnet: Delete an error message for a failed memory allocation in usbnet_write_cmd_async
Message-Id: <3b831fce-93ed-c017-2549-967a39c2d1da@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a81c2551-ce6c-967d-1120-4307f95b1e65@users.sourceforge.net>
In-Reply-To: <a81c2551-ce6c-967d-1120-4307f95b1e65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 06:33:48 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/usbnet.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 79048e72c1bd..802ba68d37d1 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -2124,10 +2124,7 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 
 	if (data) {
 		buf = kmemdup(data, size, GFP_ATOMIC);
-		if (!buf) {
-			netdev_err(dev->net, "Error allocating buffer"
-				   " in %s!\n", __func__);
+		if (!buf)
 			goto fail_free;
-		}
 	}
 
-- 
2.13.0

