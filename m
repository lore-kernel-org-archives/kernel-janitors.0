From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 23:41:29 +0000
Subject: [PATCH V2 22/24] usb/hdpvr/hdpvr-core.c: use IS_ENABLED() macro
Message-Id: <1358638891-4775-23-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@redhat.com
Cc: jarod@redhat.com, tralph@mythtv.org, peter.senna@gmail.com, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

replace:
 #if defined(CONFIG_I2C) || \
     defined(CONFIG_I2C_MODULE)
with:
 #if IS_ENABLED(CONFIG_I2C)

This change was made for: CONFIG_I2C

Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from V1:
   Updated subject

 drivers/media/usb/hdpvr/hdpvr-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index 84dc26f..5c61935 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -391,7 +391,7 @@ static int hdpvr_probe(struct usb_interface *interface,
 		goto error;
 	}
 
-#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+#if IS_ENABLED(CONFIG_I2C)
 	retval = hdpvr_register_i2c_adapter(dev);
 	if (retval < 0) {
 		v4l2_err(&dev->v4l2_dev, "i2c adapter register failed\n");
@@ -419,7 +419,7 @@ static int hdpvr_probe(struct usb_interface *interface,
 	return 0;
 
 reg_fail:
-#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+#if IS_ENABLED(CONFIG_I2C)
 	i2c_del_adapter(&dev->i2c_adapter);
 #endif
 error:
@@ -451,7 +451,7 @@ static void hdpvr_disconnect(struct usb_interface *interface)
 	mutex_lock(&dev->io_mutex);
 	hdpvr_cancel_queue(dev);
 	mutex_unlock(&dev->io_mutex);
-#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+#if IS_ENABLED(CONFIG_I2C)
 	i2c_del_adapter(&dev->i2c_adapter);
 #endif
 	video_unregister_device(dev->video_dev);
-- 
1.7.11.7

