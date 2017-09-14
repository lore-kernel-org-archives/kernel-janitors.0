From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 10:33:36 +0000
Subject: [PATCH 3/8] [media] ttusb_dec: Improve a size determination in three functions
Message-Id: <cba7587d-7aca-02b9-310d-27081ebc3f69@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
In-Reply-To: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Sep 2017 19:56:38 +0200

* The script "checkpatch.pl" pointed information out like the following.

  ERROR: do not use assignment in if condition

  Thus fix a few source code places.

* Replace the specification of data structures by pointer dereferences
  as the parameter for the operator "sizeof" to make the corresponding size
  determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 901cb221aad2..76070da3b7c7 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -821,8 +821,8 @@ static void ttusb_dec_process_urb(struct urb *urb)
 			b = urb->transfer_buffer + d->offset;
 			length = d->actual_length;
 
-			if ((frame = kmalloc(sizeof(struct urb_frame),
-					     GFP_ATOMIC))) {
+			frame = kmalloc(sizeof(*frame), GFP_ATOMIC);
+			if (frame) {
 				unsigned long flags;
 
 				memcpy(frame->data, b, length);
@@ -1073,8 +1073,8 @@ static int ttusb_dec_start_sec_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (!result) {
 		if (c_length = 2) {
-			if (!(finfo = kmalloc(sizeof(struct filter_info),
-					      GFP_ATOMIC)))
+			finfo = kmalloc(sizeof(*finfo), GFP_ATOMIC);
+			if (!finfo)
 				return -ENOMEM;
 
 			finfo->stream_id = c[1];
@@ -1658,7 +1658,8 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 
 	udev = interface_to_usbdev(intf);
 
-	if (!(dec = kzalloc(sizeof(struct ttusb_dec), GFP_KERNEL))) {
+	dec = kzalloc(sizeof(*dec), GFP_KERNEL);
+	if (!dec) {
 		printk("%s: couldn't allocate memory.\n", __func__);
 		return -ENOMEM;
 	}
-- 
2.14.1

