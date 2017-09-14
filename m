From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 10:34:27 +0000
Subject: [PATCH 4/8] [media] ttusb_dec: Delete an error message for a failed memory allocation in ttusb_dec_p
Message-Id: <afc9e33f-65d2-ee56-ac4b-20f76a6489ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
In-Reply-To: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Sep 2017 20:10:39 +0200

Omit an extra message for a memory allocation failure in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 76070da3b7c7..26d637684b30 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1659,10 +1659,8 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 	udev = interface_to_usbdev(intf);
 
 	dec = kzalloc(sizeof(*dec), GFP_KERNEL);
-	if (!dec) {
-		printk("%s: couldn't allocate memory.\n", __func__);
+	if (!dec)
 		return -ENOMEM;
-	}
 
 	usb_set_intfdata(intf, (void *)dec);
 
-- 
2.14.1

