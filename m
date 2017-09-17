From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 20:23:12 +0000
Subject: [PATCH 7/8] [media] cx231xx: Delete an unnecessary variable initialisation in read_eeprom()
Message-Id: <3c6d0990-b341-9359-94ef-e6cb74f94a5b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f2c1ca56-ecdc-318c-f18f-9bef6c670ffb@users.sourceforge.net>
In-Reply-To: <f2c1ca56-ecdc-318c-f18f-9bef6c670ffb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Johan Hovold <johan@kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Peter Rosin <peda@axentia.se>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 20:28:00 +0200

The local variable "ret" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 04c0734aee79..69fdd507fa92 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1106,6 +1106,6 @@ static void cx231xx_config_tuner(struct cx231xx *dev)
 static int read_eeprom(struct cx231xx *dev, struct i2c_client *client,
 		       u8 *eedata, int len)
 {
-	int ret = 0;
+	int ret;
 	u8 start_offset = 0;
 	int len_todo = len;
-- 
2.14.1

