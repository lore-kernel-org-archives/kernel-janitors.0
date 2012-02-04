From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Feb 2012 13:37:14 +0000
Subject: [patch] usb: dwc3: make dwc3_get_device_id() return the id
Message-Id: <20120204133714.GA4413@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We always return zero instead of the id we found.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware so it's not tested.

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7c9df63..73df745 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -86,7 +86,7 @@ again:
 		id = -ENOMEM;
 	}
 
-	return 0;
+	return id;
 }
 EXPORT_SYMBOL_GPL(dwc3_get_device_id);
 
