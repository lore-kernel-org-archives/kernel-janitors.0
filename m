From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Sep 2019 17:06:39 +0000
Subject: [PATCH] media: cx231xx: remove redundant assignment to variable status
Message-Id: <20190903170639.13849-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable status is being initialized with a value that is never read
and is being re-assigned a later on. The assignment is redundant and
hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index d417b5fe4093..0974965e848f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -1240,7 +1240,7 @@ int cx231xx_init_ctrl_pin_status(struct cx231xx *dev)
 int cx231xx_set_agc_analog_digital_mux_select(struct cx231xx *dev,
 					      u8 analog_or_digital)
 {
-	int status = 0;
+	int status;
 
 	/* first set the direction to output */
 	status = cx231xx_set_gpio_direction(dev,
-- 
2.20.1
