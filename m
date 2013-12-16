From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Dec 2013 09:45:44 +0000
Subject: [patch] [media] i2c: lm3560: missing unlocks on error in lm3560_set_ctrl()
Message-Id: <20131216094544.GB13831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Daniel Jeong <gshark.jeong@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There are several error paths which don't unlock on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index ab5857d66f2d..fd96cfd6a9ec 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -214,20 +214,22 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
-		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH)
-			return -EBUSY;
+		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
+			rval = -EBUSY;
+			goto err_unlock;
+		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
 		break;
 
 	case V4L2_CID_FLASH_STROBE_STOP:
-		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH)
-			return -EBUSY;
+		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
+			rval = -EBUSY;
+			goto err_unlock;
+		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
 		break;
@@ -247,8 +249,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
+err_unlock:
 	mutex_unlock(&flash->lock);
-err_out:
+
 	return rval;
 }
 
