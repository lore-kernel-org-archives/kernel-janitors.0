From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 23:41:30 +0000
Subject: [PATCH V2 23/24] usb/hdpvr/hdpvr-i2c.c: use IS_ENABLED() macro
Message-Id: <1358638891-4775-24-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358638891-4775-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@redhat.com
Cc: peter.senna@gmail.com, david@hardeman.nu, elezegarcia@gmail.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

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

 drivers/media/usb/hdpvr/hdpvr-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 6c5054f..a38f58c 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -13,7 +13,7 @@
  *
  */
 
-#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+#if IS_ENABLED(CONFIG_I2C)
 
 #include <linux/i2c.h>
 #include <linux/slab.h>
-- 
1.7.11.7

