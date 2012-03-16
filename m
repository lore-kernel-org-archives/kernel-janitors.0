From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 16 Mar 2012 12:57:09 +0000
Subject: [PATCH] [media] dib0700: Return -EINTR and unlock mutex if locking attempts fails.
Message-Id: <1331901909-4960-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org
Cc: olivier.grenie@dibcom.fr, pboettcher@kernellabs.com, florian@mickler.org, gregkh@suse.de, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>


In 'dib0700_i2c_xfer_new()' and 'dib0700_i2c_xfer_legacy()'
we are taking two locks:
		1. i2c_mutex
		2. usb_mutex
If attempt to take 'usb_mutex' lock fails then the previously taken
lock 'i2c_mutex' should be unlocked and -EINTR should be return so
that caller can take appropriate action.

If locking attempt was interrupted by a signal then
we should return -EINTR. At present we are returning '0' for
such scenarios  which is wrong.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/media/dvb/dvb-usb/dib0700_core.c |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb/dvb-usb/dib0700_core.c b/drivers/media/dvb/dvb-usb/dib0700_core.c
index 070e82a..1a6ddbc 100644
--- a/drivers/media/dvb/dvb-usb/dib0700_core.c
+++ b/drivers/media/dvb/dvb-usb/dib0700_core.c
@@ -32,7 +32,7 @@ int dib0700_get_version(struct dvb_usb_device *d, u32 *hwversion,
 
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	ret = usb_control_msg(d->udev, usb_rcvctrlpipe(d->udev, 0),
@@ -118,7 +118,7 @@ int dib0700_set_gpio(struct dvb_usb_device *d, enum dib07x0_gpios gpio, u8 gpio_
 
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	st->buf[0] = REQUEST_SET_GPIO;
@@ -139,7 +139,7 @@ static int dib0700_set_usb_xfer_len(struct dvb_usb_device *d, u16 nb_ts_packets)
 	if (st->fw_version >= 0x10201) {
 		if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 			err("could not acquire lock");
-			return 0;
+			return -EINTR;
 		}
 
 		st->buf[0] = REQUEST_SET_USB_XFER_LEN;
@@ -228,7 +228,8 @@ static int dib0700_i2c_xfer_new(struct i2c_adapter *adap, struct i2c_msg *msg,
 			/* Write request */
 			if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 				err("could not acquire lock");
-				return 0;
+				mutex_unlock(&d->i2c_mutex);
+				return -EINTR;
 			}
 			st->buf[0] = REQUEST_NEW_I2C_WRITE;
 			st->buf[1] = msg[i].addr << 1;
@@ -274,7 +275,8 @@ static int dib0700_i2c_xfer_legacy(struct i2c_adapter *adap,
 		return -EAGAIN;
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		mutex_unlock(&d->i2c_mutex);
+		return -EINTR;
 	}
 
 	for (i = 0; i < num; i++) {
@@ -369,7 +371,7 @@ static int dib0700_set_clock(struct dvb_usb_device *d, u8 en_pll,
 
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	st->buf[0] = REQUEST_SET_CLOCK;
@@ -401,7 +403,7 @@ int dib0700_set_i2c_speed(struct dvb_usb_device *d, u16 scl_kHz)
 
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	st->buf[0] = REQUEST_SET_I2C_PARAM;
@@ -561,7 +563,7 @@ int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 
 	if (mutex_lock_interruptible(&adap->dev->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	st->buf[0] = REQUEST_ENABLE_VIDEO;
@@ -611,7 +613,7 @@ int dib0700_change_protocol(struct rc_dev *rc, u64 rc_type)
 
 	if (mutex_lock_interruptible(&d->usb_mutex) < 0) {
 		err("could not acquire lock");
-		return 0;
+		return -EINTR;
 	}
 
 	st->buf[0] = REQUEST_SET_RC;
-- 
1.7.4.4

