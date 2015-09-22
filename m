From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2015 13:26:43 +0000
Subject: [patch] Input: ff-core - silence an underflow warning
Message-Id: <20150922132643.GA5751@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that "value" comes from the user in
evdev_do_ioctl() and we check that it's not too large here but we don't
check that it's negative.  It's harmless because the ->set_gain() and
->set_autocenter() functions truncate it to a valid u16 value, but we
may as well fix it just to make the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index c642082..6a94c5f 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -273,14 +273,14 @@ int input_ff_event(struct input_dev *dev, unsigned int type,
 
 	switch (code) {
 	case FF_GAIN:
-		if (!test_bit(FF_GAIN, dev->ffbit) || value > 0xffff)
+		if (!test_bit(FF_GAIN, dev->ffbit) || value > 0xffffUL)
 			break;
 
 		ff->set_gain(dev, value);
 		break;
 
 	case FF_AUTOCENTER:
-		if (!test_bit(FF_AUTOCENTER, dev->ffbit) || value > 0xffff)
+		if (!test_bit(FF_AUTOCENTER, dev->ffbit) || value > 0xffffUL)
 			break;
 
 		ff->set_autocenter(dev, value);
