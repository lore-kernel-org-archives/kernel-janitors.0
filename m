From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 31 May 2014 13:14:08 +0000
Subject: [PATCH 8/11] drivers/media/usb/usbvision/usbvision-core.c: Remove useless return variables
Message-Id: <1401542051-3174-8-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This patch remove variables that are initialized with a constant,
are never updated, and are only used as parameter of return.
Return the constant instead of using a variable.

Verified by compilation only.

The coccinelle script that find and fixes this issue is:
// <smpl>
@@
type T;
constant C;
identifier ret;
@@
- T ret = C;
... when != ret
    when strict
return
- ret
+ C
;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/usb/usbvision/usbvision-core.c |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/usbvision/usbvision-core.c b/drivers/media/usb/usbvision/usbvision-core.c
index 816b1cf..302aa07 100644
--- a/drivers/media/usb/usbvision/usbvision-core.c
+++ b/drivers/media/usb/usbvision/usbvision-core.c
@@ -1463,8 +1463,6 @@ static int usbvision_write_reg_irq(struct usb_usbvision *usbvision, int address,
 
 static int usbvision_init_compression(struct usb_usbvision *usbvision)
 {
-	int err_code = 0;
-
 	usbvision->last_isoc_frame_num = -1;
 	usbvision->isoc_data_count = 0;
 	usbvision->isoc_packet_count = 0;
@@ -1475,7 +1473,7 @@ static int usbvision_init_compression(struct usb_usbvision *usbvision)
 	usbvision->request_intra = 1;
 	usbvision->isoc_measure_bandwidth_count = 0;
 
-	return err_code;
+	return 0;
 }
 
 /* this function measures the used bandwidth since last call
@@ -1484,11 +1482,9 @@ static int usbvision_init_compression(struct usb_usbvision *usbvision)
  */
 static int usbvision_measure_bandwidth(struct usb_usbvision *usbvision)
 {
-	int err_code = 0;
-
 	if (usbvision->isoc_measure_bandwidth_count < 2) { /* this gives an average bandwidth of 3 frames */
 		usbvision->isoc_measure_bandwidth_count++;
-		return err_code;
+		return 0;
 	}
 	if ((usbvision->isoc_packet_size > 0) && (usbvision->isoc_packet_count > 0)) {
 		usbvision->used_bandwidth = usbvision->isoc_data_count /
@@ -1499,7 +1495,7 @@ static int usbvision_measure_bandwidth(struct usb_usbvision *usbvision)
 	usbvision->isoc_data_count = 0;
 	usbvision->isoc_packet_count = 0;
 	usbvision->isoc_skip_count = 0;
-	return err_code;
+	return 0;
 }
 
 static int usbvision_adjust_compression(struct usb_usbvision *usbvision)
@@ -1546,26 +1542,24 @@ static int usbvision_adjust_compression(struct usb_usbvision *usbvision)
 
 static int usbvision_request_intra(struct usb_usbvision *usbvision)
 {
-	int err_code = 0;
 	unsigned char buffer[1];
 
 	PDEBUG(DBG_IRQ, "");
 	usbvision->request_intra = 1;
 	buffer[0] = 1;
 	usbvision_write_reg_irq(usbvision, USBVISION_FORCE_INTRA, buffer, 1);
-	return err_code;
+	return 0;
 }
 
 static int usbvision_unrequest_intra(struct usb_usbvision *usbvision)
 {
-	int err_code = 0;
 	unsigned char buffer[1];
 
 	PDEBUG(DBG_IRQ, "");
 	usbvision->request_intra = 0;
 	buffer[0] = 0;
 	usbvision_write_reg_irq(usbvision, USBVISION_FORCE_INTRA, buffer, 1);
-	return err_code;
+	return 0;
 }
 
 /*******************************

