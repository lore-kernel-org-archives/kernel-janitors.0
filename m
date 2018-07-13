From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:58:44 +0000
Subject: [PATCH] usb: misc: uss720: remove redundant pointer usbdev
Message-Id: <20180713095844.25115-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer usbdev is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'usbdev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/uss720.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index de9a502491c2..82f220631bd7 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -748,13 +748,11 @@ static void uss720_disconnect(struct usb_interface *intf)
 {
 	struct parport *pp = usb_get_intfdata(intf);
 	struct parport_uss720_private *priv;
-	struct usb_device *usbdev;
 
 	dev_dbg(&intf->dev, "disconnect\n");
 	usb_set_intfdata(intf, NULL);
 	if (pp) {
 		priv = pp->private_data;
-		usbdev = priv->usbdev;
 		priv->usbdev = NULL;
 		priv->pp = NULL;
 		dev_dbg(&intf->dev, "parport_remove_port\n");
-- 
2.17.1

