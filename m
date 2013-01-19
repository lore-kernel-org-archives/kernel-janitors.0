From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 16:33:11 +0000
Subject: [PATCH 08/24] use IS_ENABLED() macro
Message-Id: <1358613206-4274-8-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdegoede@redhat.com
Cc: mchehab@redhat.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

replace:
 #if defined(CONFIG_INPUT) || \
     defined(CONFIG_INPUT_MODULE)
with:
 #if IS_ENABLED(CONFIG_INPUT)

This change was made for: CONFIG_INPUT

Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/media/usb/gspca/konica.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
index bbf91e0..61e25db 100644
--- a/drivers/media/usb/gspca/konica.c
+++ b/drivers/media/usb/gspca/konica.c
@@ -246,7 +246,7 @@ static void sd_stopN(struct gspca_dev *gspca_dev)
 	struct sd *sd = (struct sd *) gspca_dev;
 
 	konica_stream_off(gspca_dev);
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	/* Don't keep the button in the pressed state "forever" if it was
 	   pressed when streaming is stopped */
 	if (sd->snapshot_pressed) {
@@ -345,7 +345,7 @@ static void sd_isoc_irq(struct urb *urb)
 			gspca_frame_add(gspca_dev, LAST_PACKET, NULL, 0);
 			gspca_frame_add(gspca_dev, FIRST_PACKET, NULL, 0);
 		} else {
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 			u8 button_state = st & 0x40 ? 1 : 0;
 			if (sd->snapshot_pressed != button_state) {
 				input_report_key(gspca_dev->input_dev,
@@ -452,7 +452,7 @@ static const struct sd_desc sd_desc = {
 	.init_controls = sd_init_controls,
 	.start = sd_start,
 	.stopN = sd_stopN,
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	.other_input = 1,
 #endif
 };
-- 
1.7.11.7

