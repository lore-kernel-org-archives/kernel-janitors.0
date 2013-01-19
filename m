From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 16:33:16 +0000
Subject: [PATCH 13/24] use IS_ENABLED() macro
Message-Id: <1358613206-4274-13-git-send-email-peter.senna@gmail.com>
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
 drivers/media/usb/gspca/se401.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/se401.c b/drivers/media/usb/gspca/se401.c
index a33cb78..5f729b8 100644
--- a/drivers/media/usb/gspca/se401.c
+++ b/drivers/media/usb/gspca/se401.c
@@ -594,7 +594,7 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev, u8 *data, int len)
 		sd_pkt_scan_janggu(gspca_dev, data, len);
 }
 
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 static int sd_int_pkt_scan(struct gspca_dev *gspca_dev, u8 *data, int len)
 {
 	struct sd *sd = (struct sd *)gspca_dev;
@@ -688,7 +688,7 @@ static const struct sd_desc sd_desc = {
 	.stopN = sd_stopN,
 	.dq_callback = sd_dq_callback,
 	.pkt_scan = sd_pkt_scan,
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	.int_pkt_scan = sd_int_pkt_scan,
 #endif
 };
-- 
1.7.11.7

