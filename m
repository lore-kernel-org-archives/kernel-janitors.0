From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 15:16:30 +0000
Subject: [PATCH] media: radio: remove redundant assignment to variable retval
Message-Id: <20200722151630.958201-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/radio/si4713/radio-usb-si4713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 33274189c83c..2cf36c8abdde 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -414,7 +414,7 @@ static int usb_si4713_probe(struct usb_interface *intf,
 	struct si4713_usb_device *radio;
 	struct i2c_adapter *adapter;
 	struct v4l2_subdev *sd;
-	int retval = -ENOMEM;
+	int retval;
 
 	dev_info(&intf->dev, "Si4713 development board discovered: (%04X:%04X)\n",
 			id->idVendor, id->idProduct);
-- 
2.27.0
