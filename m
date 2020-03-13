From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Mar 2020 17:19:37 +0000
Subject: [PATCH] leds: lm3532: make bitfield 'enabled' unsigned
Message-Id: <20200313171937.220884-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bitfield 'enabled' should bit unsigned, so make it unsigned.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lm3532.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 188a57da981a..aa9bf8cda673 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -140,7 +140,7 @@ struct lm3532_led {
 	int ctrl_brt_pointer;
 	int num_leds;
 	int full_scale_current;
-	int enabled:1;
+	unsigned int enabled:1;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
-- 
2.25.1
