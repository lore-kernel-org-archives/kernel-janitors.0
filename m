From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 20:19:47 +0000
Subject: [PATCH 4/8] [media] cx231xx: Delete an unnecessary variable initialisation in dvb_init()
Message-Id: <6c6b1d0a-9ff7-18c8-631e-08bf8d59106a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f2c1ca56-ecdc-318c-f18f-9bef6c670ffb@users.sourceforge.net>
In-Reply-To: <f2c1ca56-ecdc-318c-f18f-9bef6c670ffb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Johan Hovold <johan@kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Peter Rosin <peda@axentia.se>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 18:53:16 +0200

The variable "result" will eventually be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
index 35d98ec948b2..091ec0cf56a6 100644
--- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
+++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
@@ -601,6 +601,6 @@ static void unregister_dvb(struct cx231xx_dvb *dvb)
 
 static int dvb_init(struct cx231xx *dev)
 {
-	int result = 0;
+	int result;
 	struct cx231xx_dvb *dvb;
 	struct i2c_adapter *tuner_i2c;
-- 
2.14.1

