From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:40:28 +0000
Subject: [patch] watchdog: pcwd_usb: overflow in usb_pcwd_send_command()
Message-Id: <20131107074028.GA21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed "buf" from being an array of 6 chars to being a pointer this
sizeof(buf) needs to be updated as well.

Fixes: 2ddb8089a7e5 ('watchdog: pcwd_usb: Use allocated buffer for usb_control_msg')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 53598e8..7031b9b 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -258,7 +258,7 @@ static int usb_pcwd_send_command(struct usb_pcwd_private *usb_pcwd,
 
 	if (usb_control_msg(usb_pcwd->udev, usb_sndctrlpipe(usb_pcwd->udev, 0),
 			HID_REQ_SET_REPORT, HID_DT_REPORT,
-			0x0200, usb_pcwd->interface_number, buf, sizeof(buf),
+			0x0200, usb_pcwd->interface_number, buf, 6,
 			USB_COMMAND_TIMEOUT) != sizeof(buf)) {
 		dbg("usb_pcwd_send_command: error in usb_control_msg for "
 				"cmd 0x%x 0x%x 0x%x\n", cmd, *msb, *lsb);
