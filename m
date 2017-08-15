From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Aug 2017 07:38:45 +0000
Subject: [PATCH] usb: gadget: dummy: fix infinite loop because of missing loop decrement
Message-Id: <20170815073845.18880-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, Johan Hovold <johan@kernel.org>, Yuyang Du <yuyang.du@intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The while loop never terminates because the loop counter i is never
decremented. Fix this by decrementing i.

Detected by CoverityScan, CID#751073 ("Infinite Loop")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 3c3760315910..a030d7923d7d 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2776,7 +2776,7 @@ static int __init init(void)
 		if (retval < 0) {
 			i--;
 			while (i >= 0)
-				platform_device_del(the_udc_pdev[i]);
+				platform_device_del(the_udc_pdev[i--]);
 			goto err_add_udc;
 		}
 	}
-- 
2.11.0

