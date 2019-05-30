From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 18:14:58 +0000
Subject: [PATCH] usb: gadget: net2272: remove redundant assignments to pointer 's'
Message-Id: <20190530181458.7488-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 's' is being assigned however the pointer is
never used with either of these values before it it reassigned much
later on.  I suspect it was going to be used in the output of the
main control registers scnprintf but was omitted.  The assignments
of 's' to the driver name or the literal string are redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/net2272.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 564aeee1a1fe..247de0faaeb7 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1178,11 +1178,6 @@ registers_show(struct device *_dev, struct device_attribute *attr, char *buf)
 	size = PAGE_SIZE;
 	spin_lock_irqsave(&dev->lock, flags);
 
-	if (dev->driver)
-		s = dev->driver->driver.name;
-	else
-		s = "(none)";
-
 	/* Main Control Registers */
 	t = scnprintf(next, size, "%s version %s,"
 		"chiprev %02x, locctl %02x\n"
-- 
2.20.1
