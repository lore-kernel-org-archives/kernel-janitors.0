From: Colin King <colin.king@canonical.com>
Date: Sun, 18 Aug 2019 18:36:08 +0000
Subject: [PATCH] media: hdpvr: remove redundant assignment to retval
Message-Id: <20190818183608.12821-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable retval is initialized to a value that is never read
so this assignment is redundant.  Clean up the code by removing
retval completely and just return the error return from the
call to i2c_add_adapter.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index bc5975b17c0c..785c8508a46e 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -193,8 +193,6 @@ static int hdpvr_activate_ir(struct hdpvr_device *dev)
 
 int hdpvr_register_i2c_adapter(struct hdpvr_device *dev)
 {
-	int retval = -ENOMEM;
-
 	hdpvr_activate_ir(dev);
 
 	dev->i2c_adapter = hdpvr_i2c_adapter_template;
@@ -202,9 +200,7 @@ int hdpvr_register_i2c_adapter(struct hdpvr_device *dev)
 
 	i2c_set_adapdata(&dev->i2c_adapter, dev);
 
-	retval = i2c_add_adapter(&dev->i2c_adapter);
-
-	return retval;
+	return i2c_add_adapter(&dev->i2c_adapter);
 }
 
 #endif
-- 
2.20.1
