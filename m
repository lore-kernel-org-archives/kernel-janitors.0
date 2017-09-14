From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 10:38:03 +0000
Subject: [PATCH 8/8] [media] ttusb_dec: Delete four unwanted spaces
Message-Id: <525012eb-3970-c64f-b21d-24f13232a999@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
In-Reply-To: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Sep 2017 22:22:41 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: space prohibited after that open parenthesis '('

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 58256d518fa6..b05f83eac95d 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -258,7 +258,7 @@ static int dvb_filter_pes2ts(struct dvb_filter_pes2ts *p2ts,
 static void ttusb_dec_set_model(struct ttusb_dec *dec,
 				enum ttusb_dec_model model);
 
-static void ttusb_dec_handle_irq( struct urb *urb)
+static void ttusb_dec_handle_irq(struct urb *urb)
 {
 	struct ttusb_dec *dec = urb->context;
 	char *buffer = dec->irq_buffer;
@@ -393,8 +393,8 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	}
 }
 
-static int ttusb_dec_get_stb_state (struct ttusb_dec *dec, unsigned int *mode,
-				    unsigned int *model, unsigned int *version)
+static int ttusb_dec_get_stb_state(struct ttusb_dec *dec, unsigned int *mode,
+				   unsigned int *model, unsigned int *version)
 {
 	u8 c[COMMAND_PACKET_SIZE];
 	int c_length;
@@ -1233,7 +1233,7 @@ static void ttusb_dec_init_tasklet(struct ttusb_dec *dec)
 		     (unsigned long)dec);
 }
 
-static int ttusb_init_rc( struct ttusb_dec *dec)
+static int ttusb_init_rc(struct ttusb_dec *dec)
 {
 	struct input_dev *input_dev;
 	u8 b[] = { 0x00, 0x01 };
-- 
2.14.1

