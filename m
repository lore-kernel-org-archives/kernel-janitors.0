From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:24:19 +0000
Subject: [patch v2] watchdog: pcwd_usb: overflow in usb_pcwd_send_command()
Message-Id: <20131108092419.GA22389@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <527BA351.10705@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

We changed "buf" from being an array of 6 chars to being a pointer this
sizeof(buf) needs to be updated as well.

Fixes: 2ddb8089a7e5 ('watchdog: pcwd_usb: Use allocated buffer for usb_control_msg')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix the bug that Guenter Roeck pointed out in v1.

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 53598e8..b731b5d 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -258,8 +258,8 @@ static int usb_pcwd_send_command(struct usb_pcwd_private *usb_pcwd,
 
 	if (usb_control_msg(usb_pcwd->udev, usb_sndctrlpipe(usb_pcwd->udev, 0),
 			HID_REQ_SET_REPORT, HID_DT_REPORT,
-			0x0200, usb_pcwd->interface_number, buf, sizeof(buf),
-			USB_COMMAND_TIMEOUT) != sizeof(buf)) {
+			0x0200, usb_pcwd->interface_number, buf, 6,
+			USB_COMMAND_TIMEOUT) != 6) {
 		dbg("usb_pcwd_send_command: error in usb_control_msg for "
 				"cmd 0x%x 0x%x 0x%x\n", cmd, *msb, *lsb);
 	}
