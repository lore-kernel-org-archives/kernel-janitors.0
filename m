From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 23:41:24 +0000
Subject: [PATCH V2 17/24] usb/gspca/spca561.c: use IS_ENABLED() macro
Message-Id: <1358638891-4775-18-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
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
Changes from V1:
   Updated subject

 drivers/media/usb/gspca/spca561.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/spca561.c b/drivers/media/usb/gspca/spca561.c
index cfe71dd..d1db3d8 100644
--- a/drivers/media/usb/gspca/spca561.c
+++ b/drivers/media/usb/gspca/spca561.c
@@ -741,7 +741,7 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 			return;
 		}
 
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 		if (data[0] & 0x20) {
 			input_report_key(gspca_dev->input_dev, KEY_CAMERA, 1);
 			input_sync(gspca_dev->input_dev);
@@ -866,7 +866,7 @@ static const struct sd_desc sd_desc_12a = {
 	.start = sd_start_12a,
 	.stopN = sd_stopN,
 	.pkt_scan = sd_pkt_scan,
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	.other_input = 1,
 #endif
 };
@@ -879,7 +879,7 @@ static const struct sd_desc sd_desc_72a = {
 	.stopN = sd_stopN,
 	.pkt_scan = sd_pkt_scan,
 	.dq_callback = do_autogain,
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	.other_input = 1,
 #endif
 };
-- 
1.7.11.7

