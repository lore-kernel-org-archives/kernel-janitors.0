From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2013 07:36:32 +0000
Subject: [media] dvb-usb: reading before start of array
Message-Id: <20130109073632.GD2454@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>, Michael Hunold <michael@mihu.de>
Cc: Jonathan Nieder <jrnieder@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static checker fix.  In the ttusb_process_muxpack() we do:

	cc = (muxpack[len - 4] << 8) | muxpack[len - 3];

That means if we pass a number less than 4 then we will either trigger a
checksum error message or read before the start of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't test this.

This patch doesn't introduce any bugs, but I'm not positive this is the
right thing to do.  Perhaps it's better to print an error message?

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 5b682cc..99a2fd1 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -709,7 +709,7 @@ static void ttusb_process_frame(struct ttusb *ttusb, u8 * data, int len)
 			 * if length is valid and we reached the end:
 			 * goto next muxpack
 			 */
-				if ((ttusb->muxpack_ptr >= 2) &&
+				if ((ttusb->muxpack_ptr >= 4) &&
 				    (ttusb->muxpack_ptr =
 				     ttusb->muxpack_len)) {
 					ttusb_process_muxpack(ttusb,
