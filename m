From: Colin King <colin.king@canonical.com>
Date: Tue, 22 May 2018 09:05:05 +0000
Subject: [PATCH] usb: gadget: tcm: fix spelling mistake: "Manufactor" -> "Manufacturer"
Message-Id: <20180522090505.14953-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in usbg_us_strings array

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/legacy/tcm_usb_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/tcm_usb_gadget.c b/drivers/usb/gadget/legacy/tcm_usb_gadget.c
index 682bf99dcf76..40870227999a 100644
--- a/drivers/usb/gadget/legacy/tcm_usb_gadget.c
+++ b/drivers/usb/gadget/legacy/tcm_usb_gadget.c
@@ -41,7 +41,7 @@ static struct usb_device_descriptor usbg_device_desc = {
 #define USB_G_STR_CONFIG USB_GADGET_FIRST_AVAIL_IDX
 
 static struct usb_string	usbg_us_strings[] = {
-	[USB_GADGET_MANUFACTURER_IDX].s	= "Target Manufactor",
+	[USB_GADGET_MANUFACTURER_IDX].s	= "Target Manufacturer",
 	[USB_GADGET_PRODUCT_IDX].s	= "Target Product",
 	[USB_GADGET_SERIAL_IDX].s	= "000000000001",
 	[USB_G_STR_CONFIG].s		= "default config",
-- 
2.17.0

