From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Mar 2019 20:37:57 +0000
Subject: [PATCH] leds: blinkm: clean up double assignment to data->i2c_addr
Message-Id: <20190330203757.8877-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Simon Moeller <jansimon.moeller@gmx.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently data->i2c_addr is being assigned twice, first with the
value 0x09 and then immediately afterwards with the value 0x08.
The first assignment is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-blinkm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 851c1920b63c..11b771fb933b 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -594,7 +594,6 @@ static int blinkm_probe(struct i2c_client *client,
 		goto exit;
 	}
 
-	data->i2c_addr = 0x09;
 	data->i2c_addr = 0x08;
 	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
 	data->fw_ver = 0xfe;
-- 
2.20.1
