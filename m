From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 16:33:14 +0000
Subject: [PATCH 11/24] use IS_ENABLED() macro
Message-Id: <1358613206-4274-11-git-send-email-peter.senna@gmail.com>
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
 drivers/media/usb/gspca/pac7302.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/pac7302.c b/drivers/media/usb/gspca/pac7302.c
index 4f5869a..add6f72 100644
--- a/drivers/media/usb/gspca/pac7302.c
+++ b/drivers/media/usb/gspca/pac7302.c
@@ -890,7 +890,7 @@ static int sd_chip_ident(struct gspca_dev *gspca_dev,
 }
 #endif
 
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 static int sd_int_pkt_scan(struct gspca_dev *gspca_dev,
 			u8 *data,		/* interrupt packet data */
 			int len)		/* interrput packet length */
@@ -936,7 +936,7 @@ static const struct sd_desc sd_desc = {
 	.set_register = sd_dbg_s_register,
 	.get_chip_ident = sd_chip_ident,
 #endif
-#if defined(CONFIG_INPUT) || defined(CONFIG_INPUT_MODULE)
+#if IS_ENABLED(CONFIG_INPUT)
 	.int_pkt_scan = sd_int_pkt_scan,
 #endif
 };
-- 
1.7.11.7

