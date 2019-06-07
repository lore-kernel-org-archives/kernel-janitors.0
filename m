From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 13:57:09 +0000
Subject: [PATCH] usb/hcd: Fix a NULL vs IS_ERR() bug in usb_hcd_setup_local_mem()
Message-Id: <20190607135709.GC16718@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dmitry Torokhov <dtor@chromium.org>, Suwan Kim <suwan.kim027@gmail.com>, Raul E Rangel <rrangel@chromium.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_memremap() function doesn't return NULL, it returns error
pointers.

Fixes: b0310c2f09bb ("USB: use genalloc for USB HCs with local memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/core/hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index fe631d18c1ed..df8f358685e6 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3052,8 +3052,8 @@ int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
 
 	local_mem = devm_memremap(hcd->self.sysdev, phys_addr,
 				  size, MEMREMAP_WC);
-	if (!local_mem)
-		return -ENOMEM;
+	if (IS_ERR(local_mem))
+		return PTR_ERR(local_mem);
 
 	/*
 	 * Here we pass a dma_addr_t but the arg type is a phys_addr_t.
-- 
2.20.1
