From: Colin King <colin.king@canonical.com>
Date: Sun, 12 Feb 2017 18:35:18 +0000
Subject: [PATCH] usb: misc: usbtest: remove redundant check on retval < 0
Message-Id: <20170212183518.22528-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for retval being less than zero is always true since
retval equal to -EPIPE at that point.  Replace the existing
conditional with just return retval.

Detected with CoverityScan, CID#114349 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/usbtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 3525626..17c0810 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -992,7 +992,7 @@ static int ch9_postconfig(struct usbtest_dev *dev)
 				dev_err(&iface->dev,
 						"hs dev qualifier --> %d\n",
 						retval);
-				return (retval < 0) ? retval : -EDOM;
+				return retval;
 			}
 			/* usb2.0 but not high-speed capable; fine */
 		} else if (retval != sizeof(struct usb_qualifier_descriptor)) {
-- 
2.10.2

