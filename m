From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 18:05:32 +0000
Subject: [PATCH] media: i2c: mt9m001: make array init_regs static, makes object smaller
Message-Id: <20190905180532.14093-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array init_regs on the stack but instead make it
static. Makes the object code smaller by 57 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  15935	   3600	    128	  19663	   4ccf	drivers/media/i2c/mt9m001.o

After:
   text	   data	    bss	    dec	    hex	filename
  15782	   3696	    128	  19606	   4c96	drivers/media/i2c/mt9m001.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/mt9m001.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 5613072908ac..210ea76adb53 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -167,7 +167,7 @@ static int multi_reg_write(struct i2c_client *client,
 
 static int mt9m001_init(struct i2c_client *client)
 {
-	const struct mt9m001_reg init_regs[] = {
+	static const struct mt9m001_reg init_regs[] = {
 		/*
 		 * Issue a soft reset. This returns all registers to their
 		 * default values.
-- 
2.20.1
