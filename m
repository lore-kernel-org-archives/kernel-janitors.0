From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Aug 2012 06:57:30 +0000
Subject: [patch] wireless: at76c50x: signedness bug in at76_dfu_get_state()
Message-Id: <20120809065730.GA7925@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This return holds the number of bytes transfered (1 byte) or a negative
error code.  The type should be int instead of u8.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/at76c50x-usb.c b/drivers/net/wireless/at76c50x-usb.c
index efc162e..88b8d64 100644
--- a/drivers/net/wireless/at76c50x-usb.c
+++ b/drivers/net/wireless/at76c50x-usb.c
@@ -342,7 +342,7 @@ static int at76_dfu_get_status(struct usb_device *udev,
 	return ret;
 }
 
-static u8 at76_dfu_get_state(struct usb_device *udev, u8 *state)
+static int at76_dfu_get_state(struct usb_device *udev, u8 *state)
 {
 	int ret;
 
