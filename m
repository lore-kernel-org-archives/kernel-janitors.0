From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Mar 2017 22:34:39 +0000
Subject: [PATCH] usb: gadget: udc:  remove redundant initial assignments to the pointer 's'
Message-Id: <20170327223439.10063-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Bhumika Goyal <bhumirks@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initial setting of pointer s to the driver name or to the literal
string "(none)" is redundant as later it is always set to point to
a different literal string before it is printed log.  Remove this
redundant code.

Detected with CoverityScan, CID#1227032, CID#1227033 ("Unused Value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/net2272.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 8f85a51bd2b3..dee4eb60d4c2 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1191,11 +1191,6 @@ registers_show(struct device *_dev, struct device_attribute *attr, char *buf)
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
2.11.0

