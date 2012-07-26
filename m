From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jul 2012 08:00:25 +0000
Subject: [patch 2/2 -next] LEDS: propagate error codes in blinkm_detect()
Message-Id: <20120726080025.GB10842@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use the error codes from the lower levels instead of -ENODEV.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index ae6ad63..f7c3d7f 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -617,11 +617,11 @@ static int blinkm_detect(struct i2c_client *client, struct i2c_board_info *info)
 	/* Step 1: Read BlinkM address back  -  cmd_char 'a' */
 	ret = blinkm_write(client, BLM_GET_ADDR, NULL);
 	if (ret < 0)
-		return -ENODEV;
+		return ret;
 	usleep_range(20000, 30000);	/* allow a small delay */
 	ret = blinkm_read(client, BLM_GET_ADDR, tmpargs);
 	if (ret < 0)
-		return -ENODEV;
+		return ret;
 
 	if (tmpargs[0] != 0x09) {
 		dev_err(&client->dev, "enodev DEV ADDR = 0x%02X\n", tmpargs[0]);
