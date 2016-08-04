From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:28:59 +0000
Subject: [patch] Input: silead - remove some dead code
Message-Id: <20160804052859.GI775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Robert Dolca <robert.dolca@intel.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Hans de Goede <hdegoede@redhat.com>, Daniel Jansen <djaniboe@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

buf[0] is an unsigned char.  touch_nr is an int.  The test for negative
here doesn't make sense so I have removed it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 5f55167..7379fe1 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -147,9 +147,6 @@ static void silead_ts_read_data(struct i2c_client *client)
 	}
 
 	touch_nr = buf[0];
-	if (touch_nr < 0)
-		return;
-
 	if (touch_nr > data->max_fingers) {
 		dev_warn(dev, "More touches reported then supported %d > %d\n",
 			 touch_nr, data->max_fingers);
